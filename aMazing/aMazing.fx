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

struct VS_INPUT
{
    float4 Pos : POSITION;
    float2 Tex : TEXCOORD0;
};

struct PS_INPUT
{
    float4 Pos : SV_POSITION;
    float2 Tex : TEXCOORD0;
};

PS_INPUT VS( VS_INPUT input )
{
    PS_INPUT output = (PS_INPUT)0;

	output.Pos = input.Pos;
	output.Pos = mul( output.Pos, Rot);
	output.Pos = mul( output.Pos, Sca);
	output.Pos = mul( output.Pos, Pos);
	output.Pos = mul( output.Pos, World );
    output.Pos = mul( output.Pos, View );
    output.Pos = mul( output.Pos, Projection );
    output.Tex = input.Tex;    
    return output;
}

float4 PS( PS_INPUT input) : SV_Target
{
	float4 color = txDiffuse.Sample(samLinear, input.Tex);
	clip(color.a == 0.0f ? -1 : 1);
	return color;
}