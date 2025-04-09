---
sidebar_position: 1
---

# Getting Started

The Roblox Action Module can be installed from the [Creator Store](https://create.roblox.com/store/asset/116341079770723/Action-Module).
Once installed, head to your Roblox Studio file and open the Toolbox. Go to the Inventory tab and you should see the module there. Click on it and put it anywhere you want.

## Examples

The module can now be used to simplify the ability to add multi-platform support to your game.

```lua
local Action = require(path.to.Action)

local inputConfig: Action.InputConfig = { -- This can be changed
	Computer = Enum.KeyCode.E,
	Console = Enum.KeyCode.ButtonR2,
	VR = Enum.KeyCode.ButtonR2
}

local buttonConfig: Action.ButtonConfig = { -- All of this can be changed
	Position = UDim2.fromScale(.5,.5),
	Size = UDim2.fromScale(.5,.5),
	AnchorPoint = Vector2.new(.5,.5),
	Title = "Test Title",
	AspectRatio = 1,
	Icon = "rbxassetid://133394704084657", -- Random Image
}

local action = Action.new("Handle", inputConfig, true, buttonConfig)
action:Bind(function(name, state, obj)
	if state == Enum.UserInputState.Begin then
		print(true) -- Will print true once the player presses the E key on computer or the R2 button on VR or console
	end
end)
```
