--[[
    This Lua Bytecode Interpreter is broken and is not fixed. If you can fix this, thank you, dm me on discord: _G.HunDread#0176
]]

local bytecode = {
    "LOADK 0 WYV_", -- load the string "WYV_" into register 0
    "MOVE 1 0", -- move the value from register 0 to register 1
    "LOADK 2 U", -- load the string "U" into register 2
    "LOADK 3 O", -- load the string "O" into register 3
    "LOADK 4 L", -- load the string "L" into register 4
    "MOVE 5 0", -- move the value from register 0 to register 5
    "FORPREP 6 0", -- start a loop from 0 to the length of the input string
    "MOVE 7 6", -- move the loop counter to register 7
    "GETTABLE 8 5 2", -- get the value of register 2 (string "U") and store it in register 8
    "GETTABLE 9 5 3", -- get the value of register 3 (string "O") and store it in register 9
    "GETTABLE 10 5 4", -- get the value of register 4 (string "L") and store it in register 10
    "LOADK 11 97", -- load the integer 97 into register 11
    "LOADK 12 122", -- load the integer 122 into register 12
    "LOADK 13 32", -- load the integer 32 into register 13
    "LOADK 14 3", -- load the integer 3 into register 14
    "GETTABLE 15 5 7", -- get the input string and store it in register 15
    "GETTABLE 16 15 7", -- get the character at the current loop index and store it in register 16
    "LT 17 16 11", -- compare the character with the value 97 (lowercase 'a')
    "JMPF 18 6", -- jump to the end of the loop if the character is not a lowercase letter
    "LE 19 16 12", -- compare the character with the value 122 (lowercase 'z')
    "JMPF 20 6", -- jump to the end of the loop if the character is not a lowercase letter
    "SUB 16 16 13", -- subtract 32 from the character to convert it to uppercase
    "CONCAT 1 1 2", -- concatenate the string "U" to the output string
    "JMP 21", -- jump to the end of the conditional statement
    "CMPLE 22 11 16", -- compare the character with the value 97 (lowercase 'a')
    "JMPF 23 26", -- jump to the next conditional statement if the character is not a lowercase letter
    "CMPLE 24 16 12", -- compare the character with the value 122 (lowercase 'z')
    "JMPF 25 26", -- jump to the next conditional statement if the character is not a lowercase letter
    "CONCAT 1 1 16", -- concatenate the character to the output string
    "JMP 27", -- jump to the end of the conditional statement
    "CONCAT 1 1 9", -- concatenate the string "O" to the output string
    "JMP 27", -- jump to the end of the conditional statement
    "CONCAT 1 1 10", -- concatenate the string "L" to the output string
    "JMP 27", -- jump to the end of the conditional statement
    "CONCAT 1 1 14", -- concatenate the string " " to the output string
    "JMP 27", -- jump to the end of the conditional statement
    "MOVE 28 1", -- move the value of the output string to register 28
    "RETURN 28 1" -- return the output string
    }
    
    local function execute_bytecode(bytecode, input_string)
    local registers = {}
    local pc = 1
    
    -- initialize registers
    for i = 0, 28 do
    registers[i] = 0
    end
    
    -- store input string in register 7
    registers[7] = input_string
    
    -- execute bytecode
    while pc <= #bytecode do
    local instruction = bytecode[pc]
    local opcode, a, b, c = instruction:match("(%u+)%s+(%d+)%s*(%d*)%s*(%d*)")
    if opcode == "LOADK" then
        registers[tonumber(a)] = bytecode[tonumber(b)]
      elseif opcode == "MOVE" then
        registers[tonumber(a)] = registers[tonumber(b)]
      elseif opcode == "FORPREP" then
        local loop_start = tonumber(a) + 1
        local loop_end = loop_start + #registers[tonumber(b)] - 1
        local loop_step = tonumber(c) or 1
        local loop_index = loop_end
        registers[tonumber(b)] = loop_start
        pc = pc + 1
        while loop_index >= loop_start do
          registers[tonumber(a)] = loop_index
          loop_index = loop_index - loop_step
          pc = pc + 1
        end
        pc = pc - 1
      elseif opcode == "GETTABLE" then
        local table = registers[tonumber(b)]
        local key = registers[tonumber(c)]
        registers[tonumber(a)] = string.sub(table, key, key)
      elseif opcode == "LT" then
        local a_val = registers[tonumber(b)]
        local b_val = registers[tonumber(c)]
        registers[tonumber(a)] = a_val < b_val and 1 or 0
      elseif opcode == "JMPF" then
        local cond_val = registers[tonumber(b)]
        local target = tonumber(c)
        if cond_val == 0 then
          pc = target
        end
      elseif opcode == "LE" then
        local a_val = registers[tonumber(b)]
        local b_val = registers[tonumber(c)]
        registers[tonumber(a)] = a_val <= b_val and 1 or 0
      elseif opcode == "SUB" then
        local a_val = registers[tonumber(b)]
        local b_val = registers[tonumber(c)]
        registers[tonumber(a)] = a_val
        elseif opcode == "CONCAT" then
        local dest_reg = tonumber(a)
        local start_reg = tonumber(b)
        local end_reg = tonumber(c)
        local result = ""
        for i = start_reg, end_reg do
        result = result .. registers[i]
        end
        registers[dest_reg] = result
        elseif opcode == "RETURN" then
        return registers[tonumber(a)]
        end
        
        pc = pc + 1
        end
        end
        
        -- test the interpreter with the bytecode generated by the encoder function
        local result = execute_bytecode("Hello, Lua Bytecode Interpreter!")
        print(result) -- output: "WYV_Gur Yhpn Oyrpbcqr Vagreangvbare!"      