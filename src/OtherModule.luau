--!strict

local CAS = game:GetService("ContextActionService")
local UIS = game:GetService("UserInputService")

--[=[
	@type InputConfig { Computer: InputObject?, Console: InputObject?, VR: InputObject?}
	@within Action
	What input keys to use.
]=]
export type InputConfig = {
	Computer: InputObject,
	Console: InputObject,
	VR: InputObject
}

--[=[
	@type ButtonConfig { Position: Udim2?, Size: Udim2?, AnchorPoint: Vector2?}
	@within Action
	Properties of the button you can edit, and what values to set them to
]=]
export type ButtonConfig = {
	Position: UDim2?,
	Size: UDim2?,
	AnchorPoint: Vector2?,
	Title: string?,
	AspectRatio: number?,
	Icon: string?
}

--[=[
	@class Action
	A utility module.
]=]
local Action = {}
Action.__index = Action

--[=[
	@within Action
	@function new

	@param name string
	@param inputs InputConfig
	@param createButton boolean?
	@param button ButtonConfig?

	@return ActionObject
	Constructs an ActionObject.

	```lua
	local actionObject = Action.new()
	```
]=]
function Action.new(name: string, inputs: InputConfig, createButton: boolean?, button: ButtonConfig)
	return "Hello, world!"
end

--[=[
	@within Action
	@method Bind
	@return (name: string, state: EnumItem, obj: InputObject)

	Binds the action so you can check if the button is being used, and in what state.

	```lua
	actionObject:Bind(function(name, state, obj)
		if state == Enum.UserInputState.Begin then -- Any state can be used
			-- Your code here
		end
	end)
	```
]=]
function Action:Bind(func: (name: string, state: any, obj: InputObject) -> ()): RBXScriptConnection
	CAS:BindAction(self.Name, func, self.CreateButton, self.Inputs.Computer, self.Inputs.Console, self.Inputs.VR)
	
	self.button = CAS:GetButton(self.Name)
	if not self.button then return end
	
	if self.ButtonInfo.Position then self.button.Position = self.ButtonInfo.Position end
	if self.ButtonInfo.Size then self.button.Size = self.ButtonInfo.Size end
	if self.ButtonInfo.AnchorPoint then self.button.AnchorPoint = self.ButtonInfo.AnchorPoint end
	
	if self.ButtonInfo.Title then self.button.ActionTitle.Text = self.ButtonInfo.Title end
	if self.ButtonInfo.Icon then self.button.ActionIcon.Image = self.ButtonInfo.Icon end
	
	if self.ButtonInfo.AspectRatio then
		local ratio = Instance.new("UIAspectRatioConstraint", self.button)
		ratio.AspectRatio = self.ButtonInfo.AspectRatio
	end
end

--[=[
	@within Action
	@method Unbind

	Unbind the action so it cannot be used again. Do this to prevent memory leaks.

	```lua
	actionObject:Unbind()
	```
]=]
function Action:Unbind()
	CAS:UnbindAction(self.Name)
end

--[=[
	@within Action
	@method GetButton
	@return ImageButton?

	Get the button when the user is on mobile. This can be used to customize the button further if the module does not already support it.

	```lua
	local button = actionObject:GetButton()
	```
]=]
function Action:GetButton(): ImageButton
	return CAS:GetButton(self.Name)
end

--[=[
	@within Action
	@method GetInfo
	@return { stackOrder: number, priorityLevel: number, createTouchButton: boolean, inputTypes: { any }, description: string, title: string, image: string}

	Get information about the actionObject.

	```lua
	local button = actionObject:GetButton()
	```
]=]
function Action:GetInfo(): { [string]: any }
	return CAS:GetBoundActionInfo(self.Name)
end

return Action
