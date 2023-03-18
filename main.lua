--[[
    Lighter | Version 0.1.0.0
    Lua Obfuscation Service
    By: _G.HunDread#0176

    How to use:
    Two methods of execution
    1. Thread Method
    2. Print Method

    1. Thread Method
    Is on by default, put your lua code into the `input.lua` file and run the program (Either Command Prompt or Replit). 
    Once ran, will print a message that indicates your code has been protected. After, check the `output.lua` file, and enjoy!

    2. Print Method
    Is off by default, not as effective as the thread method.
    Put your code on 'local print_only' and run the script.
    Once the obfuscation has finished, will print the output directly into the console
    The usage of this method will not tolerate any comments, so if your code has comments, please remove when using this method.

    NOTE: Take note that this obfuscator is not to be used in harmful ways, and also take note that this obfuscator uses Loadstring.
    Loadstring/Load is a built-in function in lua, unlike Lua Bytecode Interpreters, this automatically launches the string you have.
    No worries though, This obfuscator has built-in anti-tamper and constant protection, so still safe but not enough depending on the knowledge the reverse engineer has.

    Lua Versions that support this obfuscator:
    Lua 5.1
    Lua 5.4 (Kind off supports)
    Roblox LuaU (mostly can't run, support on roblox luau will come in 0.2.0.0)
    GameGuardian
    Replit

    Inpiration: BlueSecure, Prometheus, MoonSec, 77fuscator, IronBrew 2, Aztupbrew, and others


    Love from HunDread
]]

-- Credits
local Author = 'HunDread'
-- Settings
local settings = {
    encodeStrings = true, -- If set false, wont obfuscate your script
    SmallerOutput = false, -- if your compiler can't handle large contents of lua code, make this true
    comments = true, -- makes your code harder to read
    prettyPrint = false, -- making this true will result in an obfuscation without minifying the output
    protection = true; -- Anti-Tamper, Constant Protection, and other security barriers
}
-- Obfuscation Process (Thread Method)
Thread = io.open("input.lua", "r")
local scriptContent = Thread:read("*a")
Thread:close()
local output = scriptContent

if not settings["encodeStrings"] then
    function strToBytes(JUNIOR_DOUBLE_TRIPLE)
        local byteArray= { JUNIOR_DOUBLE_TRIPLE:byte(1, -1) }
        for i = 1, #byteArray do
        byteArray[i] = byteArray[i] + 100
        encoded = '{' ..table.concat(byteArray, ',') .. '}'
      end

      output = [[local burger-king-gets-raided-by-fbi-because-of-cock-burger = ']]..strToBytes(output)..[[' function whopper(JUNIOR_DOUBLE_TRIPLE) local function gsub(c)return JUNIOR_DOUBLE_TRIPLEing.char(c - 100) end return JUNIOR_DOUBLE_TRIPLE:gsub('(%d+),?', gsub) end loadstring(whopper(burger-king-gets-raided-by-fbi-because-of-cock-burger))]]
    end else
        function encode(str)
            local encoded = "LIT~"
            for i = 1, #str do
              local char = str:sub(i, i)
              if string.byte(char) >= 97 and string.byte(char) <= 122 then
                -- lowercase letters
                encoded = encoded .. "L" .. string.format("%03d", string.byte(char) - 32)
              elseif string.byte(char) >= 65 and string.byte(char) <= 90 then
                -- uppercase letters
                encoded = encoded .. "U" .. string.format("%03d", string.byte(char))
              else
                -- other characters
                encoded = encoded .. "O" .. string.format("%03d", string.byte(char))
              end
            end
            return encoded
          end
    output = [[local _I_llIlIlIIl = ']]..encode(output)..[[' function LIliLL(a)local b=""local c=5;while c<=#a do local d=a:sub(c,c)local e=tonumber(a:sub(c+1,c+3))if d=="L"then b=b..string.char(e+32)elseif d=="U"then b=b..string.char(e)else b=b..string.char(e)end;c=c+4 end;return b end local w = function(a) return loadstring(a) end local x = w local y = x local z = y local a = z local b = a local c = b c(LIliLL(_I_llIlIlIIl))()]]
end

if settings["SmallerOutput"] then

else
    output = [[local __l_I_llIX = 'LOADBOOL' local _IIllIllI = 'LOADK' local lIIllllIlIlllI_llIIl_IllIlIlIIIl = 'LIT~S90DU9DFHVUDHFVBU9HDFGU9HDF9GHD9UFGHSDUVUCH9USDHF9HSD9FHSD9FHS9HGSHGU9FDHG9SDHFG9HDSF9GHDS9FGH9DSF8GHDFGHSD9FUGHSDUFRGUHSDFGHSDF79GSDHF9G7HDSF9GUHDSF9GHDSF9GHDSF89GHDS9FGHDS89FGHDS9FGHDS89FGHSD89FGH8SD9FGH89SDFGH978RHGUSDFHGUIDSHG9R8SGDHHFGDHSG'; function _ll(l) local alphabet = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z';} local lore = ('UponTheStars') end;]] .. output
end
local n = Author
if settings["comments"] then
    local comments = {
        "lLiiLIiLILilL = true, local lILil = '239458093458093485923754237472580978475385394534095836734857234857345lILilILIliLILilILiliLIliLIllLIliLIli4358734958734956739568349857239857234895734957'",
        "Welcome to the realm of Lighter's Unique lit methods of obfuscation",
        "You will never reverse my obfuscation",
        "ChatGPT users be like",
        "The lore between the Five Nights of Freddy's franchise is very unique and hard to solve, even matpat can't solve it himself!",
        "Aztupbrew was deobfuscated, sad it used IB2 under the hood",
        "With unique obfuscation comes with great cock";
    }
    output = output:gsub(" ", function(c)
        if c == " " then
            return " --[[" .. comments[math.random(1, #comments)] ..  "]] "
        end
    end)
else
    -- does not put comments
end
local Monkey = n
if settings["protection"] then
    output = output..[[local fuck = 'l' local you = 'oa' local finger = 'ring' local ni = 'dst' local fenv = getfenv and getfenv() or _ENV local mario = error local lILIli = function(s) return error(s) end local kart = print if fenv == kart then lILIli() end if loadstring == mario then lILIli() end local lol = 'local' if loadstring == kart then lILIli() end]]
end
local knitTight = 'unD'
if Monkey ~= 'H'..knitTight..'read' then
    error('There was a problem while running Lighter | Try again | StopCode: 000001 | Reason: WM_CHECK_FAIL')
end

-- Finishers
output = [[
-- Protected by Lighter v0.1.0.0 | HunDread on top
]] .. output
Thread = io.open("output.lua", "w")
Thread:write(output)
Thread:close()
--Finished
print("Sucessfully obfuscated your script!")