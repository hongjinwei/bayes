a = {"a","b","c"}
d = {a = 1}
b = {c={a=1,b=2,c=3}}
for k,v in pairs(d) do
    print(b.c[k])
end
