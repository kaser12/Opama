--@IIBOOSII
--@IIBOOS2II
local function addgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if not groupa then
group[tostring(msg.chat_id)] = {
        group_type = 'SuperGroup',
		by = msg.from_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
		  lock_link = "no",
lock_username = "no",
lock_edit = "no",
lock_fwd = "no",
lock_spam = "no",
lock_english = "no",
lock_persian = "no",
lock_tgservice = "no",
lock_sticker = "no",
mute_all = "no",
mute_photo = "no",
mute_video = "no",
mute_voice = "no",
mute_document = "no",
mute_gif = "no",
mute_audio = "no"
                  }
      }
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'تم تفعيل المجموعه✔️', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, ' المجموعه مفعله سابقا ✔️', 1)
end
end
local function remgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if groupa then
group[tostring(msg.chat_id)] = nil
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'تم ايقاف البوت❌', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, '  تم ايقاف البوت سابقا❌', 1)
end
end

local function run(msg, matches)
if matches[1] == 'تفعيل' and is_sudo(msg) then
addgroup(msg)
elseif matches[1] == 'تعطيل' and is_sudo(msg) then
remgroup(msg)
end
end
return {
  patterns = {
    "^(تفعيل)$",
    "^(تعطيل)$",
"^!!!edit:[/#!](تفعيل)$",
    "^!!!edit:[/#!](تعطيل)$"
  },
  run = run
}
--@IIBOOSII
--@IIBOOS2II
