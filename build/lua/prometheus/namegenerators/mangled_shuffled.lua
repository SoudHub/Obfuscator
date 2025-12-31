-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/mangled_shuffled.lua
--
-- This Script provides a function for generation of mangled names with
-- shuffled character order, minimum length, and deterministic hashing.

local util      = require("prometheus.util")
local chararray = util.chararray

----------------------------------------------------------------------
-- Character sets
----------------------------------------------------------------------

-- Allowed for subsequent characters
local VarDigits      = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_")

-- Allowed for the first character (no digits)
local VarStartDigits = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

-- Minimum length for resulting identifiers
local MIN_LENGTH     = 6

----------------------------------------------------------------------
-- Reserved words to avoid directly
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
-- Per-run offset to decorrelate IDs between runs
----------------------------------------------------------------------

local offset = 0

-- cached names so the same id -> same identifier within a single run
local cache = {}

----------------------------------------------------------------------
-- Deterministic base-N encoder: id -> name body
----------------------------------------------------------------------

local function encodeBase(id, startSet, digitSet)
    local name = ""

    -- First char
    local d = id % #startSet
    id      = (id - d) / #startSet
    name    = name .. startSet[d + 1]

    -- Remaining chars
    while id > 0 do
        local r = id % #digitSet
        id      = (id - r) / #digitSet
        name    = name .. digitSet[r + 1]
    end

    return name
end

----------------------------------------------------------------------
-- Deterministic padding using the original id
----------------------------------------------------------------------

local function padToMinLength(name, id)
    if #name >= MIN_LENGTH then
        return name
    end

    local needed = MIN_LENGTH - #name
    local seed   = id + 1  -- avoid 0

    for i = 1, needed do
        local idx = ((seed * (i + 11)) % #VarDigits) + 1
        name = name .. VarDigits[idx]
    end

    return name
end

----------------------------------------------------------------------
-- Public name generator
----------------------------------------------------------------------

local function generateName(id, scope)
    if cache[id] then
        return cache[id]
    end

    -- Fold offset into id for per-run randomization
    local effectiveId = id + offset

    -- Base encoding
    local baseName = encodeBase(effectiveId, VarStartDigits, VarDigits)

    -- Ensure minimum length for better obfuscation
    baseName = padToMinLength(baseName, id)

    -- Avoid reserved words / keywords
    if reserved[baseName] then
        baseName = "_" .. baseName
    end

    cache[id] = baseName
    return baseName
end

----------------------------------------------------------------------
-- prepare(ast): called once per obfuscation run
--  - Shuffles character sets
--  - Chooses random offset so same script obfuscated twice looks different
----------------------------------------------------------------------

local function prepare(ast)
    util.shuffle(VarDigits)
    util.shuffle(VarStartDigits)

    -- keep offset small-ish but non-trivial
    local maxOffset = #VarDigits * #VarStartDigits * 128
    offset = math.random(1, maxOffset)
end

return {
    generateName = generateName,
    prepare      = prepare,
}
