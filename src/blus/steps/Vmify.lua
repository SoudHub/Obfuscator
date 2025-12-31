-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- Vmify.lua
--
-- This Script provides a Complex Obfuscation Step that will compile the entire Script to  a fully custom bytecode that does not share it's instructions
-- with lua, making it much harder to crack than other lua obfuscators

local Step = require("blus.step");
local Compiler = require("blus.compiler.compiler");
local logger = require("logger");

local Vmify = Step:extend();
Vmify.Description = "This Step will Compile your script into a fully-custom (not a half custom like other lua obfuscators) Bytecode Format and emit a vm for executing it.";
Vmify.Name = "Vmify";

Vmify.SettingsDescriptor = {
}

function Vmify:init(settings)
	
end

function Vmify:apply(ast)
	-- Vmify is not compatible with all AST shapes / LuaU scripts.
	-- If compilation fails, keep the original AST and continue the pipeline.
	local compiler = Compiler:new();

	local ok, out = pcall(function()
		return compiler:compile(ast);
	end)

	if not ok then
		logger:warn(string.format("Vmify failed (%s). Skipping Vmify.", tostring(out)))
		return ast
	end

	return out
end

return Vmify;