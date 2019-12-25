local data = JFile("data.json")
local key = data:getstring("key")
local users_key = urldata().key

if users_key == key then
  content("application/json")
  log("serving data")
  print(tostring(data))
else
  log("incorrect key: "..users_key)
  status(403)
end
