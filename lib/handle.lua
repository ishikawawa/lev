--[[

Copyright 2012 The Luvit Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

--]]

local UV = require('uv')

local Object = require('object')

local Handle = Object:extend()

function Handle.methods:initialize()
  error("Can't create instances of Handle, must subclass")
end

function Handle.methods:close()
  return UV.close(self.userdata)
end

function Handle.methods:set_handler(name, callback)
  return UV.set_handler(self.userdata, name, callback)
end

return Handle