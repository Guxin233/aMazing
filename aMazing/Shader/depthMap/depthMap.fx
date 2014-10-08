Texture2D txDiffuse : register( t0 );
SamplerState samLinear : register( s0 );

cbuffer cameraMatrices : register( b0 )
{
	matrix World;
	matrix View;
    matrix Projection;
};

cbuffer PRS : register(b1)
{
	matrix Pos;
	matrix Rot;
	matrix Sca;
}

cbuffer LightMatrices : register(b2)
{
	matrix LightView;
	matrix LightProjection;
}


struct VS_INPUT
{
    float4 Pos : POSITION;
};

struct PS_INPUT
{
    float4 Pos : SV_POSITION;
    float4 depthPosition : TEXCOORD0;
};

PS_INPUT VSEntry( VS_INPUT input )
{
    PS_INPUT output = (PS_INPUT)0;
    input.Pos.w = 1.0f;
    output.Pos = input.Pos;
    output.Pos = mul( output.Pos, Rot);
    output.Pos = mul( output.Pos, Sca);
    output.Pos = mul( output.Pos, Pos);
    output.Pos = mul( output.Pos, World );
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.depthPosition = output.Pos;
    return output;
}

float4 PSEntry(PS_INPUT input) : SV_Target
{
    float val = input.depthPosition.z / input.depthPosition.w;
    return float4(val,val,input.depthPosition.z,input.depthPosition.w);
}