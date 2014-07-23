local cjson = require 'cjson'
require 'init_data'
CATEGORY = {"C1","C2"}
SEGMENTATIONS = {"X1","X2"}
local RATE = {
        C1 = {
            p  = 1,
            X1 = 0.5,
            X2 = 0.5
        },

        C2 = {
            p  = 1,
            X1 = 0.5,
            X2 = 0.5
        }
}

local statistic = {
            total = 0,
            detail = {
                C1 = {
                    n = 0,
                    X1 = 0,
                    X2 = 0
                },

                C2 = {
                    n = 0,
                    X1 = 0,
                    X2 = 0
                }
            }
        }
Learner = {}
function Learner.count(user)
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
    --if statistic.total < UPDATE_NUM then 
    --    return
    --end

    local total = statistic.total
    for k,v in pairs(statistic.detail) do
        rate[k] = {}
        local n = v.n
        for _,key in ipairs(SEGMENTATIONS) do
            rate[k].p = n / total
            rate[k][key] = ((v[key] / n) + RATE[k][key])/2
        end
    end
    RATE = rate
end


user = {
            C1 = {"X1"},
            C2 = {"X2"}
       }
Learner.count(user)
print(cjson.encode(statistic))
Learner.update_RATE()
print(cjson.encode(RATE))
