# What is this?
Straight up, this is identical copy of accustomed color picker gui that roblox uses. I've tried to script it to be as simillar as possible to one you usually see when choosing color in studio, both visually and mechanically. I did it for my own plugin needs, but then found a way to make my plugin easier without using any color pickers, thus I'm outsourcing it. Hope yall find a good use out of it!

![RobloxStudioBeta_Zfb1QSdfoM](https://github.com/user-attachments/assets/a770a952-c545-448f-a81d-f654df176e11)

# How to use?

Firstly you need to copy code `color_picker.luau` inside your plugin code to use

Then, create an object with pluginGuiId as the first argument. (pluginGuiId is needed to create DockWidgetPluginGui)\
Then use `:Prompt()` method to open gui so user can start choosing color.

```luau
local Picker = PluginColorPicker.new('MyPlugin_ColorPicker_1')
-- ^ pluginGuiId should be different for every plugin/window or it can cause problems!

print(Picker:Prompt()) -- will print color or nil if user did not choose any color
```
# Simple, right? But there's more!

### Open color picker gui with starting color:
Useful when you want to show color of object you're changing when opening.
```luau
local Picker = PluginColorPicker.new('MyPlugin_ColorPicker_1')
local StartingColor = Color3.fromRGB(255, 0, 0)

local result = Picker:Prompt(StartingColor) -- will open gui with red color already choosen
```

### Bind to color change:
If you wanna change color of object in real time when user is choosing, use `:BindToChange()` method to bind a function.
```luau
local Picker = PluginColorPicker.new('MyPlugin_ColorPicker_1')
local Part = workspace.Part

Picker:BindToChange(function(color)
  Part.Color3 = color
end)

local result = Picker:Prompt()
```

### Set color in real time:
If for some freaky reason you wanna to set color when user is already choosing, use `:Set(color)` method.
```lua
local Picker = PluginColorPicker.new('MyPlugin_ColorPicker_1')

task.spawn(function()
	Picker:Set(Color3.FromRGB(255, 0, 0))
	task.wait(0.5)
	Picker:Set(Color3.FromRGB(0, 255, 0))
	task.wait(0.5)
	Picker:Set(Color3.FromRGB(0, 0, 255))
end)

local result = Picker:Prompt()
```

### Cancel prompt:
If you want for some reason to stop user from choosing a color, use `:Cancel()` method. You can add custom color argument that will be passed when cancelling.
```luau
local Picker = PluginColorPicker.new('MyPlugin_ColorPicker_1')
local ColorOnCancel = Color3.fromRGB(255, 0, 0)

task.delay(5, function()
  Picker:Cancel(ColorOnCancel) -- if cancel works after user already choosed some result, it would do nothing.
end)

local result = Picker:Prompt()
-- if user will wait 5 seconds without choosing, the result will be red color
```

### Destroy the picker:
You can destroy object to disconnect and delete everything. (ALWAYS DO IT IF YOU WANT TO STOP USING IT TO DISCONNECT USELESS CONNECTIONS IN YOUR PLUGIN CODE)
```luau
local Picker = PluginColorPicker.new('MyPlugin_ColorPicker_1')
Picker:Prompt()
Picker:Destroy() -- will destroy all gui and disconnect all connections
```

### Check if it's opened
Should be self explanatory
```luau
local Picker = PluginColorPicker.new('MyPlugin_ColorPicker_1')

print(Picker:IsOpened())
```


