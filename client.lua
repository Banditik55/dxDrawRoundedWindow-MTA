function dxDrawWindow(v)
	dxDrawRectangle((v.x + v.radius), v.y, (v.w - (v.radius * 2)), v.h, v.color, v.postGUI)
	dxDrawRectangle(v.x, (v.y + v.radius), v.radius, (v.h - (v.radius * 2)), v.color, v.postGUI)
	dxDrawRectangle((v.x + v.w - v.radius), (v.y + v.radius), v.radius, (v.h - (v.radius * 2)), v.color, v.postGUI)

	dxDrawCircle((v.x + v.radius), (v.y + v.radius), v.radius, 270, 180, v.color, v.color, 1024, 1, v.postGUI)
	dxDrawCircle((v.x + v.w - v.radius), (v.y + v.radius), v.radius, 270, 360, v.color, v.color, 1024, 1, v.postGUI)
	dxDrawCircle((v.x + v.w - v.radius), (v.y + v.h - v.radius), v.radius, 0, 90, v.color, v.color, 1024, 1, v.postGUI)
	dxDrawCircle((v.x + v.radius), (v.y + v.h - v.radius), v.radius, 90, 180, v.color, v.color, 1024, 1, v.postGUI)
end

---

local x, y = guiGetScreenSize()

-- centered window
function example1()
	dxDrawWindow({
		x = (x / 2 - 250),
		y = (y / 2 - 250),
		w = 500,
		h = 500,
		radius = 25,
		color = tocolor(200, 200, 200, 175),
		postGUI = false,
	})
end

-- window with text
function example2()
	dxDrawWindow({
		x = 250,
		y = 250,
		w = 500,
		h = 175,
		radius = 25,
		color = tocolor(0, 0, 0, 175),
		postGUI = false,
	})

	local text = "Praesent quis justo."
	local font = "unifont"
	local w = dxGetTextWidth(text, 2, font)

	dxDrawText(text, (250 + (500 / 2 - (w / 2))), (250 + 15), 0, 0, tocolor(255, 255, 255, 255), 2, font, "left", "top", false, false, false, false, false)

	dxDrawText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et.\n\nMaecenas dapibus mi eu augue sagittis, et viverra tortor dictum. Duis nec lacus non nisi tempus лять. Ut convallis neque lorem, ut semper massa tempus a.", (250 + 25), (250 + 75), (250 + 25 + 475), 0, tocolor(255, 255, 255, 225), 1, font, "left", "top", false, true, false, false, false)
end

addEventHandler("onClientRender", root, function()
	example1()
	example2()
end)