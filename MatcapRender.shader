// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,tags:,iptp:0,cusa:False,uhfp:True,usps:,shfs:,bamd:0,cgin:bQBhAHQAYwBhAHAA,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,frcm:False,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,uvmd:1,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,bprm:False,altm:False,dpts:2,wrdp:True,ppdw:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34156,y:32390,varname:node_3138,prsc:2|normal-5402-RGB,custl-6048-OUT;n:type:ShaderForge.SFN_ValueProperty,id:57,x:32403,y:33198,ptovrint:False,ptlb:LowFreqVariance,ptin:_LowFreqVariance,varname:_LowFreqVariance,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:1022,x:32403,y:33318,ptovrint:False,ptlb:LowFreqBaseColor,ptin:_LowFreqBaseColor,varname:_LowFreqBaseColor,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:1521,x:32246,y:33535,ptovrint:False,ptlb:LowFreqTheta0,ptin:_LowFreqTheta0,varname:_LowFreqTheta0,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.5;n:type:ShaderForge.SFN_Pi,id:8384,x:32436,y:33597,varname:node_8384,prsc:1;n:type:ShaderForge.SFN_Multiply,id:2189,x:32571,y:33535,varname:node_2189,prsc:1|A-1521-OUT,B-8384-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1869,x:32325,y:33694,ptovrint:False,ptlb:LowFreqM1,ptin:_LowFreqM1,varname:_LowFreqM1,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Slider,id:3727,x:32246,y:33824,ptovrint:False,ptlb:LowFreqAlpha1,ptin:_LowFreqAlpha1,varname:_LowFreqAlpha1,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_ValueProperty,id:3825,x:32847,y:33600,ptovrint:False,ptlb:HighFreqVariance,ptin:_HighFreqVariance,varname:_HighFreqVariance,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:8291,x:32847,y:33726,ptovrint:False,ptlb:HighFreqBaseColor,ptin:_HighFreqBaseColor,varname:_HighFreqBaseColor,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:3689,x:32709,y:33933,ptovrint:False,ptlb:HighFreqTheta0,ptin:_HighFreqTheta0,varname:_HighFreqTheta0,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.5;n:type:ShaderForge.SFN_Pi,id:8148,x:32899,y:33995,varname:node_8148,prsc:1;n:type:ShaderForge.SFN_Multiply,id:7702,x:33033,y:33933,varname:node_7702,prsc:1|A-3689-OUT,B-8148-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7621,x:32787,y:34092,ptovrint:False,ptlb:HighFreqM1,ptin:_HighFreqM1,varname:_HighFreqM1,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Slider,id:5406,x:32709,y:34222,ptovrint:False,ptlb:HighFreqAlpha1,ptin:_HighFreqAlpha1,varname:_HighFreqAlpha1,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:5402,x:33946,y:32470,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:_NormalMap,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Code,id:6248,x:33282,y:33102,varname:node_6248,prsc:1,code:cgBlAHQAdQByAG4AIABtAGEAdABjAGEAcABDAG8AbABvAHIAKAAKAG4AbwByAG0AYQBsACwACgB2AGEAcgBpAGEAbgBjAGUALAAgAAoAYwBvAG0AcABvAG4AZQBuAHQARgByAG8AbgB0ACwAIAAKAGMAbwBtAHAAbwBuAGUAbgB0AEIAYQBjAGsALAAKAGIAYQBzAGUAQwBvAGwAbwByACwAIAAKAHQAaABlAHQAYQAsACAACgB0AGgAZQB0AGEAMAAsACAACgBtADEALAAgAAoAYQBsAHAAaABhADEALAAKAGUAMgApADsA,output:6,fname:highfreq,width:247,height:248,input:6,input:4,input:12,input:12,input:6,input:4,input:4,input:4,input:4,input:6,input_1_label:normal,input_2_label:variance,input_3_label:componentFront,input_4_label:componentBack,input_5_label:baseColor,input_6_label:theta,input_7_label:theta0,input_8_label:m1,input_9_label:alpha1,input_10_label:e2|A-1838-OUT,B-3825-OUT,C-4376-TEX,D-2546-TEX,E-8291-RGB,F-6364-OUT,G-7702-OUT,H-7621-OUT,I-5406-OUT,J-8380-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6851,x:32403,y:32782,ptovrint:False,ptlb:inLowFreqFront,ptin:_inLowFreqFront,varname:_inLowFreqFront,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:True,tagnrm:False,ntxv:1,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:3092,x:32403,y:32998,ptovrint:False,ptlb:inLowFreqBack,ptin:_inLowFreqBack,varname:_inLowFreqBack,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:True,tagnrm:False,ntxv:1,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:4376,x:32847,y:33174,ptovrint:False,ptlb:inHighFreqFront,ptin:_inHighFreqFront,varname:_inHighFreqFront,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:True,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:2546,x:32847,y:33391,ptovrint:False,ptlb:inHighFreqBack,ptin:_inHighFreqBack,varname:_inHighFreqBack,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:True,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Code,id:8383,x:32832,y:32706,varname:node_8383,prsc:1,code:cgBlAHQAdQByAG4AIABtAGEAdABjAGEAcABDAG8AbABvAHIAKAAKAG4AbwByAG0AYQBsACwACgB2AGEAcgBpAGEAbgBjAGUALAAgAAoAYwBvAG0AcABvAG4AZQBuAHQARgByAG8AbgB0ACwAIAAKAGMAbwBtAHAAbwBuAGUAbgB0AEIAYQBjAGsALAAKAGIAYQBzAGUAQwBvAGwAbwByACwAIAAKAHQAaABlAHQAYQAsACAACgB0AGgAZQB0AGEAMAAsACAACgBtADEALAAgAAoAYQBsAHAAaABhADEALAAKAGUAMgApADsA,output:6,fname:lowfreq,width:247,height:248,input:6,input:4,input:12,input:12,input:6,input:4,input:4,input:4,input:4,input:6,input_1_label:normal,input_2_label:variance,input_3_label:componentFront,input_4_label:componentBack,input_5_label:baseColor,input_6_label:theta,input_7_label:theta0,input_8_label:m1,input_9_label:alpha1,input_10_label:e2|A-3966-OUT,B-57-OUT,C-6851-TEX,D-3092-TEX,E-1022-RGB,F-6364-OUT,G-2189-OUT,H-1869-OUT,I-3727-OUT,J-4366-OUT;n:type:ShaderForge.SFN_Dot,id:2076,x:32077,y:32434,varname:node_2076,prsc:1,dt:0|A-6803-OUT,B-6636-OUT;n:type:ShaderForge.SFN_ArcCos,id:335,x:32248,y:32434,varname:node_335,prsc:1|IN-2076-OUT;n:type:ShaderForge.SFN_Relay,id:6364,x:32403,y:32434,varname:theta,prsc:1|IN-335-OUT;n:type:ShaderForge.SFN_NormalVector,id:8178,x:32492,y:31233,prsc:1,pt:True;n:type:ShaderForge.SFN_Set,id:8327,x:33603,y:31313,varname:normal,prsc:1|IN-6536-OUT;n:type:ShaderForge.SFN_Get,id:6636,x:31888,y:32548,varname:node_6636,prsc:1|IN-8327-OUT;n:type:ShaderForge.SFN_Get,id:3966,x:32403,y:32706,varname:node_3966,prsc:1|IN-8327-OUT;n:type:ShaderForge.SFN_Get,id:1838,x:32847,y:33092,varname:node_1838,prsc:1|IN-8327-OUT;n:type:ShaderForge.SFN_Add,id:8939,x:33678,y:32710,varname:node_8939,prsc:1|A-8383-OUT,B-6248-OUT;n:type:ShaderForge.SFN_ViewVector,id:3664,x:31689,y:32091,varname:node_3664,prsc:1;n:type:ShaderForge.SFN_Pi,id:9357,x:32492,y:31377,varname:node_9357,prsc:1;n:type:ShaderForge.SFN_Vector3,id:4855,x:31689,y:32214,varname:node_4855,prsc:1,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Set,id:2063,x:31892,y:32194,varname:e2,prsc:1|IN-3664-OUT;n:type:ShaderForge.SFN_Get,id:6803,x:31888,y:32434,varname:node_6803,prsc:1|IN-2063-OUT;n:type:ShaderForge.SFN_Get,id:4366,x:32403,y:32646,varname:node_4366,prsc:1|IN-2063-OUT;n:type:ShaderForge.SFN_Get,id:8380,x:32847,y:33038,varname:node_8380,prsc:1|IN-2063-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:6536,x:33430,y:31313,ptovrint:False,ptlb:UseLightRotation,ptin:_UseLightRotation,varname:_UseLightRotation,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-28-OUT,B-5639-OUT;n:type:ShaderForge.SFN_Code,id:28,x:32741,y:31248,varname:node_28,prsc:1,code:cgBlAHQAdQByAG4AIAByAG8AdABhAHQAZQAoAG4AbwByAG0AYQBsACwAIABoAGEAbABmADIAKAB0AGgAZQB0AGEALAAgAHAAaABpACkAIAAqACAAcABpACAALwAgADEAOAAwACkAOwA=,output:6,fname:normalRotate2,width:414,height:128,input:6,input:4,input:4,input:4,input_1_label:normal,input_2_label:theta,input_3_label:phi,input_4_label:pi|A-8178-OUT,B-2591-OUT,C-174-OUT,D-9357-OUT;n:type:ShaderForge.SFN_Slider,id:2591,x:32152,y:31230,ptovrint:False,ptlb:rotLightTheta,ptin:_rotLightTheta,varname:_rotLightTheta,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-360,cur:0,max:360;n:type:ShaderForge.SFN_Slider,id:174,x:32152,y:31326,ptovrint:False,ptlb:rotLightPhi,ptin:_rotLightPhi,varname:_rotLightPhi,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-360,cur:0,max:360;n:type:ShaderForge.SFN_Tex2d,id:2529,x:33140,y:32354,ptovrint:False,ptlb:OcclusionMap,ptin:_OcclusionMap,varname:_OcclusionMap,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:True,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:7798,x:33359,y:32371,varname:node_7798,prsc:1|A-8455-OUT,B-2529-G,T-5312-OUT;n:type:ShaderForge.SFN_Slider,id:5312,x:33013,y:32537,ptovrint:False,ptlb:OcclusionStrength,ptin:_OcclusionStrength,varname:_OcclusionStrength,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:8455,x:33140,y:32279,varname:node_8455,prsc:1,v1:1;n:type:ShaderForge.SFN_Multiply,id:6048,x:33852,y:32710,varname:node_6048,prsc:1|A-8939-OUT,B-7798-OUT;n:type:ShaderForge.SFN_Code,id:5639,x:32741,y:31431,varname:node_5639,prsc:1,code:cgBlAHQAdQByAG4AIAByAG8AdABhAHQAZQAyACgAbgBvAHIAbQBhAGwALAAgAGQAaQByACkAOwA=,output:6,fname:normalRotate1,width:342,height:114,input:6,input:6,input_1_label:normal,input_2_label:dir|A-8178-OUT,B-4757-OUT;n:type:ShaderForge.SFN_LightVector,id:405,x:32336,y:31537,varname:node_405,prsc:1;n:type:ShaderForge.SFN_Normalize,id:2656,x:33266,y:31751,varname:node_2656,prsc:1|IN-63-OUT;n:type:ShaderForge.SFN_NormalVector,id:2015,x:32556,y:31749,prsc:1,pt:True;n:type:ShaderForge.SFN_Vector3,id:5681,x:32556,y:31914,varname:node_5681,prsc:1,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_LightVector,id:951,x:32556,y:32029,varname:node_951,prsc:1;n:type:ShaderForge.SFN_Subtract,id:7046,x:32746,y:31914,varname:node_7046,prsc:1|A-5681-OUT,B-951-OUT;n:type:ShaderForge.SFN_Transform,id:8730,x:32914,y:31914,varname:node_8730,prsc:1,tffrom:2,tfto:0|IN-7046-OUT;n:type:ShaderForge.SFN_Add,id:63,x:33095,y:31751,varname:node_63,prsc:1|A-2015-OUT,B-8730-XYZ;n:type:ShaderForge.SFN_Get,id:9806,x:33753,y:32268,varname:node_9806,prsc:1|IN-8327-OUT;n:type:ShaderForge.SFN_RemapRange,id:4557,x:33946,y:32268,varname:node_4557,prsc:1,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9806-OUT;n:type:ShaderForge.SFN_Negate,id:4757,x:32556,y:31537,varname:node_4757,prsc:1|IN-405-OUT;proporder:5402-6851-3092-57-1022-1521-1869-3727-4376-2546-3825-8291-3689-7621-5406-6536-2591-174-2529-5312;pass:END;sub:END;*/

Shader "MatcapRender" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        [NoScaleOffset]_inLowFreqFront ("inLowFreqFront", 2D) = "gray" {}
        [NoScaleOffset]_inLowFreqBack ("inLowFreqBack", 2D) = "gray" {}
        _LowFreqVariance ("LowFreqVariance", Float ) = 0
        _LowFreqBaseColor ("LowFreqBaseColor", Color) = (1,1,1,1)
        _LowFreqTheta0 ("LowFreqTheta0", Range(0, 0.5)) = 0
        _LowFreqM1 ("LowFreqM1", Float ) = 0
        _LowFreqAlpha1 ("LowFreqAlpha1", Range(0, 1)) = 0
        [NoScaleOffset]_inHighFreqFront ("inHighFreqFront", 2D) = "white" {}
        [NoScaleOffset]_inHighFreqBack ("inHighFreqBack", 2D) = "black" {}
        _HighFreqVariance ("HighFreqVariance", Float ) = 0
        _HighFreqBaseColor ("HighFreqBaseColor", Color) = (1,1,1,1)
        _HighFreqTheta0 ("HighFreqTheta0", Range(0, 0.5)) = 0
        _HighFreqM1 ("HighFreqM1", Float ) = 0
        _HighFreqAlpha1 ("HighFreqAlpha1", Range(0, 1)) = 0
        [MaterialToggle] _UseLightRotation ("UseLightRotation", Float ) = 0
        _rotLightTheta ("rotLightTheta", Range(-360, 360)) = 0
        _rotLightPhi ("rotLightPhi", Range(-360, 360)) = 0
        [NoScaleOffset]_OcclusionMap ("OcclusionMap", 2D) = "white" {}
        _OcclusionStrength ("OcclusionStrength", Range(0, 1)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define FLOAT half
            #define FLOAT2 half2
            #define FLOAT3 half3
            #define FLOAT4 half4
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "matcap.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 psp2 n3ds wiiu 
            #pragma target 3.0
            uniform half _LowFreqVariance;
            uniform half4 _LowFreqBaseColor;
            uniform half _LowFreqTheta0;
            uniform half _LowFreqM1;
            uniform half _LowFreqAlpha1;
            uniform half _HighFreqVariance;
            uniform half4 _HighFreqBaseColor;
            uniform half _HighFreqTheta0;
            uniform half _HighFreqM1;
            uniform half _HighFreqAlpha1;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            half3 highfreq( half3 normal , half variance , sampler2D componentFront , sampler2D componentBack , half3 baseColor , half theta , half theta0 , half m1 , half alpha1 , half3 e2 )
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
            
            uniform sampler2D _inLowFreqFront;
            uniform sampler2D _inLowFreqBack;
            uniform sampler2D _inHighFreqFront;
            uniform sampler2D _inHighFreqBack;
            half3 lowfreq( half3 normal , half variance , sampler2D componentFront , sampler2D componentBack , half3 baseColor , half theta , half theta0 , half m1 , half alpha1 , half3 e2 )
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
            
            uniform half _UseLightRotation;
            half3 normalRotate2( half3 normal , half theta , half phi , half pi )
            {
            	return rotate(normal, half2(theta, phi) * pi / 180);
            }
            
            uniform half _rotLightTheta;
            uniform half _rotLightPhi;
            uniform sampler2D _OcclusionMap;
            uniform half _OcclusionStrength;
            half3 normalRotate1( half3 normal , half3 dir )
            {
            	return rotate2(normal, dir);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float4 tangent : TANGENT;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                FLOAT3 normalDir : TEXCOORD2;
                FLOAT3 tangentDir : TEXCOORD3;
                FLOAT3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = TRANSFORM_TEX(v.texcoord0, _NormalMap);
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, FLOAT4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir)) * (v.tangent.w * unity_WorldTransformParams.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            FLOAT4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                FLOAT3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                half3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,i.uv0));
                FLOAT3 normalLocal = normalize(_NormalMap_var.rgb);
                FLOAT3 normalDirection = mul( normalLocal, tangentTransform ); // Perturbed normals
                FLOAT3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                half3 normal = lerp( normalRotate2( normalDirection , _rotLightTheta , _rotLightPhi , 3.141592654 ), normalRotate1( normalDirection , (-1*lightDirection) ), _UseLightRotation );
                half3 e2 = viewDirection;
                half theta = acos(dot(e2,normal));
                half4 _OcclusionMap_var = tex2D(_OcclusionMap,i.uv0);
                FLOAT3 finalColor = ((lowfreq( normal , _LowFreqVariance , _inLowFreqFront , _inLowFreqBack , _LowFreqBaseColor.rgb , theta , (_LowFreqTheta0*3.141592654) , _LowFreqM1 , _LowFreqAlpha1 , e2 )+highfreq( normal , _HighFreqVariance , _inHighFreqFront , _inHighFreqBack , _HighFreqBaseColor.rgb , theta , (_HighFreqTheta0*3.141592654) , _HighFreqM1 , _HighFreqAlpha1 , e2 ))*lerp(1.0,_OcclusionMap_var.g,_OcclusionStrength));
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define FLOAT half
            #define FLOAT2 half2
            #define FLOAT3 half3
            #define FLOAT4 half4
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "matcap.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 psp2 n3ds wiiu 
            #pragma target 3.0
            uniform half _LowFreqVariance;
            uniform half4 _LowFreqBaseColor;
            uniform half _LowFreqTheta0;
            uniform half _LowFreqM1;
            uniform half _LowFreqAlpha1;
            uniform half _HighFreqVariance;
            uniform half4 _HighFreqBaseColor;
            uniform half _HighFreqTheta0;
            uniform half _HighFreqM1;
            uniform half _HighFreqAlpha1;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            half3 highfreq( half3 normal , half variance , sampler2D componentFront , sampler2D componentBack , half3 baseColor , half theta , half theta0 , half m1 , half alpha1 , half3 e2 )
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
            
            uniform sampler2D _inLowFreqFront;
            uniform sampler2D _inLowFreqBack;
            uniform sampler2D _inHighFreqFront;
            uniform sampler2D _inHighFreqBack;
            half3 lowfreq( half3 normal , half variance , sampler2D componentFront , sampler2D componentBack , half3 baseColor , half theta , half theta0 , half m1 , half alpha1 , half3 e2 )
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
            
            uniform half _UseLightRotation;
            half3 normalRotate2( half3 normal , half theta , half phi , half pi )
            {
            	return rotate(normal, half2(theta, phi) * pi / 180);
            }
            
            uniform half _rotLightTheta;
            uniform half _rotLightPhi;
            uniform sampler2D _OcclusionMap;
            uniform half _OcclusionStrength;
            half3 normalRotate1( half3 normal , half3 dir )
            {
            	return rotate2(normal, dir);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float4 tangent : TANGENT;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                FLOAT3 normalDir : TEXCOORD2;
                FLOAT3 tangentDir : TEXCOORD3;
                FLOAT3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = TRANSFORM_TEX(v.texcoord0, _NormalMap);
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, FLOAT4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir)) * (v.tangent.w * unity_WorldTransformParams.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            FLOAT4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                FLOAT3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                half3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,i.uv0));
                FLOAT3 normalLocal = normalize(_NormalMap_var.rgb);
                FLOAT3 normalDirection = mul( normalLocal, tangentTransform ); // Perturbed normals
                FLOAT3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                half3 normal = lerp( normalRotate2( normalDirection , _rotLightTheta , _rotLightPhi , 3.141592654 ), normalRotate1( normalDirection , (-1*lightDirection) ), _UseLightRotation );
                half3 e2 = viewDirection;
                half theta = acos(dot(e2,normal));
                half4 _OcclusionMap_var = tex2D(_OcclusionMap,i.uv0);
                FLOAT3 finalColor = ((lowfreq( normal , _LowFreqVariance , _inLowFreqFront , _inLowFreqBack , _LowFreqBaseColor.rgb , theta , (_LowFreqTheta0*3.141592654) , _LowFreqM1 , _LowFreqAlpha1 , e2 )+highfreq( normal , _HighFreqVariance , _inHighFreqFront , _inHighFreqBack , _HighFreqBaseColor.rgb , theta , (_HighFreqTheta0*3.141592654) , _HighFreqM1 , _HighFreqAlpha1 , e2 ))*lerp(1.0,_OcclusionMap_var.g,_OcclusionStrength));
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
