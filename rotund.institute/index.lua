local data = JFile("data.json")
local key = data:getstring("key")

local urldata = urldata()

if urldata.key == key and urldata.series and urldata.episode then
  local file = "files/" .. urldata.series .. "/" .. urldata.episode .. ".mp4"
  content("video/mp4")
  serve(file)
else
  content("text/html")
  serve("index.html")
end
