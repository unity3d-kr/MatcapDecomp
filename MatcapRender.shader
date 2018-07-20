// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "MatcapDecomp"
{
	Properties
	{
		[NoScaleOffset]_inLowFreqFront("inLowFreqFront", 2D) = "gray" {}
		[NoScaleOffset]_inLowFreqBack("inLowFreqBack", 2D) = "gray" {}
		_LowFreqVariance("LowFreqVariance", Float) = 0
		_LowFreqBaseColor("LowFreqBaseColor", Color) = (1,1,1,0)
		_LowFreqTheta0("LowFreqTheta0", Range( 0 , 0.5)) = 0
		_LowFreqM1("LowFreqM1", Float) = 0
		_LowFreqAlpha1("LowFreqAlpha1", Range( 0 , 1)) = 0
		[NoScaleOffset]_inHighFreqFront("inHighFreqFront", 2D) = "white" {}
		[NoScaleOffset]_inHighFreqBack("inHighFreqBack", 2D) = "black" {}
		_HighFreqVariance("HighFreqVariance", Float) = 0
		_HighFreqBaseColor("HighFreqBaseColor", Color) = (1,1,1,0)
		_HighFreqTheta0("HighFreqTheta0", Range( 0 , 0.5)) = 0
		_HighFreqM1("HighFreqM1", Float) = 0
		_HighFreqAlpha1("HighFreqAlpha1", Range( 0 , 1)) = 0
		_rotLightPhi("rotLightPhi", Range( -360 , 360)) = 0
		_rotLightTheta("rotLightTheta", Range( -360 , 360)) = 0
		[NoScaleOffset]_OcclusionMap("OcclusionMap", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#include "matcap.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float3 worldNormal;
			float3 worldPos;
			float2 uv_texcoord;
		};

		uniform float _LowFreqVariance;
		uniform sampler2D _inLowFreqFront;
		uniform sampler2D _inLowFreqBack;
		uniform float4 _LowFreqBaseColor;
		uniform float _rotLightTheta;
		uniform float _rotLightPhi;
		uniform float _LowFreqTheta0;
		uniform float _LowFreqM1;
		uniform float _LowFreqAlpha1;
		uniform float _HighFreqVariance;
		uniform sampler2D _inHighFreqFront;
		uniform sampler2D _inHighFreqBack;
		uniform float4 _HighFreqBaseColor;
		uniform float _HighFreqTheta0;
		uniform float _HighFreqM1;
		uniform float _HighFreqAlpha1;
		uniform sampler2D _OcclusionMap;


		float3 rotateNormal( float3 normal , float2 angle )
		{
			return rotate(normal, angle);
		}


		float3 matcap( float3 normal , float variance , sampler2D componentFront , sampler2D componentBack , float3 baseColor , float theta , float theta0 , float m1 , float alpha1 , float3 e2 )
		{
			return matcapColor(
			    normal,
			    variance, 
			    componentFront, 
			    componentBack,
			    baseColor, 
			    theta, 
			    theta0, 
			    m1, 
			    alpha1,
			    e2);
		}


		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 ase_worldNormal = i.worldNormal;
			float3 normal1 = ase_worldNormal;
			float variance1 = _LowFreqVariance;
			sampler2D componentFront1 = _inLowFreqFront;
			sampler2D componentBack1 = _inLowFreqBack;
			float3 baseColor1 = _LowFreqBaseColor.rgb;
			float3 normal9 = ase_worldNormal;
			float2 appendResult12 = (float2(_rotLightTheta , _rotLightPhi));
			float2 angle9 = radians( appendResult12 );
			float3 localrotateNormal9 = rotateNormal( normal9 , angle9 );
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 worldSpaceViewDir8 = WorldSpaceViewDir( float4( ase_vertex3Pos , 0.0 ) );
			float3 normalizeResult44 = normalize( worldSpaceViewDir8 );
			float dotResult15 = dot( localrotateNormal9 , normalizeResult44 );
			float temp_output_16_0 = acos( dotResult15 );
			float theta1 = temp_output_16_0;
			float theta01 = ( _LowFreqTheta0 * UNITY_PI );
			float m11 = _LowFreqM1;
			float alpha11 = _LowFreqAlpha1;
			float3 e21 = normalizeResult44;
			float3 localmatcap1 = matcap( normal1 , variance1 , componentFront1 , componentBack1 , baseColor1 , theta1 , theta01 , m11 , alpha11 , e21 );
			float3 normal2 = ase_worldNormal;
			float variance2 = _HighFreqVariance;
			sampler2D componentFront2 = _inHighFreqFront;
			sampler2D componentBack2 = _inHighFreqBack;
			float3 baseColor2 = _HighFreqBaseColor.rgb;
			float theta2 = temp_output_16_0;
			float theta02 = ( _HighFreqTheta0 * UNITY_PI );
			float m12 = _HighFreqM1;
			float alpha12 = _HighFreqAlpha1;
			float3 e22 = normalizeResult44;
			float3 localmatcap2 = matcap( normal2 , variance2 , componentFront2 , componentBack2 , baseColor2 , theta2 , theta02 , m12 , alpha12 , e22 );
			float2 uv_OcclusionMap5 = i.uv_texcoord;
			o.Emission = ( ( localmatcap1 + localmatcap2 ) * tex2D( _OcclusionMap, uv_OcclusionMap5 ).r );
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Unlit keepalpha fullforwardshadows noambient novertexlights nolightmap  nodynlightmap nodirlightmap nometa noforwardadd 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutput o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutput, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15310
-1457;96;1426;877;388.8387;204.4188;1;True;True
Node;AmplifyShaderEditor.RangedFloatNode;13;-2104.677,228.4647;Float;False;Property;_rotLightTheta;rotLightTheta;15;0;Create;True;0;0;False;0;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-2106.677,305.4647;Float;False;Property;_rotLightPhi;rotLightPhi;14;0;Create;True;0;0;False;0;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;43;-1823.344,385.6745;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;12;-1799.677,235.4647;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldSpaceViewDirHlpNode;8;-1612.586,386.6873;Float;False;1;0;FLOAT4;0,0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;7;-1643.264,83.06902;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RadiansOpNode;10;-1600.978,239.5411;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NormalizeNode;44;-1349.723,388.7499;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;9;-1411.978,213.541;Float;False;return rotate(normal, angle)@;3;False;2;True;normal;FLOAT3;0,0,0;In;True;angle;FLOAT2;0,0;In;rotateNormal;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;15;-1145.907,298.1353;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-1197.292,-169.3332;Float;False;Property;_LowFreqTheta0;LowFreqTheta0;4;0;Create;True;0;0;False;0;0;0;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-1166.689,996.7992;Float;False;Property;_HighFreqTheta0;HighFreqTheta0;11;0;Create;True;0;0;False;0;0;0;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;36;-738.1107,-204.0733;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TexturePropertyNode;27;-1533.45,-404.0776;Float;True;Property;_inLowFreqFront;inLowFreqFront;0;1;[NoScaleOffset];Create;True;0;0;False;0;None;12b5c9cf9d718844885b8f8bd20e1e43;False;gray;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-1168.708,1076.449;Float;False;Property;_HighFreqM1;HighFreqM1;12;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1168.88,1159.864;Float;False;Property;_HighFreqAlpha1;HighFreqAlpha1;13;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;31;-1172.325,824.9788;Float;False;Property;_HighFreqBaseColor;HighFreqBaseColor;10;0;Create;True;0;0;False;0;1,1,1,0;0.4431373,0.6039216,0.3058824,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;24;-1199.813,-5.269188;Float;False;Property;_LowFreqAlpha1;LowFreqAlpha1;6;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-1174.325,749.9787;Float;False;Property;_HighFreqVariance;HighFreqVariance;9;0;Create;True;0;0;False;0;0;0.059;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ACosOpNode;16;-1027.147,297.6049;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;38;-843.2393,863.4989;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1204.928,-416.1536;Float;False;Property;_LowFreqVariance;LowFreqVariance;2;0;Create;True;0;0;False;0;0;0.491;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;28;-1536.697,-204.4159;Float;True;Property;_inLowFreqBack;inLowFreqBack;1;1;[NoScaleOffset];Create;True;0;0;False;0;None;3dbe9d014c0c9c849bc1a8c7a9a3f491;False;gray;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TexturePropertyNode;34;-1459.161,955.8813;Float;True;Property;_inHighFreqBack;inHighFreqBack;8;1;[NoScaleOffset];Create;True;0;0;False;0;None;ae00333775910304990d56abaaafd3a1;False;black;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.PiNode;37;-904.4042,-29.31293;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;18;-1202.928,-341.1535;Float;False;Property;_LowFreqBaseColor;LowFreqBaseColor;3;0;Create;True;0;0;False;0;1,1,1,0;0.5450981,0.3607843,0.172549,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;35;-1455.914,758.2195;Float;True;Property;_inHighFreqFront;inHighFreqFront;7;1;[NoScaleOffset];Create;True;0;0;False;0;None;ced05aecb8447444ab9f17f12dc535ed;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-1196.641,-89.68327;Float;False;Property;_LowFreqM1;LowFreqM1;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1;-418.4818,75.39334;Float;False;return matcapColor($    normal,$    variance, $    componentFront, $    componentBack,$    baseColor, $    theta, $    theta0, $    m1, $    alpha1,$    e2)@;3;False;10;True;normal;FLOAT3;0,0,0;In;True;variance;FLOAT;0;In;True;componentFront;SAMPLER2D;sampler21;In;True;componentBack;SAMPLER2D;sampler31;In;True;baseColor;FLOAT3;0,0,0;In;True;theta;FLOAT;0;In;True;theta0;FLOAT;0;In;True;m1;FLOAT;0;In;True;alpha1;FLOAT;0;In;True;e2;FLOAT3;0,0,0;In;matcap;False;False;10;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;SAMPLER2D;sampler21;False;3;SAMPLER2D;sampler31;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;2;-427.1545,598.6866;Float;False;return matcapColor($    normal,$    variance, $    componentFront, $    componentBack,$    baseColor, $    theta, $    theta0, $    m1, $    alpha1,$    e2)@;3;False;10;True;normal;FLOAT3;0,0,0;In;True;variance;FLOAT;0;In;True;componentFront;SAMPLER2D;sampler22;In;True;componentBack;SAMPLER2D;sampler32;In;True;baseColor;FLOAT3;0,0,0;In;True;theta;FLOAT;0;In;True;theta0;FLOAT;0;In;True;m1;FLOAT;0;In;True;alpha1;FLOAT;0;In;True;e2;FLOAT3;0,0,0;In;matcap;False;False;10;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;SAMPLER2D;sampler22;False;3;SAMPLER2D;sampler32;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;5;-101.2815,451.4122;Float;True;Property;_OcclusionMap;OcclusionMap;16;1;[NoScaleOffset];Create;True;0;0;False;0;None;cc24b8297076fd44bbb2bc5ca8e3d284;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;3;-28.14895,233.2899;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;156.1166,235.1049;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;49;333.8506,191.3473;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;MatcapDecomp;False;False;False;False;True;True;True;True;True;False;True;True;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;1;matcap.cginc;0;0;False;0;0;0;False;-1;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;12;0;13;0
WireConnection;12;1;14;0
WireConnection;8;0;43;0
WireConnection;10;0;12;0
WireConnection;44;0;8;0
WireConnection;9;0;7;0
WireConnection;9;1;10;0
WireConnection;15;0;9;0
WireConnection;15;1;44;0
WireConnection;16;0;15;0
WireConnection;38;0;32;0
WireConnection;37;0;22;0
WireConnection;1;0;36;0
WireConnection;1;1;17;0
WireConnection;1;2;27;0
WireConnection;1;3;28;0
WireConnection;1;4;18;0
WireConnection;1;5;16;0
WireConnection;1;6;37;0
WireConnection;1;7;23;0
WireConnection;1;8;24;0
WireConnection;1;9;44;0
WireConnection;2;0;36;0
WireConnection;2;1;30;0
WireConnection;2;2;35;0
WireConnection;2;3;34;0
WireConnection;2;4;31;0
WireConnection;2;5;16;0
WireConnection;2;6;38;0
WireConnection;2;7;33;0
WireConnection;2;8;29;0
WireConnection;2;9;44;0
WireConnection;3;0;1;0
WireConnection;3;1;2;0
WireConnection;4;0;3;0
WireConnection;4;1;5;1
WireConnection;49;2;4;0
ASEEND*/
//CHKSM=A8A5815628D4C4999DA2E152E8224CC04754195D