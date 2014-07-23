local cjson = require 'cjson'
file = io.open('data.txt','r')
local l
for line in file:lines() do
    l = line
    print(line)
end

line = cjson.decode(l)
for k,v in pairs(line) do
    print(k,v)
end
