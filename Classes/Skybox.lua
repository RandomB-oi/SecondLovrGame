local module = {}
module.__index = module

-- local SkyboxModel = {
-- 	{pos = lovr.math.newVec3(0,  1000, 0), size = lovr.math.newVec2(2000,2000), rot = lovr.math.newQuat( math.pi/2,	1, 0, 0), texture = "top"},
-- 	{pos = lovr.math.newVec3(0, -1000, 0), size = lovr.math.newVec2(2000,2000), rot = lovr.math.newQuat(-math.pi/2,	1, 0, 0), texture = "bottom"},
-- 	{pos = lovr.math.newVec3(-1000, 0, 0), size = lovr.math.newVec2(2000,2000), rot = lovr.math.newQuat( math.pi/2,	0, 1, 0), texture = "back"},
-- 	{pos = lovr.math.newVec3( 1000, 0, 0), size = lovr.math.newVec2(2000,2000), rot = lovr.math.newQuat(-math.pi/2,	0, 1, 0), texture = "front"},
-- 	{pos = lovr.math.newVec3(0, 0,  1000), size = lovr.math.newVec2(2000,2000), rot = lovr.math.newQuat( math.pi,	0, 1, 0), texture = "left"},
-- 	{pos = lovr.math.newVec3(0, 0, -1000), size = lovr.math.newVec2(2000,2000), rot = lovr.math.newQuat(0,			0, 1, 0), texture = "right"},
-- }

module.new = function(textures)
	local self = setmetatable({}, module)

	self.Textures = textures

	return self
end

function module:Render(pass, pos)
	pass:setMaterial(self.Textures.top)
	pass:plane(pos + lovr.math.newVec3(0,  1000, 0), lovr.math.newVec2(2000,2000), lovr.math.newQuat( math.pi/2,	1, 0, 0), "fill")
	pass:setMaterial(self.Textures.bottom)
	pass:plane(pos + lovr.math.newVec3(0, -1000, 0), lovr.math.newVec2(2000,2000), lovr.math.newQuat(-math.pi/2,	1, 0, 0), "fill")
	pass:setMaterial(self.Textures.back)
	pass:plane(pos + lovr.math.newVec3(-1000, 0, 0), lovr.math.newVec2(2000,2000), lovr.math.newQuat( math.pi/2,	0, 1, 0), "fill")
	pass:setMaterial(self.Textures.front)
	pass:plane(pos + lovr.math.newVec3( 1000, 0, 0), lovr.math.newVec2(2000,2000), lovr.math.newQuat(-math.pi/2,	0, 1, 0), "fill")
	pass:setMaterial(self.Textures.left)
	pass:plane(pos + lovr.math.newVec3(0, 0,  1000), lovr.math.newVec2(2000,2000), lovr.math.newQuat( math.pi,		0, 1, 0), "fill")
	pass:setMaterial(self.Textures.right)
	pass:plane(pos + lovr.math.newVec3(0, 0, -1000), lovr.math.newVec2(2000,2000), lovr.math.newQuat(0,				0, 1, 0), "fill")
end

return module