#pragma once
#include "../system/TextureObject.hpp"

namespace aMazing
{
	enum TEXTURE_SEMANTIC
	{
		BLUR_VERTICAL_1,
		BLUR_VERTICAL_2,
		BLUR_VERTICAL_3,
		BLUR_VERTICAL_4,
		BLUR_VERTICAL_5,
		BLUR_VERTICAL_6,
		BLUR_VERTICAL_7,
		BLUR_VERTICAL_8,
		BLUR_VERTICAL_9,

		BLUR_HORIZONTAL_1,
		BLUR_HORIZONTAL_2,
		BLUR_HORIZONTAL_3,
		BLUR_HORIZONTAL_4,
		BLUR_HORIZONTAL_5,
		BLUR_HORIZONTAL_6,
		BLUR_HORIZONTAL_7,
		BLUR_HORIZONTAL_8,
		BLUR_HORIZONTAL_9,

		CAMERA_DEPTH_1,
		CAMERA_DEPTH_2,
		CAMERA_DEPTH_3,
		CAMERA_DEPTH_4,
		CAMERA_DEPTH_5,
		CAMERA_DEPTH_6,
		CAMERA_DEPTH_7,
		CAMERA_DEPTH_8,
		CAMERA_DEPTH_9,

		LIGHT_CAMERA_DEPTH_1,
		LIGHT_CAMERA_DEPTH_2,
		LIGHT_CAMERA_DEPTH_3,
		LIGHT_CAMERA_DEPTH_4,
		LIGHT_CAMERA_DEPTH_5,
		LIGHT_CAMERA_DEPTH_6,
		LIGHT_CAMERA_DEPTH_7,
		LIGHT_CAMERA_DEPTH_8,
		LIGHT_CAMERA_DEPTH_9,
	};
	class SemanticTexture
	{
	public:
		explicit SemanticTexture() = delete;
		explicit SemanticTexture(TEXTURE_SEMANTIC sem)
		{
			semantic = sem;
		}
		TEXTURE_SEMANTIC getSemantic() const
		{
			return semantic;
		}
	private:
		//Once the semantic is set.It won't change.
		TEXTURE_SEMANTIC semantic;
		TextureObject texture;
	};
}
