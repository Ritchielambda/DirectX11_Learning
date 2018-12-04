
struct VS_OUTPUT
{
	float4 Pos : SV_POSITION;
	float2 TexCoord : TEXCOORD;
};
Texture2D ObjTexture1; 
//Texture2D ObjTexture2 : register(t1); 
SamplerState ObjSamplerState;
cbuffer cbPerObject1
{
    float4x4 WVP;
};

VS_OUTPUT VS(float4 inPos : POSITION,float2 inTexCoord : TEXCOORD)
{
    VS_OUTPUT output;
    output.Pos = mul(inPos, WVP);
    output.TexCoord = inTexCoord;

    return output;
}

float4 PS(VS_OUTPUT input) : SV_TARGET
{
    return ObjTexture.Sample( ObjSamplerState, input.TexCoord );
}