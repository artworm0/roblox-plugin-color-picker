local Picker = ColorPicker.new('MyPlugin_ColorPicker_1')
local Part = workspace.Part

Picker:BindToChange(function(color)
	Part.Color = color
end)

local result = Picker:Prompt(workspace.Part.Color)

if result then
	print(Get255RGB(result)) 
else
	print(result) 
end
