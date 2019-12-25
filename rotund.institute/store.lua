local data = JFile("data.json")
local key = data:getstring("key")

if urldata().key == key then
  content("application/json")
  print(tostring(data))
else
  status(403)
end
