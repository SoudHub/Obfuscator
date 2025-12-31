-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- namegenerators/il.lua
--
-- This Script provides a function for generation of weird names
-- consisting only of the characters: I, l and 1.

local MIN_CHARACTERS          = 5
local MAX_INITIAL_CHARACTERS  = 10

local util      = require("blus.util")
local chararray = util.chararray

local offset         = 0
local VarDigits      = chararray("Il1")  -- allowed for subsequent characters
local VarStartDigits = chararray("Il")   -- allowed for first character

----------------------------------------------------------------------
-- generateName(id, scope)
--  - Deterministic for a given run (after prepare())
--  - Uses base-#VarStartDigits for first char, then base-#VarDigits
--  - Ensures name length >= MIN_CHARACTERS by deterministic padding.
----------------------------------------------------------------------

local function generateName(id, scope)
    -- Incorporate offset for per-run randomness
    local name = ""
    local baseId = id + offset

    -- First character uses VarStartDigits (prevents leading '1' if desired)
    local d = baseId % #VarStartDigits
    baseId  = (baseId - d) / #VarStartDigits
    name    = name .. VarStartDigits[d + 1]

    -- Subsequent characters use VarDigits
    local work = baseId

    while work > 0 do
        local r = work % #VarDigits
        work    = (work - r) / #VarDigits
        name    = name .. VarDigits[r + 1]
    end

    -- If we ended up too short, deterministically pad using the original id
    -- so id → name remains deterministic for this run.
    if #name < MIN_CHARACTERS then
        local needed = MIN_CHARACTERS - #name
        local padSeed = id + 1  -- avoid 0

        for i = 1, needed do
            -- deterministic index derived from padSeed and i
            local idx = ((padSeed * (i + 7)) % #VarDigits) + 1
            name = name .. VarDigits[idx]
        end
    end

    return name
end

----------------------------------------------------------------------
-- prepare(ast)
--  - Called once per compilation.
--  - Shuffles the character sets and picks a random offset to
--    decorrelate ids from runs.
----------------------------------------------------------------------

local function prepare(ast)
    util.shuffle(VarDigits)
    util.shuffle(VarStartDigits)

    -- Choose a random initial offset so that even the same IDs
    -- across separate runs produce different names.
    local minPow = 3 ^ MIN_CHARACTERS
    local maxPow = 3 ^ MAX_INITIAL_CHARACTERS

    -- Protect against silly ranges
    if maxPow < minPow then
        maxPow = minPow
    end

    offset = math.random(minPow, maxPow)
end

return {
    generateName = generateName,
    prepare      = prepare,
}
