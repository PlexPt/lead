local me = {}

me.name = "bzlead"
me.lead_ore = "lead-ore"
me.lead_plate = "lead-plate"


function me.more_entities()
  return me.get_setting("bzlead-more-entities") == "yes"
end

function me.sulfuric()
  return me.get_setting("bzlead-sulfuric") == "yes"
end

function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

return me
