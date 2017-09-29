
-- By @DEV_NOVAR
--WRAITN by tahaj20
--------------------------------

local function run_bash(str)
    local cmd = io.popen(str)
    local result = cmd:read('*all')
    return result
end
--------------------------------
local api_key = nil
local base_api = "https://maps.googleapis.com/maps/api"
--------------------------------
local function get_latlong(area)
	local api      = base_api .. "/geocode/json?"
	local parameters = "address=".. (URL.escape(area) or "")
	if api_key ~= nil then
		parameters = parameters .. "&key="..api_key
	end
	local res, code = https.request(api..parameters)
	if code ~=200 then return nil  end
	local data = json:decode(res)
	if (data.status == "ZERO_RESULTS") then
		return nil
	end
	if (data.status == "OK") then
		lat  = data.results[1].geometry.location.lat
		lng  = data.results[1].geometry.location.lng
		acc  = data.results[1].geometry.location_type
		types= data.results[1].types
		return lat,lng,acc,types
	end
end
--------------------------------
local function get_staticmap(area)
	local api        = base_api .. "/staticmap?"
	local lat,lng,acc,types = get_latlong(area)
	local scale = types[1]
	if scale == "locality" then
		zoom=8
	elseif scale == "country" then 
		zoom=4
	else 
		zoom = 13 
	end
	local parameters =
		"size=600x300" ..
		"&zoom="  .. zoom ..
		"&center=" .. URL.escape(area) ..
		"&markers=color:red"..URL.escape("|"..area)
	if api_key ~= nil and api_key ~= "" then
		parameters = parameters .. "&key="..api_key
	end
	return lat, lng, api..parameters
end
--------------------------------
function run(msg, matches) 
local hash = "group_lang:"..msg.to.id
local lang = redis:get(hash)
	if matches[1]:lower() == 'calc' and matches[2] then 
		if msg.to.type == "private" then 
			return 
       end
		return calc(msg, matches[2])
	end
--------------------------------
if matches[1] == 'ملصق' then
if msg.reply_to_message then
if msg.reply_to_message.photo then
if msg.reply_to_message.photo[3] then
fileid = msg.reply_to_message.photo[3].file_id
elseif msg.reply_to_message.photo[2] then
fileid = msg.reply_to_message.photo[2].file_id
   else
fileid = msg.reply_to_message.photo[1].file_id
  end
downloadFile(fileid, "./download_path/"..msg.to.id..".webp")
sleep(1)
sendDocument(msg.to.id, "./download_path/"..msg.to.id..".webp", msg.id, "@DEV_NOVAR")
        end
     end
  end
-------------------------------- 
if matches[1] == 'صوره' then
if msg.reply_to_message then
if msg.reply_to_message.sticker then
downloadFile(msg.reply_to_message.sticker.file_id, "./download_path/"..msg.to.id..".jpg")
sleep(1)
sendPhoto(msg.to.id, "./download_path/"..msg.to.id..".jpg", "@DEV_NOVAR", msg.id)
        end
     end
  end
 --------------------------------
	  if matches[1]:lower() == 'tr' then 
   local to = matches[2] 
      local res, url = http.request('http://api.beyond-dev.ir/translate?from=.&to='..to..'&text='..URL.escape(matches[3])..'&simple=json') 
      data = json:decode(res) 
  if not lang then 
      return 'Language : '..data.to..'\nTranslation : '..data.translate..'\n____________________\n@DEV_NOVAR' 
    else 
      return 'اللغه: '..data.to..'\nترجمه : '..data.translate..'\n____________________\n@DEV_NOVAR' 
      end 
   end
--------------------------------
	if matches[1]:lower() == 'تحويل ملصق' then
		local eq = URL.escape(matches[2])
		local w = "500"
		local h = "500"
		local txtsize = "100"
		local txtclr = "ff2e4357"
		if matches[3] then 
			txtclr = matches[3]
		end
		if matches[4] then 
			txtsize = matches[4]
		end
		if matches[5] and matches[6] then 
			w = matches[5]
			h = matches[6]
		end
		local url = "https://assets.imgix.net/examples/clouds.jpg?blur=150&w="..w.."&h="..h.."&fit=crop&txt="..eq.."&txtsize="..txtsize.."&txtclr="..txtclr.."&txtalign=middle,center&txtfont=Futura%20Condensed%20Medium&mono=ff6598cc"
		local receiver = msg.to.id
		local  file = download_to_file(url,'text.webp')
sendDocument(msg.to.id, file, msg.id, "@DEV_NOVAR")
	end
--------------------------------
	if matches[1]:lower() == 'تحويل صوره' then
		local eq = URL.escape(matches[2])
		local w = "500"
		local h = "500"
		local txtsize = "100"
		local txtclr = "ff2e4357"
		if matches[3] then 
			txtclr = matches[3]
		end
		if matches[4] then 
			txtsize = matches[4]
		end
		if matches[5] and matches[6] then 
			w = matches[5]
			h = matches[6]
		end
		local url = "https://assets.imgix.net/examples/clouds.jpg?blur=150&w="..w.."&h="..h.."&fit=crop&txt="..eq.."&txtsize="..txtsize.."&txtclr="..txtclr.."&txtalign=middle,center&txtfont=Futura%20Condensed%20Medium&mono=ff6598cc"
		local receiver = msg.to.id
		local  file = download_to_file(url,'text.jpg')
sendPhoto(msg.to.id, file, "@DEV_NOVAR", msg.id)
	end

--------------------------------
if matches[1]:lower() == "م5" or matches[1] == 'h5' and is_mod(msg) then
if not lang then
text = [[
        👑 اهلا بك في اوامر الخدميه 👑


🔨〰〰〰〰〰〰〰🔧


● ◄|| تحويل صوره + 〰 النص 〰


● ◄|| تحويل ملصق + 〰 النص 〰


🎐〰〰〰〰〰〰〰🎐

¶| 🔚  الاوامر ادنا بالرد تعمل فقط ⬇⬇


📛 ◄ لتحويل الصوره الى ملصق 
قم بارسال صوره 
من ثم قم بعمل رد للصوره وارسل |€ ملصق €|



📛◄ لتحويل الملصق الى صوره
قم بارسال الملصق
من ثم قم بعمل رد للملصق وارسل |€ صوره €|


🚩〰〰〰〰〰〰🚩

🎐: شكرا لكم 


]]
end
return text
end

end
--------------------------------
return {               
	patterns = {
       "^(م5)$",
		"^(صوره)$",
		"^(ملصق)$",
		"^(tr) ([^%s]+) (.*)$",
		"^(تحويل صوره) (.+)$",
		"^(تحويل ملصق) (.+)$",
		}, 
	run = run,
	}

--by TAHA
--------الملف جان cli وكدرت احول ذني الاوامر بس للapi
