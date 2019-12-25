local data = JFile("data.json")
local key = data:getstring("key")

local urldata = urldata()

if urldata.key == key and urldata.series and urldata.episode then
  local file = "files/" .. urldata.series .. "/" .. urldata.episode .. ".mp4"
  log("serving: "..file)
  content("video/mp4")
  serve(file)
else
  log("serving homepage")
  content("text/html")
  serve("index.html")
end
