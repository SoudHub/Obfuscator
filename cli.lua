-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- test.lua
-- This script contains the Code for the Blus CLI

-- Configure package.path for requiring Blus
local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*[/%\\])") or "";
end
package.path = script_path() .. "?.lua;" .. package.path;
require("src.cli");