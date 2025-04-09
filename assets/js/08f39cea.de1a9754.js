"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[124],{7774:t=>{t.exports=JSON.parse('{"functions":[{"name":"new","desc":"Constructs an ActionObject.\\n\\n```lua\\nlocal actionObject = Action.new()\\n```","params":[{"name":"name","desc":"","lua_type":"string"},{"name":"inputs","desc":"","lua_type":"InputConfig"},{"name":"createButton","desc":"","lua_type":"boolean?"},{"name":"button","desc":"","lua_type":"ButtonConfig?"}],"returns":[{"desc":"","lua_type":"ActionObject"}],"function_type":"static","source":{"line":54,"path":"src/OtherModule.luau"}},{"name":"Bind","desc":"Binds the action so you can check if the button is being used, and in what state.\\n\\n```lua\\nactionObject:Bind(function(name, state, obj)\\n\\tif state == Enum.UserInputState.Begin then -- Any state can be used\\n\\t\\t-- Your code here\\n\\tend\\nend)\\n```","params":[],"returns":[{"desc":"","lua_type":"(name: string, state: EnumItem, obj: InputObject)"}],"function_type":"method","source":{"line":73,"path":"src/OtherModule.luau"}},{"name":"Unbind","desc":"Unbind the action so it cannot be used again. Do this to prevent memory leaks.\\n\\n```lua\\nactionObject:Unbind()\\n```","params":[],"returns":[],"function_type":"method","source":{"line":102,"path":"src/OtherModule.luau"}},{"name":"GetButton","desc":"Get the button when the user is on mobile. This can be used to customize the button further if the module does not already support it.\\n\\n```lua\\nlocal button = actionObject:GetButton()\\n```","params":[],"returns":[{"desc":"","lua_type":"ImageButton?"}],"function_type":"method","source":{"line":117,"path":"src/OtherModule.luau"}},{"name":"GetInfo","desc":"Get information about the actionObject.\\n\\n```lua\\nlocal button = actionObject:GetButton()\\n```","params":[],"returns":[{"desc":"","lua_type":"{ stackOrder: number, priorityLevel: number, createTouchButton: boolean, inputTypes: { any }, description: string, title: string, image: string}"}],"function_type":"method","source":{"line":132,"path":"src/OtherModule.luau"}}],"properties":[],"types":[{"name":"InputConfig","desc":"What input keys to use.","lua_type":"{ Computer: InputObject?, Console: InputObject?, VR: InputObject?}","source":{"line":11,"path":"src/OtherModule.luau"}},{"name":"ButtonConfig","desc":"Properties of the button you can edit, and what values to set them to","lua_type":"{ Position: Udim2?, Size: Udim2?, AnchorPoint: Vector2?}","source":{"line":22,"path":"src/OtherModule.luau"}}],"name":"Action","desc":"A utility module.","source":{"line":35,"path":"src/OtherModule.luau"}}')}}]);