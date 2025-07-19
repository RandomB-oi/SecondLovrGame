math = require("Util.Math")

local CameraClass = require("Classes.Camera")
local SkyboxClass = require("Classes.Skybox")

local Camera
local Skybox

local WorldTerrain

function lovr.load()
	lovr.mouse = require("LovrModules.lovr-mouse")
	-- lovr.mouse.setRelativeMode(true)

	WorldTerrain = lovr.graphics.newModel('Models/untitled.obj')

	-- Camera = CameraClass.new()
	Skybox = SkyboxClass.new({
		top = lovr.graphics.newTexture("Textures/sky512_up.png"),
		bottom = lovr.graphics.newTexture("Textures/sky512_dn.png"),
		left = lovr.graphics.newTexture("Textures/sky512_lf.png"),
		right = lovr.graphics.newTexture("Textures/sky512_rt.png"),
		back = lovr.graphics.newTexture("Textures/sky512_bk.png"),
		front = lovr.graphics.newTexture("Textures/sky512_ft.png"),
	})

	-- lovr callbacks
	function lovr.resize()
		-- Camera:UpdateProjection()
	end

	function lovr.mousemoved(x,y, dx, dy)
		-- Camera:Turn(dx, dy)
	end

	-- function lovr.keypressed(key, scancode, repeating)
	-- end
	
	local lastDT = 1/60
	function lovr.update(dt)
		lastDT = dt
		-- Camera.Position = lovr.math.newVec3(player.Position.x, player.Position.y + 0.5, player.Position.z)
		-- Camera:Turn(0, 0)
	end

	local shader = lovr.graphics.newShader("Shaders/vertex.vs", "Shaders/fragment.fs", {})
	local function ApplyShaders(pass)
		pass:setShader(shader)
		pass:send('ambience', { 70/255, 70/255, 70/255, 1.0 })
		pass:send('fogColor', { 147/255, 204/255, 234/255, 1.0 })
		pass:send('fogStart', 2)
		pass:send('fogEnd', 30)
		pass:send("sunDirection", { -0.558276355266571, 0.727559506893158, -0.39872872829437256 })
		pass:send("sunLightColor", { 0.5, 0.5, 0.5, 1.0 })

		-- pass:send("lightPosition", {0, 2, -5})
		-- pass:send("lightColor", {1,1,1,1})
		-- pass:send("lightRange", 5)
		-- pass:send("lightBrightness", .6)

		local width, height = lovr.system.getWindowDimensions()
		pass:send("screenWidth", width)
		pass:send("screenHeight", height)
	end
	-- max of 65536 draws


	function lovr.draw(pass)
		-- Camera:Render(pass)
		pass:text(tostring(math.round(1/lastDT)), 0, 10, 0, 1)
		-- Skybox:Render(pass, Camera.Position)
		Skybox:Render(pass, lovr.math.newVec3(0,0,0))
		pass:setMaterial()

		pass:setSampler("nearest")
		pass:setCullMode("back")

		ApplyShaders(pass)

		pass:draw(WorldTerrain, 0, 0, 0, 10, 0)
	end
end