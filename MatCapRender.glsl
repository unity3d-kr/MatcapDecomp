////////////////////////////////////////////////////////////////////////////////////////////////////
//   Rendering using A Decomposed MatCap                                                         //
//                                                                                               //
//   Implementation of publication: "MatCap Decomposition for Dynamic Appearance Manipulation"   //
//                                   published at EGSR 2015 EI&I track                           //
//   Authors: C.J. Zubiaga, A. Muñoz, L. Belcour, C. Bosch and P. Barla                          //
//                                                                                               //
//   Description: Shades an arbitrary object using its normals in screenspace. Each normal       //
//                is warped to a reflection vector depending on the estimated variance of an     //
//                original MatCap. This vector is used to pickup a color in the spherical        //
//                representation (Paraboloid Map). It is then multiply by the base energy.       //
//                Additionally lighting can be rotated and silhouette effects can be added      //
//                                                                                              //
//   Arguments: -inNormals: Normals in screen space                                             //
//              -in[Low/High]Freq[Front/Back]: Sampler for [Low/High]Freq[Front/Back] texture   //
//              -[Low/High]Variance: Estimated variance in the orignal MatCap                   //
//              -[Low/High]FreqBaseColor: Estimated Base Color (Energy) from the MatCap         //
//              -[Low/High]Theta0: Starting elevation angle for the silhouette effect           //
//              -[Low/High]M1: Slope at Pi/2 for the silhouette effect                          //
//              -[Low/High]Alpha1: Final value for the silhouette effect                        //
//              -rotLight[Theta/Phi]: Rotation angles of the environment lighting               //
//                                                                                              //
//   Shader Author: Carlos J Zubiaga <carlos.zubiaga@inria.fr>                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////
#version 420

layout(location = 0) out vec4 outColor;
uniform sampler2D inNormals;//Normals in screen space

//LowFreq component input
uniform sampler2D inLowFreqFront;
uniform sampler2D inLowFreqBack;
uniform float LowFreqVariance;
uniform vec3 LowFreqBaseColor;
uniform float LowFreqTheta0; //Initial elevation angle of the  silhouette effect [0:PI/2]
uniform float LowFreqM1;//Steepness of the silhouette effect [-Inf:+Inf]
uniform float LowFreqAlpha1;//Final value of the silhouette effect [0:1]

//HighFreq component input
uniform sampler2D inHighFreqFront;
uniform sampler2D inHighFreqBack;
uniform float HighFreqVariance;
uniform vec3 HighFreqBaseColor;
uniform float HighFreqTheta0;//Initial elevation angle of the  silhouette effect [0:PI/2]
uniform float HighFreqM1;//Steepness of the silhouette effect [-Inf:+Inf]
uniform float HighFreqAlpha1;//Final value of the silhouette effect [0:1]

//Optional lighting rotation expressed as a sequence of rotations
uniform float rotLightTheta;//[0:2*PI]
uniform float rotLightPhi;//[0:2*PI]

in vec2 texcoord;
const vec3 e2 =vec3(0,0,1);//View Vector

//Get Mean slope from variance parameter
float slopeFromVar(float var)
{
	return clamp(1 - 0.3*var - 1.1*var*var, 0.0, 1.0);
}

//Rotate vector around a given axis by a designated angle
vec3 rotateAxisAngle(vec3 vector, vec3 axis, float angle)
{
    return vector * cos(angle) +
            cross(axis, vector) * sin(angle) +
            axis * dot(axis, vector) * (1 - cos(angle));
}

//Inverse rotation of a normal for lighting rotation
vec3 rotate(vec3 n, vec2 lAngles)
{
	n = rotateAxisAngle(n,vec3(0,1,0),-lAngles.x);
	n = rotateAxisAngle(n,vec3(1,0,0),-lAngles.y);
	return n;
}

//Warp normal to a direction in the sphere domain depending on the mean slope
vec3 NormalToDirection(vec3 np, float mu)
{
    vec3 up = normalize(cross(e2, np));
    float theta = acos(dot(e2, np));
	vec3 wp = rotateAxisAngle(np, up, mu*theta);
	return wp;
}

//Get shading color from a specific component in a specific direction
vec3 paraboloidMap(vec3 wp, sampler2D componentFront, sampler2D componentBack)
{
	vec2 texCoord = (wp.xy / (2*(1 + abs(wp.z)))) + vec2(0.5);
	if (wp.z > 0)
		return texture(componentFront , texCoord).rgb;
	else
		return texture(componentBack, texCoord).rgb;
}

//Returns the base energy as the average of the channels
float luminance(vec3 color)
{
	return (color.r + color.g + color.b) / 3;
}

//A Hermit spline reproduces the silhouette effect
float silouetteEnergy(float theta, float theta0, float m1,  float alpha1)
{
	const float pi2 = 1.57079632679;

	float t = (theta - theta0) / (pi2 - theta0);
	return (-2*t*t*t+3*t*t + (t*t*t-t*t)*m1)*alpha1;
}

//Gets the color of a component related to a normal
vec3 matcapColor(vec3 normal, float variance, sampler2D componentFront, sampler2D componentBack,
				 vec3 baseColor, float theta, float theta0, float m1, float alpha1)
{
	vec3 direction =  NormalToDirection(normal, slopeFromVar(variance));
	vec3 shadingColor = paraboloidMap(direction, componentFront, componentBack);
	float alpha = 1 + (theta > theta0 ? silouetteEnergy(theta, theta0, m1, alpha1 - luminance(baseColor)) : 0);
	return shadingColor * baseColor * alpha;
}

void main()
{
	vec3 normal = texture(inNormals, texcoord).xyz;
	if (normal==vec3(0.0))
	{
		outColor= vec4(vec3(0.5),1);
	}
	else
	{
		normal = normalize(normal);

		//theta is the view elevation angle
		float theta = acos(dot(e2, normal));

		//Apply lighting rotation
		normal = rotate(normal, vec2(rotLightTheta, rotLightPhi));

		//Compute each component color independently
		vec3 LowFreqColor = matcapColor(normal, LowFreqVariance, inLowFreqFront, inLowFreqFront,
										LowFreqBaseColor, theta, LowFreqTheta0, LowFreqM1, LowFreqAlpha1);

		vec3 HighFreqColor = matcapColor(normal, HighFreqVariance, inHighFreqFront, inHighFreqFront,
										HighFreqBaseColor, theta, HighFreqTheta0, HighFreqM1, HighFreqAlpha1);

		//Additive combination of components
		outColor = vec4(LowFreqColor + HighFreqColor, 1);
	}
}
