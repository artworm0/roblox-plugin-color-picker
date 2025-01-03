local Picker = ColorPicker.new('MyPlugin_ColorPicker_1')
local Part = workspace.Part

Picker:BindToChange(function(color)
	Part.Color3 = color
end)

local result = Picker:Prompt(workspace.Part.Color)

print(Get255RGB(result)) 
