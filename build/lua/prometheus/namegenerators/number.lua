-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/number.lua
--
-- This Script provides a function for generation of simple up-counting
-- names but encoded as hex numbers.

-- A small pool of prefixes to add a bit of variety
local PREFIXES = {
    "_",
    "__",
    "_0x",
    "_x",
    "_N",
}

-- Pick a random prefix once per obfuscation run
local PREFIX = PREFIXES[math.random(1, #PREFIXES)]

-- Per-run offset so the same script obfuscated twice gets different names
local OFFSET = math.random(0x10, 0xFFFF)

-- Minimum hex digit length (e.g. _0x000A instead of _0xA)
local MIN_HEX_DIGITS = 3

local function toPaddedHex(n)
    local h = string.format("%X", n)
    if #h < MIN_HEX_DIGITS then
        h = string.rep("0", MIN_HEX_DIGITS - #h) .. h
    end
    return h
end

return function(id, scope)
    -- Blend in OFFSET for per-run randomness
    local encoded = toPaddedHex(id + OFFSET)
    return PREFIX .. encoded
end
