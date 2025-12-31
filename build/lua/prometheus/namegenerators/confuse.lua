-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/confuse.lua
--
-- This Script provides a function for generation of confusing variable names.

local util      = require("prometheus.util")
local chararray = util.chararray

----------------------------------------------------------------------
-- Base word pool for name composition
----------------------------------------------------------------------

local varNames = {
    -- generic / structural
    "index", "iterator", "length", "size", "capacity", "offset", "cursor",
    "key", "value", "data", "buffer", "state", "result", "context",
    "count", "step", "increment", "position", "source", "target",

    -- types / pseudo-types
    "string", "number", "boolean", "table", "array", "list", "node",
    "object", "class", "instance", "closure", "frame", "record", "entry",

    -- operations / verbs
    "load", "store", "update", "apply", "invoke", "resume", "dispatch",
    "validate", "serialize", "decode", "encode", "compute", "compare",
    "resolve", "attach", "detach", "collect", "clone", "patch",

    -- system / fs / env
    "dir", "directory", "path", "isWindows", "isLinux", "env", "system",
    "game", "roblox", "gmod",

    -- lua builtins / libs (great decoys)
    "gsub", "gmatch", "gfind",
    "loadstring", "loadfile", "dofile", "require",
    "module", "package", "exports", "imports",
    "_G", "math", "os", "io", "debug",

    -- i/o
    "write", "print", "read", "readline", "flush", "open", "close",
    "tmpname", "rename", "remove", "seek", "lines",

    -- coroutine / debug / meta
    "pcall", "xpcall", "coroutine", "create", "resume", "status",
    "wrap", "yield", "traceback",
    "setmetatable", "getmetatable",
    "rawset", "rawget", "rawequal", "rawlen",

    -- misc util
    "next", "ipairs", "select", "tonumber", "tostring", "assert",
    "collectgarbage", "hookfunction", "searchpath",

    -- short / throwaway
    "a", "b", "c", "d", "e", "f", "g",
    "i", "j", "k", "m", "n", "t", "v",
}

----------------------------------------------------------------------
-- Reserved / awkward names to avoid directly
----------------------------------------------------------------------

local reserved = {
    ["and"]      = true,
    ["break"]    = true,
    ["do"]       = true,
    ["else"]     = true,
    ["elseif"]   = true,
    ["end"]      = true,
    ["false"]    = true,
    ["for"]      = true,
    ["function"] = true,
    ["if"]       = true,
    ["in"]       = true,
    ["local"]    = true,
    ["nil"]      = true,
    ["not"]      = true,
    ["or"]       = true,
    ["repeat"]   = true,
    ["return"]   = true,
    ["then"]     = true,
    ["true"]     = true,
    ["until"]    = true,
    ["while"]    = true,
}

----------------------------------------------------------------------
-- Suffix alphabet (for hashed IDs)
----------------------------------------------------------------------

local suffixChars = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

----------------------------------------------------------------------
-- Deterministic base-N encoder for numeric IDs → [a-zA-Z0-9]+
----------------------------------------------------------------------

local function encodeIdToSuffix(id)
    if id <= 0 then
        return ""
    end

    local n      = #suffixChars
    local chars  = {}

    while id > 0 do
        local d = id % n
        id      = (id - d) / n
        table.insert(chars, suffixChars[d + 1])
    end

    -- We build least-significant-digit first, but that doesn’t really matter
    return table.concat(chars)
end

----------------------------------------------------------------------
-- Name generator
--  - Deterministic with respect to (id) and shuffled varNames
--  - Builds composite names like: "value_loader_Xf9"
----------------------------------------------------------------------

local cache = {}

local function generateName(id, scope)
    -- Prometheus calls this with a numeric id that is stable per variable.
    if cache[id] then
        return cache[id]
    end

    local baseParts = {}

    -- Multi-word base name derived from "digits" in base #varNames
    local base = id
    local count = 0
    repeat
        local d = base % #varNames
        base    = (base - d) / #varNames
        table.insert(baseParts, 1, varNames[d + 1])
        count = count + 1
    until base == 0 or count > 3  -- limit to 3 components for readability

    local baseName = table.concat(baseParts, "_")

    -- Fall back if something went weird
    if baseName == "" then
        baseName = "var"
    end

    -- Add deterministic hashed suffix from id to reduce collision chance
    local suffix = encodeIdToSuffix(id)
    if suffix ~= "" then
        baseName = baseName .. "_" .. suffix
    end

    -- Avoid reserved words by simple prefixing; still looks plausible
    if reserved[baseName] then
        baseName = "_" .. baseName
    end

    cache[id] = baseName
    return baseName
end

----------------------------------------------------------------------
-- prepare(ast): allow randomness *once* per compilation
-- We shuffle varNames so same id maps to different-looking names
-- across runs, but stays deterministic within one run.
----------------------------------------------------------------------

local function prepare(ast)
    util.shuffle(varNames)
end

return {
    generateName = generateName,
    prepare      = prepare,
}
