-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- cli.lua
-- This script contains the Code for the Blus CLI

-- Configure package.path for requiring Blus
local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*[/%\\])")
end
package.path = script_path() .. "?.lua;" .. package.path;
---@diagnostic disable-next-line: different-requires
local Blus = require("blus");
Blus.Logger.logLevel = Blus.Logger.LogLevel.Info;

-- Check if the file exists
local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

string.split = function(str, sep)
    local fields = {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
local function lines_from(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do
      lines[#lines + 1] = line
    end
    return lines
  end

local function sorted_keys(t)
    local keys = {}
    for k in pairs(t or {}) do
        keys[#keys + 1] = k
    end
    table.sort(keys, function(a, b)
        return tostring(a):lower() < tostring(b):lower()
    end)
    return keys
end

local function print_help()
    print("Usage: lua cli.lua <input.lua> [options]")
    print("Options:")
    print("  --preset, --p <name>")
    print("  --config, --c <file.lua>")
    print("  --out, --o <file.lua>")
    print("  --Lua51 | --LuaU")
    print("  --pretty")
    print("  --seed <number>")
    print("  --wm, --watermark <text>")
    print("  --list-presets")
    print("  --list-steps")
    print("  --help")
end

local function ensure_next_arg(i, flag)
    if i + 1 > #arg then
        Blus.Logger:error(string.format("Missing value for %s", tostring(flag)))
    end
    return arg[i + 1]
end

local function upsert_step(steps, name, settings)
    steps = steps or {}
    for _, step in ipairs(steps) do
        if step and step.Name == name then
            step.Settings = step.Settings or {}
            for k, v in pairs(settings or {}) do
                step.Settings[k] = v
            end
            return steps
        end
    end
    steps[#steps + 1] = {
        Name = name,
        Settings = settings or {},
    }
    return steps
end

-- CLI
local config;
local sourceFile;
local outFile;
local luaVersion;
local prettyPrint;
local seed;
local watermark;

Blus.colors.enabled = true;

-- Parse Arguments
local i = 1;
while i <= #arg do
    local curr = arg[i];
    if curr:sub(1, 2) == "--" then
        if curr == "--help" then
            print_help()
            os.exit(0)
        elseif curr == "--list-presets" then
            local keys = sorted_keys(Blus.Presets)
            for _, k in ipairs(keys) do
                print(k)
            end
            os.exit(0)
        elseif curr == "--list-steps" then
            local keys = sorted_keys(Blus.Pipeline and Blus.Pipeline.Steps or {})
            for _, k in ipairs(keys) do
                print(k)
            end
            os.exit(0)
        elseif curr == "--preset" or curr == "--p" then
            if config then
                Blus.Logger:warn("The config was set multiple times");
            end

            i = i + 1;
            local preset = Blus.Presets[arg[i]];
            if not preset then
                Blus.Logger:error(string.format("A Preset with the name \"%s\" was not found!", tostring(arg[i])));
            end

            config = preset;
        elseif curr == "--config" or curr == "--c" then
            i = i + 1;
            local filename = tostring(arg[i]);
            if not file_exists(filename) then
                Blus.Logger:error(string.format("The config file \"%s\" was not found!", filename));
            end

            local content = table.concat(lines_from(filename), "\n");
            -- Load Config from File
            local func = loadstring(content);
            -- Sandboxing
            setfenv(func, {});
            config = func();
        elseif curr == "--out" or curr == "--o" then
            i = i + 1;
            if(outFile) then
                Blus.Logger:warn("The output file was specified multiple times!");
            end
            outFile = arg[i];
        elseif curr == "--seed" then
            local value = ensure_next_arg(i, curr)
            i = i + 1
            local n = tonumber(value)
            if not n then
                Blus.Logger:error(string.format("Invalid seed: %s", tostring(value)))
            end
            seed = n
        elseif curr == "--wm" or curr == "--watermark" then
            local value = ensure_next_arg(i, curr)
            i = i + 1
            watermark = tostring(value)
        elseif curr == "--nocolors" then
            Blus.colors.enabled = false;
        elseif curr == "--Lua51" then
            luaVersion = "Lua51";
        elseif curr == "--LuaU" then
            luaVersion = "LuaU";
        elseif curr == "--pretty" then
            prettyPrint = true;
        elseif curr == "--saveerrors" then
            -- Override error callback
            Blus.Logger.errorCallback =  function(...)
                print(Blus.colors(Blus.Config.NameUpper .. ": " .. ..., "red"))
                
                local args = {...};
                local message = table.concat(args, " ");
                
                local fileName = sourceFile:sub(-4) == ".lua" and sourceFile:sub(0, -5) .. ".error.txt" or sourceFile .. ".error.txt";
                local handle = io.open(fileName, "w");
                handle:write(message);
                handle:close();

                os.exit(1);
            end;
        else
            Blus.Logger:warn(string.format("The option \"%s\" is not valid and therefore ignored", curr));
        end
    else
        if sourceFile then
            Blus.Logger:error(string.format("Unexpected argument \"%s\"", arg[i]));
        end
        sourceFile = tostring(arg[i]);
    end
    i = i + 1;
end

if not sourceFile then
    print_help()
    Blus.Logger:error("No input file was specified!")
end

if not config then
    Blus.Logger:warn("No config was specified, falling back to Minify preset");
    config = Blus.Presets.Minify;
end

-- Add Option to override Lua Version
config.LuaVersion = luaVersion or config.LuaVersion;
config.PrettyPrint = prettyPrint ~= nil and prettyPrint or config.PrettyPrint;
if seed ~= nil then
    config.Seed = seed
end
if watermark ~= nil and #watermark > 0 then
    config.Steps = upsert_step(config.Steps, "WatermarkCheck", { Content = watermark })
end

if not file_exists(sourceFile) then
    Blus.Logger:error(string.format("The File \"%s\" was not found!", sourceFile));
end

if not outFile then
    if sourceFile:sub(-4) == ".lua" then
        outFile = sourceFile:sub(0, -5) .. ".obfuscated.lua";
    else
        outFile = sourceFile .. ".obfuscated.lua";
    end
end

local source = table.concat(lines_from(sourceFile), "\n");

if not luaVersion and (config.LuaVersion == "Lua51" or config.LuaVersion == nil) then
    local isLuau = false;
    if source:find("%+%=") or source:find("%-%=") or source:find("%*%=") or source:find("/%=") or source:find("%%=") or source:find("%^%=") or source:find("%.%.%=") then
        isLuau = true;
    elseif source:find("::", 1, true) then
        isLuau = true;
    elseif source:find("%f[%a]continue%f[%A]") then
        isLuau = true;
    elseif source:find("%-%>") then
        isLuau = true;
    end

    if isLuau then
        config.LuaVersion = "LuaU";
        Blus.Logger:info("Detected LuaU syntax. Using LuaU conventions. Use --Lua51 to force Lua 5.1 parsing.");
    end
end

local pipeline = Blus.Pipeline:fromConfig(config);
local ok, out = pcall(function()
    return pipeline:apply(source, sourceFile);
end);

if not ok then
    local err = tostring(out);
    if not luaVersion and (config.LuaVersion == "Lua51" or config.LuaVersion == nil) and err:find("Parsing Error", 1, true) then
        Blus.Logger:warn("Parsing failed using Lua51 conventions. Retrying with LuaU. Use --Lua51 to force Lua 5.1 parsing.");
        config.LuaVersion = "LuaU";
        pipeline = Blus.Pipeline:fromConfig(config);
        ok, out = pcall(function()
            return pipeline:apply(source, sourceFile);
        end);
    end
end

if not ok then
    Blus.Logger:error(tostring(out));
end

Blus.Logger:info(string.format("File can be found in \"%s\"", outFile));

-- Write Output
local handle = io.open(outFile, "w");
handle:write(out);
handle:close();
