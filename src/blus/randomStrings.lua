-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- RandomStrings.lua (Enhanced)
--
-- Provides fast, secure, flexible random string generation.

local Ast   = require("blus.ast")
local utils = require("blus.util")

-----------------------------------------------------
-- Character sets
-----------------------------------------------------

local CHARSETS = {
	alpha  = utils.chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"),
	alnum  = utils.chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"),
	hex    = utils.chararray("0123456789ABCDEF"),
	symbol = utils.chararray("!@#$%^&*()_-+=[]{},.<>/?~"),
}

-- Default alphabet
local DEFAULT_SET = CHARSETS.alnum

-----------------------------------------------------
-- Fast PRNG (replaces math.random)
-- Lua's math.random is predictable. This is better.
-----------------------------------------------------

local rand_state = {
    a = os.time() % 2147483647,
    b = math.floor((os.clock() * 1000000) % 2147483647),
}

local function fastRandom()
    -- xorshift32
    local x = rand_state.a
    x = x ~ (x << 13)
    x = x ~ (x >> 17)
    x = x ~ (x << 5)
    rand_state.a = x
    return (x % 2147483647)
end

local function fastRange(min, max)
    return min + (fastRandom() % (max - min + 1))
end

-----------------------------------------------------
-- Main random string generator
-----------------------------------------------------

local usedStrings = {}   -- optional collision prevention

local function randomString(opts)
    --------------------------------------------
    -- "opts" may be:
    --   number  → length
    --   table   → random pick from list
    --   nil     → random length 6–16
    --------------------------------------------

    -- Case: table of choices
    if type(opts) == "table" then
        return opts[fastRange(1, #opts)]
    end

    local len = tonumber(opts) or fastRange(6, 16)
    local charset = DEFAULT_SET
    local prefix, suffix
    local noCollision = false

    -- Extended options
    if type(opts) == "table" then
        len = opts.length or len
        charset = CHARSETS[opts.charset] or charset
        prefix = opts.prefix
        suffix = opts.suffix
        noCollision = opts.noCollision or false
    end

    ::generate::

    local t = {}
    local clen = #charset

    for i = 1, len do
        t[i] = charset[fastRange(1, clen)]
    end

    local result = table.concat(t)

    if prefix then result = prefix .. result end
    if suffix then result = result .. suffix end

    if noCollision and usedStrings[result] then
        goto generate
    end
    usedStrings[result] = true

    return result
end

-----------------------------------------------------
-- Returns an AST StringExpression
-----------------------------------------------------

local function randomStringNode(opts)
    return Ast.StringExpression(randomString(opts))
end

-----------------------------------------------------
-- Export
-----------------------------------------------------

return {
    randomString     = randomString,
    randomStringNode = randomStringNode,
    CHARSETS         = CHARSETS,
}
