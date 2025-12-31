local fenv = (getfenv and getfenv()) or _G
fenv["25ms was here :)"] = "function: 000001BC4E786B80"
print("[error]", "logs/input.lua:7: attempt to call a table value (local 'index')\
stack traceback:\
\9logs/input.lua:7: in function <logs/input.lua:7>\
\9(...tail calls...)\
\9[C]: in function 'xpcall'\
\9script.lua:1741: in function <script.lua:1495>\
\9(...tail calls...)\
\9[C]: in ?")

local var1 = Instance.new("ScreenGui")
var1.Name = "KdmlBlockUI"
local KdmlBlockUI = var1
var1.ResetOnSpawn = false
var1.IgnoreGuiInset = true
--MARK
