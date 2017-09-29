local function NOVAR(msg, matches) 
local data = load_data(_config.moderation.data) 
----------------kick by replay ---------------- 
if matches[1] == 'طرد' and is_mod(msg) then 
   if msg.reply_id then 
if tonumber(msg.reply.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت طـرد آدمـن ⁉️🚷" 
    end 
if is_mod1(msg.to.id, msg.reply.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت طـرد آدمـن ⁉️🚷" 
    else 
   kick_user(msg.reply.id, msg.to.id) 
 end 
   elseif matches[2] and not string.match(matches[2], '^%d+$') then 
   if not resolve_username(matches[2]).result then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
   local User = resolve_username(matches[2]).information 
if tonumber(User.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت طـرد آدمـن ⁉️🚷" 
    end 
if is_mod1(msg.to.id, User.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت طـرد آدمـن ⁉️🚷" 
     else 
   kick_user(User.id, msg.to.id) 
  end 
   elseif matches[2] and string.match(matches[2], '^%d+$') then 
if tonumber(matches[2]) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت طـرد آدمـن ⁉️🚷" 
    end 
if is_mod1(msg.to.id, tonumber(matches[2])) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت طـرد آدمـن ⁉️🚷" 
   else 
     kick_user(tonumber(matches[2]), msg.to.id) 
        end 
     end 
   end 

---------------Ban------------------- 
if matches[1] == 'حظر' and is_mod(msg) then 
if msg.reply_id then 
if tonumber(msg.reply.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
if is_mod1(msg.to.id, msg.reply.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if is_banned(msg.reply.id, msg.to.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."بٌِٰاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰــظَِْرِٰهَٰہۧ عٍِّــاَٰمٍٰ℡̮⇣┆🌻⇣℡ " 
    else 
ban_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id, msg.to.id) 
     kick_user(msg.reply.id, msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تّٰــــمٍٰ حٌٰــظَِْرِٰهَٰہۧ عٍِّــاَٰمٍٰ ∬💗🌚﴾" 
  end 
   elseif matches[2] and not string.match(matches[2], '^%d+$') then 
   if not  resolve_username(matches[2]).result then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
   local User = resolve_username(matches[2]).information 
if tonumber(User.id) == tonumber(our_id) then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
if is_mod1(msg.to.id, User.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if is_banned(User.id, msg.to.id) then 
    return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷"..check_markdown(User.username).." "..User.id.."بٌِٰاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰــظَِْرِٰهَٰہۧ عٍِّــاَٰمٍٰ℡̮⇣┆🌻⇣℡ " 
    else 
   ban_user(check_markdown(User.username), User.id, msg.to.id) 
     kick_user(User.id, msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..check_markdown(User.username).." "..User.id.."تّٰــــمٍٰ حٌٰــظَِْرِٰهَٰہۧ عٍِّــاَٰمٍٰ ∬💗🌚﴾" 
  end 
   elseif matches[2] and string.match(matches[2], '^%d+$') then 
if tonumber(matches[2]) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
if is_mod1(msg.to.id, tonumber(matches[2])) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if is_banned(tonumber(matches[2]), msg.to.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."بٌِٰاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰــظَِْرِٰهَٰہۧ عٍِّــاَٰمٍٰ℡̮⇣┆🌻⇣℡ " 
    else 
   ban_user('', matches[2], msg.to.id) 
     kick_user(tonumber(matches[2]), msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."تّٰــــمٍٰ حٌٰــظَِْرِٰهَٰہۧ عٍِّــاَٰمٍٰ ∬💗🌚﴾" 
        end 
     end 
   end 

---------------Unban------------------- 

if matches[1] == 'الغاء حظر' and is_mod(msg) then 
if msg.reply_id then 
if tonumber(msg.reply.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
if is_mod1(msg.to.id, msg.reply.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if not is_banned(msg.reply.id, msg.to.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."بٌِّٰہآلْٰــفِٰ͒ہٰٰ؏ۤـہٰٰــلْٰ تَّٰہَٰــمٍٰٰ̲ہ اَٰلْٰغِِٰاَٰء حٌٰہٰٰظَِْۗہٰٰــرِٰٰ̲ھہ卍⁽ ֆ🌞⚡️ ̯͡“" 
    else 
unban_user(msg.reply.id, msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تَّٰہَٰـــمٍٰٰ̲ہ اَٰلْٰغِِٰاَٰء حٌٰہٰٰظَِْۗہٰٰــرِٰ آلْٰــمٍٰٰ̲ہسٌٍٰٰٓــتَّٰہَٰخّٰٰ̐ہــدِٰمٍٰٰ̲ہ ֆ ̯͡“🍕🐹" 
  end 
   elseif matches[2] and not string.match(matches[2], '^%d+$') then 
   if not resolve_username(matches[2]).result then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
   local User = resolve_username(matches[2]).information 
  if not is_banned(User.id, msg.to.id) then 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."بٌِّٰہآلْٰــفِٰ͒ہٰٰ؏ۤـہٰٰــلْٰ تَّٰہَٰــمٍٰٰ̲ہ اَٰلْٰغِِٰاَٰء حٌٰہٰٰظَِْۗہٰٰــرِٰٰ̲ھہ卍⁽ ֆ🌞⚡️ ̯͡“" 
    else 
   unban_user(User.id, msg.to.id) 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."تَّٰہَٰـــمٍٰٰ̲ہ اَٰلْٰغِِٰاَٰء حٌٰہٰٰظَِْۗہٰٰــرِٰ آلْٰــمٍٰٰ̲ہسٌٍٰٰٓــتَّٰہَٰخّٰٰ̐ہــدِٰمٍٰٰ̲ہ ֆ ̯͡“🍕🐹" 
  end 
   elseif matches[2] and string.match(matches[2], '^%d+$') then 
  if not is_banned(tonumber(matches[2]), msg.to.id) then 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_"..matches[2].."بٌِّٰہآلْٰــفِٰ͒ہٰٰ؏ۤـہٰٰــلْٰ تَّٰہَٰــمٍٰٰ̲ہ اَٰلْٰغِِٰاَٰء حٌٰہٰٰظَِْۗہٰٰــرِٰٰ̲ھہ卍⁽ ֆ🌞⚡️ ̯͡“" 
    else 
   unban_user(matches[2], msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."تَّٰہَٰـــمٍٰٰ̲ہ اَٰلْٰغِِٰاَٰء حٌٰہٰٰظَِْۗہٰٰــرِٰ آلْٰــمٍٰٰ̲ہسٌٍٰٰٓــتَّٰہَٰخّٰٰ̐ہــدِٰمٍٰٰ̲ہ ֆ ̯͡“🍕🐹" 
        end 
     end 
   end 

------------------------Silent------------------------------------- 

if matches[1] == 'كتم' and is_mod(msg) then 
if msg.reply_id then 
if tonumber(msg.reply.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
if is_mod1(msg.to.id, msg.reply.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
  if is_silent_user(msg.reply.id, msg.to.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تمـ گتمـهہ‏‏ سـآبقآ 🔇✔️" 
    else 
silent_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id, msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تمـ گتمـهہ‏‏ بنجآح عزيزي 🔇✔️" 
  end 
   elseif matches[2] and not string.match(matches[2], '^%d+$') then 
   if not resolve_username(matches[2]).result then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
   local User = resolve_username(matches[2]).information 
if tonumber(User.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
if is_mod1(msg.to.id, User.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
  if is_silent_user(User.id, msg.to.id) then 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."تمـ گتمـهہ‏‏ سـآبقآ 🔇✔️" 
    else 
   silent_user("@"..check_markdown(User.username), User.id, msg.to.id) 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."تمـ گتمـهہ‏‏ بنجآح عزيزي 🔇✔️" 
  end 
   elseif matches[2] and string.match(matches[2], '^%d+$') then 
if tonumber(matches[2]) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
if is_mod1(msg.to.id, tonumber(matches[2])) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
  if is_silent_user(tonumber(matches[2]), msg.to.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."تمـ گتمـهہ‏‏ سـآبقآ 🔇✔️" 
    else 
   ban_user('', matches[2], msg.to.id) 
     kick_user(tonumber(matches[2]), msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."تمـ گتمـهہ‏‏ بنجآح عزيزي 🔇✔️" 
        end 
     end 
   end 

------------------------Unsilent---------------------------- 
if matches[1] == 'الغاء الكتم' and is_mod(msg) then 
if msg.reply_id then 
if tonumber(msg.reply.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
if is_mod1(msg.to.id, msg.reply.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت گتمـ آدمـن ✖️🚷" 
    end 
  if not is_silent_user(msg.reply.id, msg.to.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."بالفعل تمـ آلغآء گتمـهہ‏‏ سـآبقآ عزيزي 🔊" 
    else 
unsilent_user(msg.reply.id, msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تمـ آلغآء گتمـهہ‏‏ عزيزي 🔊✔️" 
  end 
   elseif matches[2] and not string.match(matches[2], '^%d+$') then 
   if not resolve_username(matches[2]).result then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
   local User = resolve_username(matches[2]).information 
  if not is_silent_user(User.id, msg.to.id) then 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."بالفعل تمـ آلغآء گتمـهہ‏‏ سـآبقآ عزيزي 🔊" 
    else 
   unsilent_user(User.id, msg.to.id) 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_@"..check_markdown(User.username).." "..User.id.."تمـ آلغآء گتمـهہ‏‏ عزيزي 🔊✔️" 
  end 
   elseif matches[2] and string.match(matches[2], '^%d+$') then 
  if not is_silent_user(tonumber(matches[2]), msg.to.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."بالفعل تمـ آلغآء گتمـهہ‏‏ سـآبقآ عزيزي 🔊" 
    else 
   unsilent_user(matches[2], msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."تمـ آلغآء گتمـهہ‏‏ عزيزي 🔊✔️" 
        end 
     end 
   end 
-------------------------Banall------------------------------------- 
if matches[1] == 'حظر عام' and is_admin(msg) then 
if msg.reply_id then 
if tonumber(msg.reply.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
if is_admin1(msg.reply.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if is_gbanned(msg.reply.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."بّہٌِٰآَٰلْٰف͒ہِٰٰٰ؏ۤـہٍِّٰٰــلْٰ تَہَّٰٰــمٰ̲ہ ٍٰ حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ║✠🐰☄ֆ" 
    else 
banall_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id) 
     kick_user(msg.reply.id, msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تَہَّٰٰــــمٰ̲ہٍٰ  حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ⋮❖🐹🍑ֆ" 
  end 
   elseif matches[2] and not string.match(matches[2], '^%d+$') then 
   if not resolve_username(matches[2]).result then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
   local User = resolve_username(matches[2]).information 
if tonumber(User.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
if is_admin1(User.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if is_gbanned(User.id) then 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."بّہٌِٰآَٰلْٰف͒ہِٰٰٰ؏ۤـہٍِّٰٰــلْٰ تَہَّٰٰــمٰ̲ہ ٍٰ حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ║✠🐰☄ֆ" 
    else 
   banall_user("@"..check_markdown(User.username), User.id) 
     kick_user(User.id, msg.to.id) 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."تَہَّٰٰــــمٰ̲ہٍٰ  حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ⋮❖🐹🍑ֆ" 
  end 
   elseif matches[2] and string.match(matches[2], '^%d+$') then 
if is_admin1(tonumber(matches[2])) then 
if tonumber(matches[2]) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if is_gbanned(tonumber(matches[2])) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."بّہٌِٰآَٰلْٰف͒ہِٰٰٰ؏ۤـہٍِّٰٰــلْٰ تَہَّٰٰــمٰ̲ہ ٍٰ حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ║✠🐰☄ֆ" 
    else 
   banall_user('', matches[2]) 
     kick_user(tonumber(matches[2]), msg.to.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."تَہَّٰٰــــمٰ̲ہٍٰ  حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ⋮❖🐹🍑ֆ" 
        end 
     end 
   end 
--------------------------Unbanall------------------------- 

if matches[1] == 'الغاء العام' and is_admin(msg) then 
if msg.reply_id then 
if tonumber(msg.reply.id) == tonumber(our_id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
if is_mod1(msg.to.id, msg.reply.id) then 
   return "ليسـ مـن صـلآحيهہ‏‏ آلبوت حظـر آدمـن ⁉️🚷" 
    end 
  if not is_gbanned(msg.reply.id) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."بّہٌِٰآَٰلْٰف͒ہِٰٰٰ؏ۤـہٍِّٰٰــلْٰ تَہَّٰٰــمٰ̲ہ آلغہٰٰــــآءٍٰ حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ║✠🐰☄ֆ" 
    else 
unbanall_user(msg.reply.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." "..msg.reply.id.."تَہَّٰٰــــمٰ̲ہٍٰ آلـــغہٰٰآء حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ⋮❖🐹🍑ֆ" 
  end 
   elseif matches[2] and not string.match(matches[2], '^%d+$') then 
   if not resolve_username(matches[2]).result then 
   return "آلْٰـــ؏ۤـہٰٰــضۜہٰٰـوٍِّ لْٰاَٰ يَٰوٍّجًِّدِٰ فِٰيَٰ اَٰلْٰمٍٰجًِّمٍٰوٍّعٍِّهَٰہۧ ➤ ♛🌝₎Ֆ" 
    end 
   local User = resolve_username(matches[2]).information 
  if not is_gbanned(User.id) then 
    return "_العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩_ @"..check_markdown(User.username).." "..User.id.."بّہٌِٰآَٰلْٰف͒ہِٰٰٰ؏ۤـہٍِّٰٰــلْٰ تَہَّٰٰــمٰ̲ہ آلغہٰٰــــآءٍٰ حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ║✠🐰☄ֆ" 
    else 
   unbanall_user(User.id) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..check_markdown(User.username).." "..User.id.."تَہَّٰٰــــمٰ̲ہٍٰ آلـــغہٰٰآء حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ⋮❖🐹🍑ֆ" 
  end 
   elseif matches[2] and string.match(matches[2], '^%d+$') then 
  if not is_gbanned(tonumber(matches[2])) then 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."بّہٌِٰآَٰلْٰف͒ہِٰٰٰ؏ۤـہٍِّٰٰــلْٰ تَہَّٰٰــمٰ̲ہ آلغہٰٰــــآءٍٰ حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ║✠🐰☄ֆ" 
    else 
   unbanall_user(matches[2]) 
    return "العہٰ۫ﹻﹻﹻضہٰ۫ﹻﹻﹻـو ͢⁽👬👭₎♩"..matches[2].."تَہَّٰٰــــمٰ̲ہٍٰ آلـــغہٰٰآء حہٌٰٰٰــظۗہَِْٰٰرِٰٰ̲ھہَٰہۧ ؏ۤـہٍِّٰٰــآَٰمٰ̲ہٍٰ ⋮❖🐹🍑ֆ" 
        end 
     end 
   end 
   -----------------------------------LIST--------------------------- 
   if matches[1] == 'المحظورين' and is_mod(msg) then 
   return banned_list(msg.to.id) 
   end 
   if matches[1] == 'المكتومين' and is_mod(msg) then 
   return silent_users_list(msg.to.id) 
   end 
   if matches[1] == 'قائمه العام' and is_admin(msg) then 
   return gbanned_list(msg) 
   end 
   ---------------------------clean--------------------------- 
   if matches[1] == 'مسح' and is_mod(msg) then 
   if matches[2] == 'المحظورين' then 
      if next(data[tostring(msg.to.id)]['banned']) == nil then 
         return " لـــمٰ̲ہ يِٰہــمٰ̲ہ آلـــ؏ۤـہٰٰثہٰٰوِر ؏ۤـہٰٰلــــى آلمٰ̲ہحہٰٰــظۗہٰٰوِريِٰہــنَِٰہٰ☫ۦٰ️💛#ֆ" 
      end 
      for k,v in pairs(data[tostring(msg.to.id)]['banned']) do 
         data[tostring(msg.to.id)]['banned'][tostring(k)] = nil 
         save_data(_config.moderation.data, data) 
      end 
      return "تم مسح المحظورين 💭♥" 
   end 
   if matches[2] == 'المكتومين' then 
      if next(data[tostring(msg.to.id)]['is_silent_users']) == nil then 
         return "لـــمٰ̲ہ يِٰہــمٰ̲ہ آلـــ؏ۤـہٰٰثہٰٰوِر ؏ۤـہٰٰلــــى آلمٰ̲ہڪٰྀہٰٰٖــتَہَٰوِمٰ̲ہيِٰہــنَِٰہٰ’ֆ💧💆🏻⍤" 
      end 
      for k,v in pairs(data[tostring(msg.to.id)]['is_silent_users']) do 
         data[tostring(msg.to.id)]['is_silent_users'][tostring(k)] = nil 
         save_data(_config.moderation.data, data) 
      end 
      return "تم مسح المكتومين 🌟🚩" 
   end 
   if matches[2] == 'قائمه العام' and is_admin(msg) then 
      if next(data['gban_users']) == nil then 
         return "لـــمٰ̲ہ يِٰہــمٰ̲ہ آلـــ؏ۤـہٰٰثہٰٰوِر ؏ۤـہٰٰلــــى آلمٰ̲ہحہٰٰــظۗہٰٰوِريِٰہــنَِٰہٰ ؏ۤـہٰٰــآمٰ̲ہ⁽“͢ 🥁🙍🏻‍♂️✦₎" 
      end 
      for k,v in pairs(data['gban_users']) do 
         data['gban_users'][tostring(k)] = nil 
         save_data(_config.moderation.data, data) 
      end 
      return "تم مسح قائمه العام 🔰💸" 
   end 
   end 

end 
return { 
   patterns = { 
"^(حظر) (.*)$", 
"^(حظر)$", 
"^(الغاء حظر) (.*)$", 
"^(الغاء حظر)$", 
"^(طرد) (.*)$", 
"^(طرد)$", 
"^(حظر عام) (.*)$", 
"^(حظر عام)$", 
"^(الغاء العام) (.*)$", 
"^(الغاء العام)$", 
"^(الغاء الكتم) (.*)$", 
"^(الغاء الكتم)$", 
"^(كتم) (.*)$", 
"^(كتم)$", 
"^(المكتومين)$", 
"^(المحظورين)$", 
"^(قائمه العام)$", 
"^(مسح) (.*)$", 
   }, 
   run = NOVAR, 

} 
