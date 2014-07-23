----------------------About Learner------------------
--here we get data from web and build statistic
--learner receive data like this:
--data = {
--          C1 = ["X1","X3","X5"]
--          C2 = ["X1","X4","X5"]
--          C3 = ["X2","X4","X5"]
--       }
--these can be repeated
---------------config-----------
UPDATE_NUM = 300
FILE_NAME = 'data.ini'
SEGMENTATIONS = {"X1","X2","X6","X7","X8"}
require 'init_data'

local Learner = {}
RATE = {}
statistic = {}
function Learner.init()
    file = io.open('data.ini','w')
    if file ~= nil then 
        for line in file:lines() do
            if line ~= nil then 
                init_data = cjson.decode(line)
            else 
                init_data = cjson.decode(get_init_data)
            end
        end
    else
        print("error:no data.ini file")
        init_data = cjson.decode(get_init_data)
    end
    file:close()
    RATE = init_data.RATE
    statistic = init_data.statistic
end


----user hold such data:
--user = {
--          C1=["X1","X3","X5"]
--          C2=["X2","X3","X5"]
--       }
function Learner.learn(user)
    for k,v in pairs(user) do 
        statistic.total = statistic.total + 1
        local detail = statistic.detail
        detail[k].n = detail[k].n+1
        for _,x in ipairs(v) do
            detail[k][x] = detail[k][x] + 1
        end
    end
end

function Learner.update_RATE()
    local rate = {nil,nil,nil,nil,nil,nil}
    if statistic.total < UPDATE_NUM then 
        return
    end

    local total = statistic.total
    for k,v in pairs(statistic.detail) do
        rate.v = {}
        local n = v.n
        for _,key in ipairs(SEGMENTATIONS) do
            rate[k].p = n / total
            rate[k][key] = ((v[key] / n) + RATE[k][key])/2
        end
    end
    RATE = rate
end

function backup()
    file = io.open(FILE_NAME,'w+')
    local result = {}
    result.RATE = RATE
    result.statistic = statistic
    local line = cjson.encode(result)
    file:write(line)
    file:close()
end

function Learner.get_RATE()
    return RATE or cjson.decode(get_init_data().RATE)
end

return Learner
