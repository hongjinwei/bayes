local cjson = require 'cjson'
local a = {a = 1}
file = io.open('data.txt','w+')
file:write(cjson.encode(a))
file:close()
