//Get Mean slope from variance parameter
float slopeFromVar(float var)
{
	return clamp(1 - 0.3*var - 1.1*var*var, 0.0, 1.0);
}

//Rotate vector around a given axis by a designated angle
float3 rotateAxisAngle(float3 v, float3 axis, float angle)
{
    return v * cos(angle) +
            cross(axis, v) * sin(angle) +
            axis * dot(axis, v) * (1 - cos(angle));
}

//Inverse rotation of a normal for lighting rotation
float3 rotate(float3 n, float2 lAngles)
{
	n = rotateAxisAngle(n,float3(0,1,0),-lAngles.x);
	n = rotateAxisAngle(n,float3(1,0,0),-lAngles.y);
	return n;
}

float2 CartesianToSpherical( float3 dir )
{
    const float PI = 3.141592654;
    float phi = atan2( dir.x, dir.z );
    float theta = atan2(-dir.y, length(dir.xz));

    return float2( phi, theta);
}

float3 rotate2(float3 n, float3 dir)
{
    //return rotate(n, CartesianToSpherical(dir));
    float3 t = float3(0, 1, 0);
    float up = normalize(cross(t, dir));
    float theta = acos(dot(t, dir));
    return normalize(rotateAxisAngle(n, up, theta));
}

//Warp normal to a direction in the sphere domain depending on the mean slope
float3 NormalToDirection(float3 np, float mu, float3 e2)
{
    float3 up = normalize(cross(e2, np));
    float theta = acos(dot(e2, np));
	float3 wp = rotateAxisAngle(np, up, mu*theta);
	return wp;
}



//Get shading color from a specific component in a specific direction
float3 paraboloidMap(float3 wp, sampler2D componentFront, sampler2D componentBack)
{
	float2 texCoord = (wp.xy / (2*(1 + abs(wp.z)))) + float2(0.5, 0.5);
	if (wp.z > 0)
		return tex2D(componentFront , texCoord).rgb;
	else
		return tex2D(componentBack, texCoord).rgb;
}

//Returns the base energy as the average of the channels
float luminance(float3 color)
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
float3 matcapColor(float3 normal, float variance, sampler2D componentFront, sampler2D componentBack,
				 float3 baseColor, float theta, float theta0, float m1, float alpha1, float3 e2)
{
    float3 direction = NormalToDirection(normal, slopeFromVar(variance), e2);
	float3 shadingColor = paraboloidMap(direction, componentFront, componentBack);
	float alpha = 1 + (theta > theta0 ? silouetteEnergy(theta, theta0, m1, alpha1 - luminance(baseColor)) : 0);
	return shadingColor * baseColor * alpha;
}
