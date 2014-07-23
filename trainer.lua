local cjson = require 'cjson'
-----------------------config-----------------------
--conclusions: C1~C12
--segmentations: X1~X6
--p(C1) ~ p(C2)
local Conclusion_p = {0.15,0.3,0.08,0.02,0.04,0.2,0.06,0.01,0.04,0.05,0.05}

--Prefers
--C1[x1,x3,x5]
--C2[x1,x3,x4]
--C3[x2,x3,x5]
--C4[x2,x3,x4]
--C5[X1,x4,x5]
local Prefers_p = 0.8
----------------------------------------------------
Trainer = {}

--generate random X1~X6 and return a table
function Xrandomer()
    local user = {}
    for i=1,5 do
        
        if  math.random() < 0.5 then 
            table["C" .. i] =  "X" .. i
        else 
            return "X" .. (1 + i) 
        end
    end
end

function Trainer.generate()
    local user = {}     
    if math.random() < 0.8 then 
        user = {
            C1 = {"X1","X3","X5"}
            C2 = {"X1","X3","X4"}
            C3 = {"X2","X3","X5"}
            C4 = {"X2","X3","X4"}
            C5 = {"X1","X4","X5"}
        }
    else 
        user = Xrandomer()
        
        
end




function list_counter(list)
local num = 0
for _,k in ipairs(list) do
    num = num + k
end
print(num)
end
