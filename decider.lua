-----------------About Decider---------------------- 
--this is a decider to decide which kind of advertisement this user would be intersted in
--and it is based on bayesan statiscal modelling
--there are serveral segmentations to decide and these should be independece to each other
--this means the two events Ci,Cj （Ci and Cj) == null 
--we calculate the P(Cj|X1,X2,..,Xn) =  P(X1|Cj)*P(X2|Cj)*...*P(Xn|Cj)*P(Cj) and the max P(Cj|X)
--stands the most probable answer we need,which means Cj is what we want.
--
------------------Ad Category------------------------
--C1  = Clothing
--C2  = Sports
--C3  = Jewelry
--C4  = Digital
--C5  = Appliance
--C6  = Cosmetic
--C7  = Baby
--C8  = HouseHold
--C9  = Daily
--C10 = Car
--C11 = Pets&Entertaiment
--C12 = Service
-----------------segmentations-----------------------
--X1  = male
--X2  = female
--X3  = western
--X4  = eastern
--X5  = developed
--X6  = undeveloped
------------------data template--------------------
--RATE = {
--           C1 = {
--                   p  = 0.1
--                   X1 = 0.3
--                   X2 = 0.7
--                   X3 = 0.85
--                   X4 = 0.05
--                   X5 = 0.6
--                   X6 = 0.3
--                }..{} 
--       }
--
--user = ["X1","X3","X5"]
--
-------------------------------------------------------
local learner = require 'learner'
---------------------config------------------------
local DIFF = 0.05
local RATE = {}
--------------------------------------------------
local Decider = {}
function Decider.update_RATE()
    statistic = learner.get_RATE()
end

self.update_RATE()

local function Decider.decide(user)
    if #user == 0  then 
        return 
    end
    local max_rate  = 0
    local choosen_category   = 0
    local rate = p_rate(user, RATE)
    for k,v in pairs(rate) do
        if v > max_rate then 
            max_rate = v
            choosen_category  = k
        end
    end
    return choosen_category 
end

--p_rate returns data like this 
--rate = {
--          C1 = 0.2 --p(Cj|X)
--          C2 = 0.4
--          C3 = 0.67
--       }
local function p_rate(user, RATE)
    --if user hold no data return a random choosen category
    if not next(user) then 
        return 
    end
    local result = {nil,nil,nil,nil,nil}
    for k,v in pairs(RATE) do 
        local p = v.p or 0.0001
        for i=1,#user do
            p = p * (v[user[i]] or 0.0001)
        end
        result.k = p
    end
    return result
end
return Decider
