-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- namegenerators/mangled.lua
--
-- This Script provides a function for generation of mangled names.

local util      = require("blus.util")
local chararray = util.chararray

----------------------------------------------------------------------
-- Configuration
----------------------------------------------------------------------

-- Character sets
local VarDigits      = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_")
local VarStartDigits = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

-- Minimum length for resulting identifiers
local MIN_LENGTH     = 6

-- Reserved words to avoid as raw identifiers
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
-- Per-run randomization
----------------------------------------------------------------------

-- Shuffle the digit sets once per obfuscation run
util.shuffle(VarDigits)
util.shuffle(VarStartDigits)

-- Offset folds into ID so same code obfuscated twice => different names
local maxOffset = #VarDigits * #VarStartDigits * 256
local offset    = math.random(1, maxOffset)

-- Cache so the same id -> same name within a run
local cache     = {}

----------------------------------------------------------------------
-- Helpers
----------------------------------------------------------------------

local function encodeBase(id, startSet, digitSet)
    local name = ""

    -- First character uses the start-set (no digits at beginning)
    local d = id % #startSet
    id      = (id - d) / #startSet
    name    = name .. startSet[d + 1]

    -- Remaining characters use the full digit set
    while id > 0 do
        local r = id % #digitSet
        id      = (id - r) / #digitSet
        name    = name .. digitSet[r + 1]
    end

    return name
end

local function padToMinLength(name, id)
    if #name >= MIN_LENGTH then
        return name
    end

    local needed = MIN_LENGTH - #name
    local seed   = id + 1  -- avoid 0

    for i = 1, needed do
        local idx = ((seed * (i + 13)) % #VarDigits) + 1
        name = name .. VarDigits[idx]
    end

    return name
end

----------------------------------------------------------------------
-- Main exported generator
----------------------------------------------------------------------

return function(id, scope)
    -- Promote numeric keys to deterministic strings per run
    if cache[id] then
        return cache[id]
    end

    -- Blend in offset for per-run variation
    local effectiveId = id + offset

    -- Encode id into a base-N mangled name
    local name = encodeBase(effectiveId, VarStartDigits, VarDigits)

    -- Ensure minimum length
    name = padToMinLength(name, id)

    -- Avoid bare reserved keywords
    if reserved[name] then
        name = "_" .. name
    end

    cache[id] = name
    return name
end
