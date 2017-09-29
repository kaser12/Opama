-- لا تخمط يحلو تعبان بيه وناجت خالتي taha
local function modadd(msg)
    -- تريد تخمط تع كلي حخمط لان نشك طيزي واتعلم ولا تخمط
    if not is_admin(msg) then
        return 'لآ يِٰہمٰ̲ہڪٰྀہٰٰٖنَِٰہٰڪٰྀہٰٰٖ ║♚💨🌛⋮ֆذِآلڪٰྀہٰٰٖ للمٰ̲ہدرآء╬ֆ☻♚ ف͒ہٰٰقྀ̲ہٰٰٰطۨہٰٰ➤|💨ֆ🌪'
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
   return 'المجـمٰ̲ــوعهہ 💬 بـالتٲكيـٰ̲ـد مفعـلهہ ❌‏﴾ ֆ'
end
local status = getChatAdministrators(msg.to.id).result
for k,v in pairs(status) do
if v.status == "creator" then
if v.user.username then
creator_id = v.user.id
user_name = '@'..check_markdown(v.user.username)
else
user_name = check_markdown(v.user.first_name)
end
end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {[tostring(creator_id)] = user_name},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      settings = {
          set_name = msg.to.title,
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_edit = 'no',
          lock_mention = 'no',
          lock_webpage = 'no',
          lock_markdown = 'no',
          flood = 'yes',
          lock_bots = 'yes',
          lock_pin = 'no',
          welcome = 'no',
		  lock_join = 'no',
		  lock_arabic = 'no',
		  num_msg_max = '5',
		  set_char = '40',
		  time_check = '2',
          },
   mutes = {
                  mute_forward = 'no',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'no',
                  mute_text = 'no',
                  mute_photo = 'no',
                  mute_gif = 'no',
                  mute_location = 'no',
                  mute_document = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                   mute_all = 'no',
				   mute_tgservice = 'no',
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
  return 'تّٰـــــــمٍٰ⁽🥁🙍🏻‍♂️✦₎ تَہَٰف͒ہٰٰ؏ۤـہٰٰيِٰہل آلبّہوِتَہَٰٰ☬✨🛡⇝﴾ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ ᵛ͢ᵎᵖ📯💛﴾⌁'
end

local function modrem(msg)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
        return 'لآ يِٰہمٰ̲ہڪٰྀہٰٰٖنَِٰہٰڪٰྀہٰٰٖ ║♚💨🌛⋮ֆذِآلڪٰྀہٰٰٖ للمٰ̲ہدرآء╬ֆ☻♚ ف͒ہٰٰقྀ̲ہٰٰٰطۨہٰٰ➤|💨ֆ🌪'
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
    return 'آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ⋮❊🐨🌈﴾ لمٰ̲ہ يِٰہتَہَٰمٰ̲ہ تَہَٰف͒ہٰٰ؏ۤـہٰٰيِٰہلٰ̲ھہآ ║🐌🕸✤'
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
  return 'تّٰـــــــمٍٰ⁽🥁🙍🏻‍♂️✦₎ تعـــطــــيـــل آلبّہوِتَہَٰٰ☬✨🛡⇝﴾ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ ᵛ͢ᵎᵖ📯💛﴾⌁'
end

local function modlist(msg)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
    return 'المجـمٰ̲ــوعهہ 💬 بـالتٲكيـٰ̲ـد معطلهہ ❌‏﴾ ֆ'
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
    return 'لْٰــيَٰــــسٌٍـ هَٰہۧــنٍٰـــاَٰكٍٰــ اَٰدِٰمٍٰــنٍٰــيَٰــهَٰہۧ ∬💛✨ֆ'
end
   message = 'المدراء🎈'
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
    return 'المجـمٰ̲ــوعهہ 💬 بـالتٲكيـٰ̲ـد معطلهہ ❌‏﴾ ֆ'
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
    return "لْٰــيَٰــــسٌٍـ هَٰہۧــنٍٰـــاَٰكٍٰــ مشرفين"
end
   message = 'n/ الادمنيه 🌞'
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function filter_word(msg, word)
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)]['filterlist'] then
      data[tostring(msg.to.id)]['filterlist'] = {}
      save_data(_config.moderation.data, data)
    end
    if data[tostring(msg.to.id)]['filterlist'][(word)] then
        return "تَہَٰــــمٰ̲ہ آضۜہٰٰــآف͒ہٰٰتَہَٰــٰ̲ھہــــآ آلـــــى قྀ̲ہٰٰٰــآئــمٰ̲ہة آلـــمٰ̲ہــنَِٰہٰـ؏ۤـہٰٰ ♚⋮ֆ🛡🦅"
      end
    data[tostring(msg.to.id)]['filterlist'][(word)] = true
    save_data(_config.moderation.data, data)
      return "بآلــف͒ہٰٰــ؏ۤـہٰٰــل تَہَٰــــمٰ̲ہ آضۜہٰٰــآف͒ہٰٰتَہَٰــٰ̲ھہــــآ آلـــــى قྀ̲ہٰٰٰــآئــمٰ̲ہة آلـــمٰ̲ہــنَِٰہٰـ؏ۤـہٰٰ┋🎼🕊 ͢ۦٰ‏❥"
    end

local function unfilter_word(msg, word)
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)]['filterlist'] then
      data[tostring(msg.to.id)]['filterlist'] = {}
      save_data(_config.moderation.data, data)
    end
    if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
      save_data(_config.moderation.data, data)
        return "تَہََٰہَٰــــمٰ̲ہٰ̲ہ آزَآلـــتَہَٰـــٰ̲ھہــآ آلـــــى قྀ̲ہٰٰٰྀ̲ہٰٰٰــآئــمٰ̲ہٰ̲ہة آلـــمٰ̲ہٰ̲ہــنَِٰہَِٰٰہٰـ؏ۤـہٰٰ ♚⋮ֆ🛡🦅"
    else
        return "بآلــف͒ہٰٰــ؏ۤـہٰٰــل تَہََٰہَٰــــمٰ̲ہٰ̲ہ آزَآلـــتَہَٰـــٰ̲ھہــآ آلـــــى قྀ̲ہٰٰٰྀ̲ہٰٰٰــآئــمٰ̲ہٰ̲ہة آلـــمٰ̲ہٰ̲ہــنَِٰہَِٰٰہٰـ؏ۤـہٰٰ ║🐌🕸✤ֆ"
    end
  end
  
----------قفل الروابط-----------
local function lock_link(msg, data, target)
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الروابط في المجموعه"
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الروابط"
end
end

local function unlock_link(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الروابط في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الروابط" 
end
end

---------------قفل التاكات-------------------
local function lock_tag(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التاك في المجموعه"
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التاك"
end
end

local function unlock_tag(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التاك في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التاك" 
end
end

---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 المنشن في المجموعه"
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 المنشن"
end
end

local function unlock_mention(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 المنشن في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 المنشن" 
end
end

---------------قفل العربيه--------------
local function lock_arabic(msg, data, target)
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 اللغه العربيه في المجموعه"
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 اللغه العربيه"
end
end

local function unlock_arabic(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 اللغه العربيه في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 اللغه العربيه" 
end
end

---------------قفل التعديل-------------------
local function lock_edit(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التعديل في المجموعه"
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التعديل "
end
end

local function unlock_edit(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التعديل في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التعديل " 
end
end

---------------قفل الكلايش-------------------
local function lock_spam(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الكلايش في المجموعه"
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الكلايش📝"
end
end

local function unlock_spam(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الكلايش في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الكلايش" 
end
end

---------------قفل التكرار-------------------
local function lock_flood(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_flood = data[tostring(target)]["settings"]["lock_flood"] 
if lock_flood == "yes" then
 return "بالفعلہٰٰ تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التكرار في المجموعه"
else
 data[tostring(target)]["settings"]["lock_flood"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التكرار "
end
end

local function unlock_flood(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local lock_flood = data[tostring(target)]["settings"]["lock_flood"]
 if lock_flood == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التكرار في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_flood"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التكرار " 
end
end

---------------قفل البوتات-------------------
local function lock_bots(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 البوتات في المجموعه "
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 البوتات"
end
end

local function unlock_bots(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 البوتات في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 البوتات" 
end
end

---------------قفل الدخول-------------------
local function lock_join(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الدخول الى المجموعه"
else
 data[tostring(target)]["settings"]["lock_join"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الدخول الى المجموعه"
end
end

local function unlock_join(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الدخول الى المجموعه " 
else 
data[tostring(target)]["settings"]["lock_join"] = "no"
save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الدخول الى المجموعه" 
end
end

---------------قفل الماركداون-------------------
local function lock_markdown(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الماركداون في المجموعه"
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐  الماركداون"
end
end

local function unlock_markdown(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الماركداون في المجموعه"
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الماركداون"
end
end

---------------قفل الصفحات-------------------
local function lock_webpage(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الصفحات في المجموعه"
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الصفحات "
end
end

local function unlock_webpage(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الصفحات في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الصفحات " 
end
end

---------------قفل التثبيتات-------------------
local function lock_pin(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التثبيت في المجموعه"
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التثبيت"
end
end

local function unlock_pin(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التثبيت في المجموعه" 
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التثبيت في المجموعه" 
end
end

function group_settings(msg, target) 	
if not is_mod(msg) then
 	return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local data = load_data(_config.moderation.data)
local settings = data[tostring(target)]["settings"] 
text = "*🔓 تعني مفتوح \n🔒 تعني مقفول :*\n\n_التعديل 🚩:_ *"..settings.lock_edit.."*\n_الروابط 🚩:_ *"..settings.lock_link.."*\n_التاك 🚩 :_ *"..settings.lock_tag.."*\n_الدخول 🚩:_ *"..settings.lock_join.."*\n_التكرار 🚩:_ *"..settings.flood.."*\n_الكلايش 🚩 :_ *"..settings.lock_spam.."*\n_المنشن 🚩:_ *"..settings.lock_mention.."*\n_العربيه 🚩 :_ *"..settings.lock_arabic.."*\n_الصفحات 🚩 :_ *"..settings.lock_webpage.."*\n_الماركدون 🚩 :_ *"..settings.lock_markdown.."*\n_الترحيب 🚩:_ *"..settings.welcome.."*\n_التثبيت 🚩:_ *"..settings.lock_pin.."*\n_البوتات 🚩 :_ *"..settings.lock_bots.."*\n_عدد التكرار🚩:_ *"..settings.num_msg_max.."*\n_عدد الاحرف 🚩:_ *"..settings.set_char.."*\nزمن التكرار 🚩 :_ *"..settings.time_check.."*\n*🌟🌟🌟🌟*\n*C H B O T*: @DEV_NOVAR"
text = string.gsub(text, 'yes', '🔒')
text = string.gsub(text, 'no', '🔓')
text = string.gsub(text, '0', '0')
text = string.gsub(text, '1', '1')
text = string.gsub(text, '2', '2️')
text = string.gsub(text, '3', '3️')
text = string.gsub(text, '4', '4️')
text = string.gsub(text, '5', '5️')
text = string.gsub(text, '6', '6️')
text = string.gsub(text, '7', '7️')
text = string.gsub(text, '8', '8️')
text = string.gsub(text, '9', '9️')
return text
end

--------قفل الكل -----------
local function mute_all(msg, data, target) 
if not is_mod(msg) then 
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈" 
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 جميع الاعدادات في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 جميع الاعدادات" 
end
end

local function unmute_all(msg, data, target) 
if not is_mod(msg) then 
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈" 
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 جميع الاعدادات في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 جميع الاعدادات"  
end
end

---------------قفل المتحركه-------------------
local function mute_gif(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 المتحركه في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 المتحركه "
end
end

local function unmute_gif(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 المتحركه في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 المتحركه" 
end
end
---------------قفل الدردشه-------------------
local function mute_text(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الدردشه في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الدردشه"
end
end

local function unmute_text(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الدردشه في المجموعه "
else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الدردشه" 
end
end
---------------قفل الصور-------------------
local function mute_photo(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الصور في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الصور"
end
end

local function unmute_photo(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الصور في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓الصور" 
end
end
---------------قفل الفيديو-------------------
local function mute_video(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الفيديو في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الفيديو"
end
end

local function unmute_video(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الفيديو في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الفيديو" 
end
end
---------------قفل الصوت-------------------
local function mute_audio(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then
 return "*بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الصوت في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الصوت"
end
end

local function unmute_audio(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الصوت في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الصوت"
end
end
---------------قفل الاغاني-------------------
local function mute_voice(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الاغاني في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الاغاني"
end
end

local function unmute_voice(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الاغاني في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الاغاني" 
end
end
---------------قفل الملصقات-------------------
local function mute_sticker(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الملصقات في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الملصقات"
end
end

local function unmute_sticker(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الملصقات في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الملصقات" 
end
end
---------------قفل الجهات-------------------
local function mute_contact(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الجهات في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الجهات"
end
end

local function unmute_contact(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الجهات في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الجهات" 
end
end
---------------قفل التوجيه -------------------
local function mute_forward(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ ��🎈"
end
local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التوجيه في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التوجيه"
end
end

local function unmute_forward(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 التوجيه في المجموعه"
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 التوجيه" 
end
end
---------------قفل المواقع-------------------
local function mute_location(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 المواقع في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 المواقع"
end
end

local function unmute_location(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 المواقع في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 المواقع" 
end
end
---------------قفل الملفات-------------------
local function mute_document(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الملفات في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الملفات"
end
end

local function unmute_document(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end 
local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الملفات في المجموعه" 
else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الملفات" 
end
end
---------------قفل الاشعارات-------------------
local function mute_tgservice(msg, data, target) 
if not is_mod(msg) then
 return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then
 return "بالفعل تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الاشعارات في المجموعه"
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
 return "تَہَٰــــمٰ̲ ✔ قྀ̲ہٰٰٰف͒ہٰٰل 🔐 الاشعارات"
end
end

local function unmute_tgservice(msg, data, target)
 if not is_mod(msg) then
return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"
end
local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then
return "بالفعل تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الاشعارات في المجموعه"
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
return "تَہَٰــــمٰ̲ہ ✔ ف͒ہٰٰتَہَٰحہٰٰ 🔓 الاشعارات"
end
end

----------اعدادات المجموعه---------
local function mutes(msg, target) 	
if not is_mod(msg) then
 	return "آنَِٰہٰـــتَہ لستَٰ آدمٰ̲ہنَِٰہٰ ف͒ہٰٰيِٰہ آلمٰ̲ہجْۧمٰ̲ہوِ؏ۤـہٰٰٰ̲ھہ 🌝🎈"	
end
local data = load_data(_config.moderation.data)
local mutes = data[tostring(target)]["mutes"] 
 text = "*\n الكل 🌟"..mutes.mute_all.."*\nالمتحركه 🎃:_ *"..mutes.mute_gif.."*\nالدردشه 💭:_ *"..mutes.mute_text.."*\nالصور 📛:_ *"..mutes.mute_photo.."*\nالفيديو 🔰:_ *"..mutes.mute_video.."*\n_الصوت 🌞 :_ *"..mutes.mute_audio.."*\n_الاغاني ☑ :_ *"..mutes.mute_voice.."*\n_الملسقات 🐰 :_ *"..mutes.mute_sticker.."*\n_الجهات 📱 :_ *"..mutes.mute_contact.."*\n_التوجيه ♻ :_ *"..mutes.mute_forward.."*\n_المواقع 🌏 :_ *"..mutes.mute_location.."*\n_الملفات 📃 :_ *"..mutes.mute_document.."*\n_الاشعارات 🎶 :_ *"..mutes.mute_tgservice.."*\n*🌟🌟🌟🌟*\n*CH B O T *: @DEV_NOVAR"
text = string.gsub(text, 'yes', 'مقفول')
text = string.gsub(text, 'no', 'مفتوح')
 return text
end

local function taha(msg, matches)
local data = load_data(_config.moderation.data)
local target = msg.to.id
----------------التفعيلات--------------
if matches[1] == "تفعيل" and is_sudo(msg) then
return modadd(msg)
   end
if matches[1] == "تعطيل" and is_sudo(msg) then
return modrem(msg)
   end
if matches[1] == "الادمنيه" and is_mod(msg) then
return ownerlist(msg)
   end
if matches[1] == "قائمه المنع" and is_mod(msg) then
return filter_list(msg)
   end
if matches[1] == "المدراء" and is_mod(msg) then
return modlist(msg)
   end
if matches[1] == "قائمه المميزين" and is_mod(msg) then
return whitelist(msg.to.id)
   end
if matches[1] == "معلومات" and matches[2] and (matches[2]:match('^%d+') or matches[2]:match('-%d+')) and is_mod(msg) then
		local usr_name, fst_name, lst_name, biotxt = '', '', '', ''
		local user = getUser(matches[2])
		if not user.result then
			return 'لم يتم العثور على المعلومات'
		end
		user = user.information
		if user.username then
			usr_name = '@'..check_markdown(user.username)
		else
			usr_name = '---'

		end
		if user.lastname then
			lst_name = escape_markdown(user.lastname)
		else
			lst_name = '---'
		end
		if user.firstname then
			fst_name = escape_markdown(user.firstname)
		else
			fst_name = '---'
		end
		if user.bio then
			biotxt = escape_markdown(user.bio)
		else
			biotxt = '---'
		end
		local text = 'المعرف ✏: '..usr_name..' \nالاسم الاول 📝: '..fst_name..' \nالاسم الثاني 💭: '..lst_name..' \nمعلوماتك: '..biotxt
		return text
end
if matches[1] == "استجواب" and matches[2] and not matches[2]:match('^%d+') and is_mod(msg) then
		local usr_name, fst_name, lst_name, biotxt, UID = '', '', '', '', ''
		local user = resolve_username(matches[2])
		if not user.result then
			return 'لم يتم العثور على المعلومات'
		end
		user = user.information
		if user.username then
			usr_name = '@'..check_markdown(user.username)
		else
			usr_name = '_Error! Please Try Again._'
			return usr_name
		end
		if user.lastname then
			lst_name = escape_markdown(user.lastname)
		else
			lst_name = '---'
		end
		if user.firstname then
			fst_name = escape_markdown(user.firstname)
		else
			fst_name = '---'
		end
		if user.id then
			UID = user.id
		else
			UID = '---'
		end
		if user.bio then
			biotxt = escape_markdown(user.bio)
		else
			biotxt = '---'
		end
		local text = 'Username: '..usr_name..' \nUser ID: '..UID..'\nFirstName: '..fst_name..' \nLastName: '..lst_name..' \nBio: '..biotxt
		return text
end
if matches[1] == '  ' then
return _config.info_text
end
if matches[1] == "ايدي" then
   if not matches[2] and not msg.reply_to_message then
local status = getUserProfilePhotos(msg.from.id, 0, 0)
   if status.result.total_count ~= 0 then
	sendPhotoById(msg.to.id, status.result.photos[1][1].file_id, msg.id, 'ايدي المجموعه : 💭 '..msg.to.id..'\n* ايديك:* 👑 '..msg.from.id.. '\n* اسمك :*🎈'..msg.from.first_name..'\n معرفك : @'..msg.from.username or '..')
	else
   return "*ايدي المجموعه :* `🎩"..tostring(msg.to.id).."`\n*ايديك :* 🌞`"..tostring(msg.from.id).."`"
   end
   elseif msg.reply_to_message and not msg.reply.fwd_from and is_mod(msg) then
     return "`"..msg.reply.id.."`"
   elseif not string.match(matches[2], '^%d+$') and matches[2] ~= "from" and is_mod(msg) then
    local status = resolve_username(matches[2])
		if not status.result then
			return 'آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ'
		end
     return "`"..status.information.id.."`"
   elseif matches[2] == "from" and msg.reply_to_message and msg.reply.fwd_from then
     return "`"..msg.reply.fwd_from.id.."`"
   end
end
if matches[1] == "تثبيت" and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(msg.to.id)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
pinChatMessage(msg.to.id, msg.reply_id)
return "*تَہَٰــــمٰ̲ہ تَہَٰــثہٰٰـبّہــيِٰہتَہَٰ آلــرسٰٰٓــآلــٰ̲ھہ 🗣💙*"
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(msg.to.id)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
pinChatMessage(msg.to.id, msg.reply_id)
return "*تَہَٰــــمٰ̲ہ تَہَٰــثہٰٰـبّہــيِٰہتَہَٰ آلــرسٰٰٓــآلــٰ̲ھہ 🗣💙*"
end
end
if matches[1] == 'الغاء تثبيت' and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
unpinChatMessage(msg.to.id)
return "تَہَٰــــمٰ̲ہ الغاء  تَہَٰــثہٰٰـبّہــيِٰہتَہَٰ آلــرسٰٰٓــآلــٰ̲ھہ 🎈💣"
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
unpinChatMessage(msg.to.id)
return "*تَہَٰــــمٰ̲ہ الغاء  تَہَٰــثہٰٰـبّہــيِٰہتَہَٰ آلــرسٰٰٓــآلــٰ̲ھہ 🎈💣*"
end
end
if matches[1] == 'الاعدادات' then

return mutes(msg, target)

end

if matches[1] == 'الوسائط' then

return group_settings(msg, target)

end
   if matches[1] == "رفع ادمن" and is_admin(msg) then
   if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _بالتاكيد تم 【ꪜ】_ *ترقيته ادمن في المجموعه 💡💭*"
    else
  data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] = username
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _تم 【ꪜ】_ *ترقيته ادمن في المجموعه 💡💭*"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
  if not getUser(matches[2]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if data[tostring(msg.to.id)]['owners'][tostring(matches[2])] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..user_name.." `"..matches[2].."` _بالتاكيد تم 【ꪜ】_ *ترقيته ادمن في المجموعه 💡💭*"
    else
  data[tostring(msg.to.id)]['owners'][tostring(matches[2])] = user_name
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..user_name.." `"..matches[2].."` _تم 【ꪜ】_ *ترقيته ادمن في المجموعه 💡💭*"
   end
   elseif matches[2] and not matches[2]:match('^%d+') then
  if not resolve_username(matches[2]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
   local status = resolve_username(matches[2]).information
   if data[tostring(msg.to.id)]['owners'][tostring(status.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."`` _بالتاكيد تم 【ꪜ】_ *ترقيته ادمن في المجموعه 💡💭*"
    else
  data[tostring(msg.to.id)]['owners'][tostring(status.id)] = check_markdown(status.username)
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _تم 【ꪜ】_ *ترقيته ادمن في المجموعه 💡💭*"
   end
end
end
   if matches[1] == "تنزيل ادمن" and is_admin(msg) then
      if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if not data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _بالتاكيد تم 【ꪜ】_ *تنزيله من قائمه الادمنيه 📛*"
    else
  data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] = nil
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _ تم 【ꪜ】_ *تنزيله من قائمه الادمنيه 🎌*"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
  if not getUser(matches[2]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if not data[tostring(msg.to.id)]['owners'][tostring(matches[2])] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..user_name.." `"..matches[2].."` _بالتاكيد تم 【ꪜ】_ *تنزيله من قائمه الادمنيه 📛*"
    else
  data[tostring(msg.to.id)]['owners'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
    return "_الـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..user_name.." `"..matches[2].."` _ تم 【ꪜ】_ *تنزيله من قائمه الادمنيه 🎌*"
      end
   elseif matches[2] and not matches[2]:match('^%d+') then
  if not resolve_username(matches[2]).result then
   return "*_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@*"
    end
   local status = resolve_username(matches[2]).information
   if not data[tostring(msg.to.id)]['owners'][tostring(status.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _بالتاكيد تم 【ꪜ】_ *تنزيله من قائمه الادمنيه 📛*"
    else
  data[tostring(msg.to.id)]['owners'][tostring(status.id)] = nil
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _ تم 【ꪜ】_ *تنزيله من قائمه الادمنيه 🎌*"
      end
end
end
   if matches[1] == "رفع مدير" and is_owner(msg) then
   if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _بالتاكيد تم 【ꪜ】_ *ترقيته مدير المجموعه 🎐🚩*"
    else
  data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] = username
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _تم 【ꪜ】_ *ترقيته مدير المجموعه 🎐🚩*"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
  if not getUser(matches[2]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if data[tostring(msg.to.id)]['mods'][tostring(matches[2])] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@_"..user_name.." `"..matches[2].."` _بالتاكيد تم 【ꪜ】_ *ترقيته مدير المجموعه 🎐🚩*"
    else
  data[tostring(msg.to.id)]['mods'][tostring(matches[2])] = user_name
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..user_name.." `"..matches[2].."` _تم 【ꪜ】_ *ترقيته مدير المجموعه 🎐🚩*"
   end
   elseif matches[2] and not matches[2]:match('^%d+') then
  if not resolve_username(matches[2]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
   local status = resolve_username(matches[2]).information
   if data[tostring(msg.to.id)]['mods'][tostring(user_id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _بالتاكيد تم 【ꪜ】_ *ترقيته مدير المجموعه 🎐🚩*"
    else
  data[tostring(msg.to.id)]['mods'][tostring(status.id)] = check_markdown(status.username)
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _تم 【ꪜ】_ *ترقيته مدير المجموعه 🎐🚩*"
   end
end
end
   if matches[1] == "تنزيل مدير" and is_owner(msg) then
      if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if not data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _بالتاكيد تم ꪜ _ تنزيله من قائمه المدراء 🎐🔧"
    else
  data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] = nil
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..username.." `"..msg.reply.id.."` _تم ꪜ _تنزيله من قائمه المدراء🎐"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
  if not getUser(matches[2]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if not data[tostring(msg.to.id)]['mods'][tostring(matches[2])] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..user_name.." `"..matches[2].."` _بالتاكيد تم ꪜ _ تنزيله من قائمه المدراء 🎐🔧"
    else
  data[tostring(msg.to.id)]['mods'][tostring(matches[2])] = user_name
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..user_name.." `"..matches[2].."` _تم ꪜ _تنزيله من قائمه المدراء🎐"
      end
   elseif matches[2] and not matches[2]:match('^%d+') then
  if not resolve_username(matches[2]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
   local status = resolve_username(matches[2]).information
   if not data[tostring(msg.to.id)]['mods'][tostring(status.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _بالتاكيد تم ꪜ _ تنزيله من قائمه المدراء 🎐🔧"
    else
  data[tostring(msg.to.id)]['mods'][tostring(status.id)] = nil
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _تم ꪜ _تنزيله من قائمه المدراء🎐"
      end
end
end
   if matches[1] == "مميز" and matches[2] == "+" and is_mod(msg) then
   if not matches[3] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@ "..username.." `"..msg.reply.id.."` _is already in_ *white list*"
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] = username
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@ "..username.." `"..msg.reply.id.."` _added to_ *white list*"
      end
	  elseif matches[3] and matches[3]:match('^%d+') then
  if not getUser(matches[3]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
	  local user_name = '@'..check_markdown(getUser(matches[3]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[3]).information.first_name)
	  end
	  if data[tostring(msg.to.id)]['whitelist'][tostring(matches[3])] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@ "..user_name.." `"..matches[3].."` _is already in_ *white list*"
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(matches[3])] = user_name
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@ "..user_name.." `"..matches[3].."` _added to_ *white list*"
   end
   elseif matches[3] and not matches[3]:match('^%d+') then
  if not resolve_username(matches[3]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
   local status = resolve_username(matches[3]).information
   if data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _@"..check_markdown(status.username).." `"..status.id.."` _is already in_ *white list*"
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] = check_markdown(status.username)
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _ @"..check_markdown(status.username).." `"..status.id.."` _added to_ *white list*"
   end
end
end
   if matches[1] == "مميز" and matches[2] == "-" and is_mod(msg) then
      if not matches[3] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if not data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _ "..username.." `"..msg.reply.id.."` _is not in_ *white list*"
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] = nil
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _ "..username.." `"..msg.reply.id.."` _removed from_ *white list*"
      end
	  elseif matches[3] and matches[3]:match('^%d+') then
  if not getUser(matches[3]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
	  local user_name = '@'..check_markdown(getUser(matches[3]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[3]).information.first_name)
	  end
	  if not data[tostring(msg.to.id)]['whitelist'][tostring(matches[3])] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _ "..user_name.." `"..matches[3].."` _is not in_ *white list*"
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(matches[3])] = nil
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _ "..user_name.." `"..matches[3].."` _removed from_ *white list*"
      end
   elseif matches[3] and not matches[3]:match('^%d+') then
  if not resolve_username(matches[3]).result then
   return "*آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ*"
    end
   local status = resolve_username(matches[3]).information
   if not data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] then
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _ @"..check_markdown(status.username).." `"..status.id.."` _is not in_ *white list*"
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] = nil
    save_data(_config.moderation.data, data)
    return "_آلـــ؏ۤـہٰٰــضۜہٰٰـوِ ⋮❊ֆ🦊🥇 _ @"..check_markdown(status.username).." `"..status.id.."` _removed_ *white list*"
      end
end
end
if matches[1]:lower() == "قفل" and is_mod(msg) then
if matches[2] == "الروابط" then
return lock_link(msg, data, target)
end
if matches[2] == "التاك" then
return lock_tag(msg, data, target)
end
if matches[2] == "المنشن" then
return lock_mention(msg, data, target)
end
if matches[2] == "العربيه" then
return lock_arabic(msg, data, target)
end
if matches[2] == "التعديل" then
return lock_edit(msg, data, target)
end
if matches[2] == "الكلايش" then
return lock_spam(msg, data, target)
end
if matches[2] == "التكرار" then
return lock_flood(msg, data, target)
end
if matches[2] == "البوتات" then
return lock_bots(msg, data, target)
end
if matches[2] == "الماركداون" then
return lock_markdown(msg, data, target)
end
if matches[2] == "الصفحات" then
return lock_webpage(msg, data, target)
end
if matches[2] == "التثبيت" and is_owner(msg) then
return lock_pin(msg, data, target)
end
if matches[2] == "الدخول" then
return lock_join(msg, data, target)
end
end
if matches[1]:lower() == "فتح" and is_mod(msg) then
if matches[2] == "الروابط" then
return unlock_link(msg, data, target)
end
if matches[2] == "التاك" then
return unlock_tag(msg, data, target)
end
if matches[2] == "المنشن" then
return unlock_mention(msg, data, target)
end
if matches[2] == "العربيه" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "التعديل" then
return unlock_edit(msg, data, target)
end
if matches[2] == "الكلايش" then
return unlock_spam(msg, data, target)
end
if matches[2] == "التكرار" then
return unlock_flood(msg, data, target)
end
if matches[2] == "البوتات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "الماركداون" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "الصفحات" then
return unlock_webpage(msg, data, target)
end
if matches[2] == "التثبيت" and is_owner(msg) then
return unlock_pin(msg, data, target)
end
if matches[2] == "الدخول" then
return unlock_join(msg, data, target)
end
end
if matches[1]:lower() == "قفل" and is_mod(msg) then
if matches[2] == "المتحركه" then
return mute_gif(msg, data, target)
end
if matches[2] == "الدردشه" then
return mute_text(msg ,data, target)
end
if matches[2] == "الصور" then
return mute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" then
return mute_video(msg ,data, target)
end
if matches[2] == "الصوت" then
return mute_audio(msg ,data, target)
end
if matches[2] == "الاغاني" then
return mute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" then
return mute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" then
return mute_forward(msg ,data, target)
end
if matches[2] == "المواقع" then
return mute_location(msg ,data, target)
end
if matches[2] == "الملفات" then
return mute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == 'الكل' then
return mute_all(msg ,data, target)
end
end
if matches[1]:lower() == "فتح" and is_mod(msg) then
if matches[2] == "المتحركه" then
return unmute_gif(msg, data, target)
end
if matches[2] == "الدردشه" then
return unmute_text(msg, data, target)
end
if matches[2] == "الصور" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" then
return unmute_video(msg ,data, target)
end
if matches[2] == "الصوت" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "الاغاني" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" then
return unmute_forward(msg ,data, target)
end
if matches[2] == "المواقع" then
return unmute_location(msg ,data, target)
end
if matches[2] == "الملفات" then
return unmute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" then
return unmute_tgservice(msg ,data, target)
end
 if matches[2] == 'الكل' then
return unmute_all(msg ,data, target)
end
end
  if matches[1] == 'منع' and matches[2] and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'الغاء منع' and matches[2] and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if matches[1] == 'تغير الرابط' and is_mod(msg) then
  local administration = load_data(_config.moderation.data)
  local link = exportChatInviteLink(msg.to.id)
	if not link then
		return "_قྀ̲ہٰٰٰــمٰ̲ہ بّہــآرسٰٰٓــآل آلــرآبّہـــطۨہٰٰ آلــجْۧديِٰہـــد ↡✼✨💎ᵛ͢ᵎᵖ﴾_"
	else
		administration[tostring(msg.to.id)]['settings']['linkgp'] = link.result
		save_data(_config.moderation.data, administration)
		return "*تّٰــــــــمٍٰ حٌٰـــفِٰـــض اَٰلْٰــرِٰاَٰبٌِٰـــطَُِ اَٰلْٰجًِّدِٰيَٰدِٰ ☫ۦٰ️💛#ֆ’ٰ*"
	end
   end
		if matches[1] == 'ضع رابط' and is_owner(msg) then
		data[tostring(target)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
			return '_قྀ̲ہٰٰٰــمٰ̲ہ بّہــآرسٰٰٓــآل آلــرآبّہـــطۨہٰٰ آلــجْۧديِٰہـــد ↡✼✨💎ᵛ͢ᵎᵖ﴾_'
	   end
		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(target)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(target)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
				return "*تّٰــــــــم تٍٍٰٰـغـيـيــر رِٰاَٰبٌِٰـــطَُِ اَٰلًِّْٰمٍٰـــجمٍٰـــوِٰعه ⁽“͢ 🥁🙍🏻‍♂️✦₎_"
       end
		end
    if matches[1] == 'الرابط' and is_mod(msg) then
      local linkgp = data[tostring(target)]['settings']['linkgp']
      if not linkgp then
        return "_قم بارسال [تغير الرابط] لتغير الرابط ._"
      end
       text = "[Tap Here To Join â£ { "..escape_markdown(msg.to.title).." }]("..linkgp..")"
        return text
     end
  if matches[1] == "ضع قوانين" and matches[2] and is_mod(msg) then
    data[tostring(target)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
    return "تم حفض القوانين "
  end
  if matches[1] == "القوانين" then
 if not data[tostring(target)]['rules'] then
     rules = "â¹ï¸ القوانين هيه :\nاترك الانحراف واحذر من الطرد.\nلدز كلايش انحرافيه .\nعدم نشر الصور والفيدوات والروابط والتوجيه اتبع اوامر المدراء والادمنيه.\nلضل تكمز وتهوبز لحالك .\nاحترم تحترم متحترم بل نعال حبي.\nاترك الزحف وما تجيك المشاكل ط🌝🎈.\n@DEV_NOVAR"
        else
     rules = "*قوانين المجموعه :*\n"..data[tostring(target)]['rules']
      end
    return rules
  end
		if matches[1]:lower() == 'setchar' then
			if not is_mod(msg) then
				return
			end
			local chars_max = matches[2]
			data[tostring(msg.to.id)]['settings']['set_char'] = chars_max
			save_data(_config.moderation.data, data)
     return "*Character sensitivity* _has been set to :_ *[ "..matches[2].." ]*"
  end
  if matches[1]:lower() == 'ضع تكرار' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "تستطيع وضع عدد التكرار من *[2-50]*"
      end
			local flood_max = matches[2]
			data[tostring(msg.to.id)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return "تم وضع عدد التكرار في المجموعه  :_ *[ "..matches[2].." ]*"
       end
  if matches[1]:lower() == 'setfloodtime' and is_mod(msg) then
			if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 10 then
				return "_Wrong number, range is_ *[2-10]*"
      end
			local time_max = matches[2]
			data[tostring(msg.to.id)]['settings']['time_check'] = time_max
			save_data(_config.moderation.data, data)
    return "_Group_ *flood* _check time has been set to :_ *[ "..matches[2].." ]*"
       end
		if matches[1]:lower() == 'امسح' and is_owner(msg) then
			if matches[2] == 'المدراء' then
				if next(data[tostring(msg.to.id)]['mods']) == nil then
					return "لا يوجد مدراء في المجموعه 🎐"
            end
				for k,v in pairs(data[tostring(msg.to.id)]['mods']) do
					data[tostring(msg.to.id)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				return "تم مسح المدراء 🎐"
         end
			if matches[2] == 'قائمه المنع' then
				if next(data[tostring(msg.to.id)]['filterlist']) == nil then
					return "لا توجد كلمات ممنوعه 🎐"
				end
				for k,v in pairs(data[tostring(msg.to.id)]['filterlist']) do
					data[tostring(msg.to.id)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				return "تم مسح قائمه المنع 🎐"
			end
			if matches[2] == 'القوانين' then
				if not data[tostring(msg.to.id)]['rules'] then
					return "للا توجد قوانين في المجموعه 🎐"
				end
					data[tostring(msg.to.id)]['rules'] = nil
					save_data(_config.moderation.data, data)
				return "تم مسح قوانين المجموعه 🎐"
       end
			if matches[2] == 'الترحيب' then
				if not data[tostring(msg.to.id)]['setwelcome'] then
					return "لا يوجد ترحيب 🎐"
				end
					data[tostring(msg.to.id)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
				return "تم مسح الترحيب في المجموعه 🎐"
       end
			if matches[2] == 'الوصف' then
        if msg.to.type == "group" then
				if not data[tostring(msg.to.id)]['about'] then
					return "لا يوجد وصف في المجموعه 🎐"
				end
					data[tostring(msg.to.id)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "supergroup" then
   setChatDescription(msg.to.id, "")
             end
				return "تم مسح وصف المجموعه 🎐"
		   	end
        end
		if matches[1]:lower() == 'امسح' and is_admin(msg) then
			if matches[2] == 'الادمنيه' then
				if next(data[tostring(msg.to.id)]['owners']) == nil then
					return "لا يوجد ادمنيه ليتم مسحهم 🎐"
				end
				for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
					data[tostring(msg.to.id)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				return "تم مسح قائمه الادمنيه 🎐"
			end
     end
if matches[1] == "ضع اسم" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
setChatTitle(msg.to.id, gp_name)
end
if matches[1] == 'ضع صوره' and is_mod(msg) then
gpPhotoFile = "./data/photos/group_photo_"..msg.to.id..".jpg"
     if not msg.caption and not msg.reply_to_message then
			data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
			save_data(_config.moderation.data, data)
			return 'اقٍٰــــمٍٰ بٌِٰاَٰرِٰسٌٍـــاَٰلْٰ صُِـــوٍّرِٰهَٰہۧ اَٰلْٰاَٰنٍٰ ❤️🎩'
     elseif not msg.caption and msg.reply_to_message then
if msg.reply_to_message.photo then
if msg.reply_to_message.photo[3] then
fileid = msg.reply_to_message.photo[3].file_id
elseif msg.reply_to_message.photo[2] then
fileid = msg.reply_to_message.photo[2].file_id
   else
fileid = msg.reply_to_message.photo[1].file_id
  end
downloadFile(fileid, gpPhotoFile)
sleep(1)
setChatPhoto(msg.to.id, gpPhotoFile)
    data[tostring(msg.to.id)]['settings']['set_photo'] = gpPhotoFile
    save_data(_config.moderation.data, data)
    end
  return "*تم حفظ الصوره*"
     elseif msg.caption and not msg.reply_to_message then
if msg.photo then
if msg.photo[3] then
fileid = msg.photo[3].file_id
elseif msg.photo[2] then
fileid = msg.photo[2].file_id
   else
fileid = msg.photo[1].file_id
  end
downloadFile(fileid, gpPhotoFile)
sleep(1)
setChatPhoto(msg.to.id, gpPhotoFile)
    data[tostring(msg.to.id)]['settings']['set_photo'] = gpPhotoFile
    save_data(_config.moderation.data, data)
    end
  return "*تم حفظ الصوره*"
		end
  end
if matches[1] == "حذف الصوره" and is_mod(msg) then
deleteChatPhoto(msg.to.id)
  return "تَہَٰـــــمٰ̲ہ حہٰٰــذف الصوره 💣"
end
  if matches[1] == "ضع وصف" and matches[2] and is_mod(msg) then
     if msg.to.type == "supergroup" then
   setChatDescription(msg.to.id, matches[2])
    elseif msg.to.type == "group" then
    data[tostring(msg.to.id)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
    return "تم وضع وصف المجموعه 🎐"
  end
  if matches[1] == "الوصف" and msg.to.type == "group" then
 if not data[tostring(msg.to.id)]['about'] then
     about = "لا يوجد وصف للمجموعه 🎐"
        else
     about = "*وصف المجموعه ✨ :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
if matches[1] == "مسح" and is_mod(msg) then
del_msg(msg.to.id, msg.reply_id)
del_msg(msg.to.id, msg.id)
   end
if matches[1] == "رفع الكل" and is_owner(msg) then
local status = getChatAdministrators(msg.to.id).result
for k,v in pairs(status) do
if v.status == "administrator" then
if v.user.username then
admins_id = v.user.id
user_name = '@'..check_markdown(v.user.username)
else
user_name = escape_markdown(v.user.first_name)
      end
  data[tostring(msg.to.id)]['mods'][tostring(admins_id)] = user_name
    save_data(_config.moderation.data, data)
    end
  end
    return "تم رفع جميع الادمنيه في المجموعه 🚩� "
end
if matches[1] == 'تنظيف' and matches[2] and is_owner(msg) then
local num = matches[2]
if 100 < tonumber(num) then
return "*تحذير 🚩 يمكنك المسح من |¶ 2 = 100|¶ فقط 🎐*"
end
print(num)
for i=1,tonumber(num) do
del_msg(msg.to.id,msg.id - i)
end
end
--------------------- الترحيب-----------------------
	if matches[1] == "الترحيب" and is_mod(msg) then
		if matches[2] == "تفعيل" then
			welcome = data[tostring(msg.to.id)]['settings']['welcome']
			if welcome == "yes" then
				return "تم تفعيل الترحيب 🎐"
			else
		data[tostring(msg.to.id)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
				return "تم تفعيل رساله الترحيب 🎐"
			end
		end
		
		if matches[2] == "تعطيل" then
			welcome = data[tostring(msg.to.id)]['settings']['welcome']
			if welcome == "no" then
				return "تم تعطيل رساله الترحيب 🎐"
			else
		data[tostring(msg.to.id)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
				return "تم تعطيل الترحيب 🎐"
			end
		end
	end
	if matches[1] == "ضع ترحيب" and matches[2] and is_mod(msg) then
		data[tostring(msg.to.id)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
		return "_الترحيب🎐 تم وضعه  ¶|\n*"..matches[2].."*\n\n*تستطيع وضع 🎐:*\n_{gpname} اسم المجموعه 🎐 _\n_{name} 🔜 اسم مستخدم جديد_\n_{username} 🔜 معرف المستخدم 🎐"
	end
	---------ردود------------
	if matches[1]=="احبك" and is_sudo(msg) then 
return  "بعد كلبي مطوري انت ني هم احبك 🎐🌝😻" 
elseif matches[1]=="هلو" then 
return  "هٰ۪۫لٰ۪۫وٰ۪۫ﺄﺈتٰ۪۫ حٰ۪۫يٰ۪۫ﺄﺈتٰ۪۫يٰ۪۫ 🌸💖" 
elseif matches[1]=="السلام عليكم" then 
return  "وٰٖعٰٖلٰٖيٰٖكٰٖمٰٖ ألٰٖسٰٖلٰٖأمٰٖ أهٰٖلٰٖأ😻🌸" 
elseif matches[1]=="شونك" then 
return  "تمام بحي وانت 🐰🎄"
elseif matches[1]=="تمام" then 
return  "دومك/ج تمام كبد عمري 🌞🌿"
elseif matches[1]=="دوم" then 
return  "ادوم انفاسك/ج حياتو 🌿😻"
elseif matches[1]=="تسلم" then 
return  "الله يسلمك/ج حياتي 💛👦"
elseif matches[1]=="شكرا" then 
return  "ولو قلبي تدلل انت 💙💋🙊"
elseif matches[1]=="احبك" then 
return  "واني بعد احبك واموت عليك هم 💜💑"
elseif matches[1]=="طه" then 
return  "فديته مطوري هاذا تفضل كول 😸🙊💙"
elseif matches[1]=="صوفي" then 
return  "عيون صوفي هاذا الضلع ابو الوكفات فديته هو الصنعني 😻🙊💛"
elseif matches[1]=="فايدر" then 
return  "فديته هاذا الضلع ونعم منه 😻🙊👦"
elseif matches[1]=="عبود" then 
return  "فدوه لطوله لعبدوش ضلعي هاذا احبه 🙊💜"
elseif matches[1]=="باي" then 
return  "اجيبلك محمد سالم يغنيلك روح روح الله الله وياك😸😸💙"
elseif matches[1]=="جاو" then 
return  "ججاوت بعد روحي 💛💑"
elseif matches[1]=="دي" then 
return  "تعال خلي اركبك 😸💋"
elseif matches[1]=="اكلك" then 
return  "كول حبي بس لا تبول علينا 😸💛"
elseif matches[1]=="اكول" then 
return  "كول وفتح حلكك خل ابول 😸😸🙊"
elseif matches[1]=="احبك" then 
return  "بعد روحي واني احبكم هم بس لتزحفلي رجاا 😸😸💋"
elseif matches[1]=="احبج" then 
return  "ولكم زاحف دفره قبل لا يتكاثر بل كروب 😸😸😸💛"
elseif matches[1]=="خاص" then 
return  "اسف مرتبط ويه بنت عمك 😸😸💙"
elseif matches[1]=="تعال خاص" then 
return  "ها ها تريدون تلعبون بدلي 😸😸💑"
elseif matches[1]=="تعالي خاص" then 
return  "ها ها 😸 عود هم كول ما ازحف وهاي كمشتك😸💛"
elseif matches[1]=="تعال" then 
return  "ولي لك ليريدني هو يجيني 😸🌞"
elseif matches[1]=="🌝" then 
return  "نَِٰہٰوِرتَہَٰ بّہ؏ۤـہٰٰد ڪٰྀہٰٰٖلبّہيِٰہ آنَِٰہٰتَہَٰ 🍯😻🙈"
elseif matches[1]=="خليجي" then 
return  "عيونه حياتي تفضل كول بحي 😸💛🙊"
elseif matches[1]=="واكف" then 
return  "ڪٰྀہٰٰٖآ؏ۤـہٰٰد آحہٰٰمٰ̲ہيِٰہ 😐 بّہيِٰہڪٰྀہٰٰٖمٰ̲ہ آڪٰྀہٰٰٖيِٰہد"
elseif matches[1]=="البوت واكف" then 
return  "ڪٰྀہٰٰٖآ؏ۤـہٰٰد آحہٰٰمٰ̲ہيِٰہ 😐 بّہيِٰہڪٰྀہٰٰٖمٰ̲ہ آڪٰྀہٰٰٖيِٰہد"
elseif matches[1]=="ضوجه" then 
return  "يِٰہ خٰ̐ہربّہ 😐 وِيِٰہنَِٰہٰ نَِٰہٰروِحہٰٰ"
elseif matches[1]=="تخليني" then 
return  "اي تعال اخليك قيطان بحذائي 😸😸💋"
elseif matches[1]=="تروح" then 
return  "لآ مٰ̲ہآليِٰہ ☹️💔 خٰ̐ہلڪٰྀہٰٰٖ وِآلربّہ"
elseif matches[1]=="اها" then 
return  "يِٰہ حہٰٰمٰ̲ہبّہيِٰہ صۛہٰٰدڪٰྀہٰٰٖ"
elseif matches[1]=="مشتاقلك" then 
return  "تَہَٰشِٰہٰٰتَہَٰآقྀ̲ہٰٰٰلڪٰྀہٰٰٖ 🙂🍒 آل؏ۤـہٰٰآف͒ہٰٰيِٰہٰ̲ھہ"
elseif matches[1]=="مشتاقين" then 
return  "تَہَٰشِٰہٰٰتَہَٰآقྀ̲ہٰٰٰلڪٰྀہٰٰٖ 🙂🍒 آل؏ۤـہٰٰآف͒ہٰٰيِٰہٰ̲ھہ"
elseif matches[1]=="مشتاقلج" then 
return  "تَہَٰشِٰہٰٰتَہَٰآقྀ̲ہٰٰٰلڪٰྀہٰٰٖ 🙂🍒 آل؏ۤـہٰٰآف͒ہٰٰيِٰہٰ̲ھہ"
elseif matches[1]=="منور" then 
return  "نَِٰہٰوِرڪٰྀہٰٰٖ 🌝💔 ؏ۤـہٰٰضۜہٰٰيِٰہد"
elseif matches[1]=="مهور" then 
return  "اي حمبي ادري كيزك مهور لتفضح روحك 😸😸💛"
elseif matches[1]=="ليش" then 
return  "شِٰہٰٰنَِٰہٰوِ ٰ̲ھہذِآ 😐💔 آلف͒ہٰٰضۜہٰٰوِل"
elseif matches[1]=="دعبل" then 
return  "مٰ̲ہشِٰہٰٰآقྀ̲ہٰٰٰيِٰہ 😒🐸 وِيِٰہآڪٰྀہٰٰٖ قྀ̲ہٰٰٰبّہل"
elseif matches[1]=="عير" then 
return  "حطه بطيزك اغاتي 😸💑"
elseif matches[1]=="صباحو" then 
return  "صۛہٰٰبّہآحہٰٰ 😻🍒 آل؏ۤـہٰٰسٰٰٓل"
elseif matches[1]=="صباح الخبر" then 
return  "صۛہٰٰبّہآحہٰٰ 😻🍒 آل؏ۤـہٰٰسٰٰٓل"
elseif matches[1]=="مسائو" then 
return  "مٰ̲ہسٰٰٓآء آلف͒ہٰٰل 😻🍒 وِآليِٰہآسٰٰٓمٰ̲ہيِٰہنَِٰہٰ"
elseif matches[1]=="مساء الخير" then 
return  "مٰ̲ہسٰٰٓآء آلف͒ہٰٰل 😻🍒 وِآليِٰہآسٰٰٓمٰ̲ہيِٰہنَِٰہٰ"
elseif matches[1]=="تصبح عله خير" then 
return  "وِآنَِٰہٰتَہَٰٰ̲ھہ/يِٰ مٰ̲ہنَِٰہٰ 🙂🍒 آٰ̲ھہلوِ"
elseif matches[1]=="تصبحون عله خير" then 
return  "وِآنَِٰہٰتَہَٰٰ̲ھہ ๋͜͡ يِٰہــ مٰ̲ہنَِٰہٰ 🙂🍒 آٰ̲ھہلوِ"
elseif matches[1]=="اترخص" then 
return  "اخذ راحتك اغاتي"
elseif matches[1]=="المطور" or matches[1]== "مطور" then 
return  "تفضل اغاتي كول شتريد منه 🌿😽" 
elseif matches[1]=="مرحبا" then 
return  " مہٰ۪۫ږآحہٰ۪۫بہٰ۪۫ هلا بيك 💑💋"
elseif matches[1]=="هاي" then 
return  "يههلا بيك حياتي 💛🌿"
elseif matches[1]=="شلونكم" then 
return  " تہۣۧمہۣۧﭑمہۣۧ بحي وانت شخبار 💛🌿" 
elseif matches[1]=="تلعبون" then 
return  "تعالو لعبو بمالي 😸😸" 
elseif matches[1]=="هلاو" then 
return  "يههلا بيك نورتنا 💛" 
elseif matches[1]=="خرب" then 
return  "خرب وجهك حمتر لتكفر 🌞🌿 " 
elseif matches[1]=="سلام" then 
return  "يهلا حمبي نورت 💛😻" 
elseif matches[1]=="انجب" then 
return  "اي حمبي 😸 تعال فتح حلكك 😸💙" 
elseif matches[1]=="وين" then 
return  "يم خالتك الشكره بن  الصاكه" 
elseif matches[1]=="اكرهك" then 
return  "شعور متبادل حبي" 
elseif matches[1]=="تكرهني" then 
return  "شي اكيد احبك حياتي 😸💛" 
elseif matches[1]=="اعشقك" then 
return  "فيدوه اني هم عشقك" 
elseif matches[1]=="شباب" then 
return  "كباب وتكه وسمج 😸😸💛" 
elseif matches[1]=="ماريا" then 
return  "ولك هاي الصاكه العشق هاي حبيبت المطور هاي 😸🙊😻😻️" 
elseif matches[1]=="😂" then 
return  "يضحك الفطير 😹😹" 
elseif matches[1]=="😍" then 
return "باع الحب صاعد عده فول 😹😻"
elseif matches[1]=="🙂" then 
return  "استريح بحي رايد شي 😹😹😻"
elseif matches[1]=="😐" then 
return  "دي وجهك معقد 😹😹"
elseif matches[1]=="😒" then 
return  "شبيك تباع صفح 😘"
elseif matches[1]=="😌" then 
return  "فديت الغرور كله بحي"
elseif matches[1]=="😭" then 
return  "منو ويك حياتي بس كلي اله اهينه كدامك 😹😹"
elseif matches[1]=="☹" then 
return  "ها بحي منو مضوجك 😍😻"
elseif matches[1]=="☻" then 
return  "عساس ثكيل العينتين تاليتك تزحفبل خاص 😹😹"
elseif matches[1]=="😡" then 
return  "طفه طفه 💦💦 تره حمه حيل"
elseif matches[1]=="😳" then 
return  "ها شفت/ي ابوك/ج مصلخ ونصدمت 😹😹"
elseif matches[1]=="😻" then 
return  "فديت الحب كله 😂"
elseif matches[1]=="😹" then 
return  "اضحك شكو عله كلبك ☹😹"
elseif matches[1]=="🙊" then 
return  "ها قردي شبيك مستحي 😂😂"
elseif matches[1]=="🙈" then 
return  "صار/ت قرد يعني خجلان ?😹😹😹"
elseif matches[1]=="🤔" then 
return  "ولا يكعد راحه اينشتاين الصغير 😂😂"
elseif matches[1]=="🖕" then 
return  "بحي هاذا لوفه وحطه فتيزك 😹😹😻"
elseif matches[1]=="💋" then 
return  "فديتك حلكك بحي ☹😹"
elseif matches[1]=="ت ع خ" then 
return  "وِآنَِٰہٰتَہَٰٰ̲ھہ/يِٰ مٰ̲ہنَِٰہٰ 🙂🍒 آٰ̲ھہلوِ"
elseif matches[1]=="بوت" then 
return  " ها بس وكت المصلحه دور للبوت 😹😹☹"
elseif matches[1]=="وجع" then 
return  "آليِٰہوِجْۧ؏ۤـہٰٰ ڪٰྀہٰٰٖلبّہڪٰྀہٰٰٖ 😒"
elseif matches[1]=="زواحف" then 
return  "آذِآ آڪٰྀہٰٰٖوِ زَآحہٰٰف͒ہٰٰ ف͒ہٰٰٰ̲ھہوِ آنَِٰہٰتَہَٰ 😂"
elseif matches[1]=="شبيك" then 
return  "سٰٰٓلآمٰ̲ہتَہَٰڪٰྀہٰٰٖ مٰ̲ہآبّہيِٰہٰ̲ھہ شِٰہٰٰيِٰہ"
elseif matches[1]=="تف" then 
return  "لآزَمٰ̲ہ تَہَٰآف͒ہٰٰليِٰہنَِٰہٰ بّہطۨہٰٰيِٰہزَڪٰྀہٰٰٖ ڪٰྀہٰٰٖبّہل وِتَہَٰتَہَٰف͒ہٰٰل 😂"
elseif matches[1]=="تفو" then 
return  "لآزَمٰ̲ہ تَہَٰآف͒ہٰٰليِٰہنَِٰہٰ بّہطۨہٰٰيِٰہزَڪٰྀہٰٰٖ ڪٰྀہٰٰٖبّہل وِتَہَٰتَہَٰف͒ہٰٰل 😂"
else 
return  " " 
end 
	------------المطور---------
	 if matches[1] == "المطور" or matches[1] == "مطور"  or matches[1] == "مطورين"  or matches[1] == "المطورين"  or matches[1] == "اريد بوت"  or matches[1] == "نيكول" and is_mod(msg) then
    local text = [[
🕵‍♀Developers Iraq🕵‍♀
〰〰〰〰〰〰〰〰〰〰
✞┇DEV: ⲚＯＶᗩＲ*
🎌

us - @N0VAR

id - 321050917

➖➖➖➖

✞┇DEV: ﺧ̝̚ــہـڵـہـۑج̶ــہـۑےڝـٱڪ
🚩

us - @TAHAJ20

id - 373906612

~~~~~~~~~

✞┇@KM11Qbot تواصل المطورين

〰〰〰〰〰〰〰〰〰〰
    ]]
    return text
  end
-------------Help-------------
  if matches[1] == "الاصدار" or matches[1] == "السورس"  or matches[1] == "سورس"  or matches[1] == "يا سورس" and is_mod(msg) then
    local text = [[
اصدار ســورس «نيكول» ┇✞
〰〰〰〰〰〰〰〰〰〰〰
تم انــشاء الســورس 🎌

الاربعاء/2017/30 📛

علئ ايــدي 🔨🔧

المطورين 🎐
 ↓↓

✞┇@N0VAR

✞┇@TAHAJ20


〰〰〰〰〰〰〰〰〰〰〰
   
]]
    return text
  end

----------------End Msg Matches--------------
end
local function pre_process(msg)
-- print(serpent.block(msg, {comment=false}))
local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings'] and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_mod(msg) then
gpPhotoFile = "./data/photos/group_photo_"..msg.to.id..".jpg"
    if msg.photo then
  if msg.photo[3] then
fileid = msg.photo[3].file_id
elseif msg.photo[2] then
fileid = msg.photo[2].file_id
   else
fileid = msg.photo[1].file_id
  end
downloadFile(fileid, gpPhotoFile)
sleep(1)
setChatPhoto(msg.to.id, gpPhotoFile)
    data[tostring(msg.to.id)]['settings']['set_photo'] = gpPhotoFile
    save_data(_config.moderation.data, data)
     end
		send_msg(msg.to.id, "*تم حفظ الصوره*", msg.id, "md")
  end
	local url , res = http.request('http://api.beyond-dev.ir/time/')
          if res ~= 200 then return "No connection" end
      local jdat = json:decode(url)
		local data = load_data(_config.moderation.data)
 if msg.newuser then
	if data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings'] then
		wlc = data[tostring(msg.to.id)]['settings']['welcome']
		if wlc == "yes" and tonumber(msg.newuser.id) ~= tonumber(bot.id) then
    if data[tostring(msg.to.id)]['setwelcome'] then
     welcome = data[tostring(msg.to.id)]['setwelcome']
      else
     welcome = "*اهلا وسهلا عزيزي 🔜🔚🔜🔚🔜🔚🔜C H / @DEV_NOVAR*"
     end
 if data[tostring(msg.to.id)]['rules'] then
rules = data[tostring(msg.to.id)]['rules']
else
      rules = " قوانين المجموعه 💛:\nالتزم بقوانين المجموعه فضلا وليس امرا 🎃💭.\nعدم عمل تكرار في المجموعه 🔰.\n لا تنشر روابك والتزم بقوانين المجموعه.\nميعحبك الكروب الله وياك ممجبور.\n تزحف تنهان بنعال 🙈😸.\n احترم تحترم.\n@DEV_NOVAR"
end
if msg.newuser.username then
user_name = "@"..check_markdown(msg.newuser.username)
else
user_name = ""
end
		welcome = welcome:gsub("{rules}", rules)
		welcome = welcome:gsub("{name}", escape_markdown(msg.newuser.print_name))
		welcome = welcome:gsub("{username}", user_name)
		welcome = welcome:gsub("{time}", jdat.ENtime)
		welcome = welcome:gsub("{date}", jdat.ENdate)
		welcome = welcome:gsub("{timefa}", jdat.FAtime)
		welcome = welcome:gsub("{datefa}", jdat.FAdate)
		welcome = welcome:gsub("{gpname}", msg.to.title)
		send_msg(msg.to.id, welcome, msg.id, "md")
        end
		end
	end
 if msg.newuser then
 if msg.newuser.id == bot.id and is_admin(msg) then
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)] then
   modadd(msg)
   send_msg(msg.to.id, '*المجموعه ↔🔻 ['..msg.to.title..'] تمت اضافتها ضمن مجموعات البوت*\n🔶🔜🔚🔜🔚🔜🔚🔜🔷\n*NEKOL* : [@'..msg.from.username..']', msg.id, "md")
      end
    end
  end
end
return {
  patterns = {
 "^(المطور)$",
 "^(مطور)$",
 "^(المطورين)$",
 "^(مطورين)$",
 "^(اريد بوت)$",
 "^(نيكول)$",
 "^(سورس)$",
 "^(السورس)$",
 "^(الاصدار)$",
 "^(يا سورس)$",
 "^(تفعيل)$",
 "^(تعطيل)$",
 "^(رفع الكل)$",
 "^(رفع ادمن)$",
 "^(تنزيل ادمن)$",
 "^(رفع ادمن) (.*)$",
 "^(تنزيل ادمن) (.*)$",
 "^(رفع مدير)$",
 "^(تنزيل مدير)$",
 "^(رفع مدير) (.*)$",
	"^(تنزيل مدير) (.*)$",
	"^(مميز) ([+-])$",
	"^(مميز) ([+-]) (.*)$",
	"^(المميزون)$",
	"^(قفل) (.*)$",
	"^(فتح) (.*)$",
	"^(قفل) (.*)$",
	"^(فتح) (.*)$",
	"^(اعدادات)$",
	"^(الاعدادات)$",
	"^(منع) (.*)$",
	"^(الغاء منع) (.*)$",
 "^(اقائمه المنع)$",
 "^(الادمنيه)$",
 "^(المدراء)$",
 "^(مسح)$",
	"^(ضع قوانين) (.*)$",
 "^(القوانين)$",
 "^(ضع رابط)$",
 "^(الرابط)$",
 "^(ضع صوره)$",
 "^(حذف الصوره)$",
 "^(ايدي)$",
 "^(ايدي) (.*)$",
	"^() (.*)$",
	"^(امسح) (.*)$",
	"^(ضع اسم) (.*)$",
	"^(الترحيب) (.*)$",
	"^(ضع ترحيب) (.*)$",
	"^(تثبيت)$",
 "^(الغاء تثبيت)$",
 "^(الوصف)$",
	"^(ضع وصف) (.*)$",
 "^(عدد الاحرف) (%d+)$",
 "^(ضع تكرار) (%d+)$",
 "^(زمن التكرار) (%d+)$",
 "^(معلومات) (%d+)$",
 "^(تنظيف) (%d+)$",
 "^(هلو)$", 
"^(السلام عليكم)$", 
"^(شونك)$", 
"^(تمام)$", 
"^(دوم)$", 
"^(تسلم)$", 
"^(شكرا)$", 
"^(احبك)$", 
"^(طه)$", 
"^(صوفي)$", 
"^(فايدر)$", 
"^(عبود)$", 
"^(جاو)$", 
"^(دي)$", 
"^(اكلك)$", 
"^(اكول)$", 
"^(احبج)$", 
"^(خاص)$", 
"^(تعال خاص)$", 
"^(تعالي خاص)$", 
"^(تعال)$", 
"^(🌝)$", 
"^(خليجي)$", 
"^(واكف)$", 
"^(البوت واكف)$", 
"^(ضوجه)$", 
"^(تخليني)$", 
"^(تروح)$", 
"^(اها)$", 
"^(مشتاقلك)$", 
"^(مشتاقين)$", 
"^(مشتاقلج)$", 
"^(منور)$", 
"^(مهور)$", 
"^(ليش)$", 
"^(دعبل)$", 
"^(عير)$", 
"^(صباحو)$", 
"^(صباح الخبر)$", 
"^(مسائو)$", 
"^(مساء الخير)$", 
"^(تصبح عله خير)$", 
"^(تصبحون عله خير)$", 
"^(اترخص)$", 
"^(المطور)$", 
"^(مرحبا)$", 
"^(هاي)$", 
"^(شلونكم)$", 
"^(تلعبون)$", 
"^(هلاو)$", 
"^(خرب)$", 
"^(سلام)$", 
"^(انجب)$", 
"^(وين)$", 
"^(اكرهك)$", 
"^(تكرهني)$", 
"^(اعشقك)$", 
"^(شباب)$", 
"^(ماريا)$", 
"^(😂)$", 
"^(😍)$", 
"^(🙂)$", 
"^(😐)$", 
"^(😒)$", 
"^(😌)$", 
"^(😭)$", 
"^(☹)$", 
"^(☻)$", 
"^(😡)$", 
"^(😳)$", 
"^(😻)$", 
"^(😹)$", 
"^(🙊)$", 
"^(🙈)$", 
"^(🤔)$", 
"^(🖕)$", 
"^(🖕)$", 
"^(💋)$", 
"^(ت ع خ)$", 
"^(بوت)$",
"^(وجع)$",
"^(زواحف)$",
"^(شبيك)$",
"^(تف)$",
"^(تفو)$",
	"^([https?://w]*.?telegram.me/joinchat/%S+)$",
	"^([https?://w]*.?t.me/joinchat/%S+)$"
    },
  run = taha,
  pre_process = pre_process
}