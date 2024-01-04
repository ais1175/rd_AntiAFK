ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("RespectDevelopment:afk:kick")
AddEventHandler("RespectDevelopment:afk:kick", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = GetPlayerName(source)
    local PlayerGroup = xPlayer.getGroup()
    local PlayerIdentifier = xPlayer.getIdentifier()
    local steamid = false
    local license = false
    local discord = false
    local xbl = false
    local ip = false
    for k,v in pairs(GetPlayerIdentifiers(source))do            
          if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
          elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
          elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl  = v
          elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = v
          elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        end     
    end
    if not rd.GroupBypass[xPlayer.getGroup(source, 0)] then
        if not rd.IdentifierByPass.CharIDidentifier[xPlayer.getIdentifier(source, 0)] then
            if not rd.IdentifierByPass.LicenceIdentifier[license] then
                if not rd.IdentifierByPass.DiscordIdentifier[discord] then
                    DropPlayer(source, rd.KickMessage)
                    if rd.Debug then
                        print("Player " ..playerName.. " was kicked for afk.")
                    end
                    if Logs.DiscordLogs.Enabled then         
                        local date = os.date("%H:%M - %d/%m/%Y")
                        local footer = Logs.DiscordLogs.Footer 
                        local template = Logs.DiscordLogs.Description  
                        local PlayerIdentifier = xPlayer.getIdentifier()
                        local PlayerCoords = xPlayer.getCoords(useVector)
                
                        local replacements = {
                            ["{NAME}"] = playerName,
                            ["{GROUP}"] = PlayerGroup,
                            ["{IDENTIFIER}"] = PlayerIdentifier,
                            ["{STEAM}"] = steamid,
                            ["{DISCORD}"] = discord,
                            ["{LICENCE}"] = license,
                            ["{XBL}"] = xbl,
                            ["{IP}"] = ip,
                        }
                        local pattern = "{(.-)}"
                        local result = template:gsub(pattern, function(key)
                            return replacements['{' .. key .. '}'] or key
                        end)
                        local DiscordLog = {
                            {
                                ["color"] = Logs.DiscordLogs.Colour,
                                ["title"] = Logs.DiscordLogs.Title,
                                ["description"] = result,
                                ["footer"] = {
                                    ["text"] = "" ..footer.. " 〢 " ..date.. "",
                                    ["icon_url"] = Logs.DiscordLogs.FooterICON,
                                },
                            }
                        }
                        PerformHttpRequest(Logs.DiscordLogs.Webhook, function(err, text, headers) end, 'POST', json.encode({ username = Logs.DiscordLogs.WebhookName, embeds = DiscordLog, avatar_url = Logs.DiscordLogs.WebhookIcon }), { ['Content-Type'] = 'application/json' })
                
                    end
                else
                    if rd.Debug then
                        print("Player " ..playerName.. " have bypass for afk system!")
                    end
                end
            else
                if rd.Debug then
                    print("Player " ..playerName.. " have bypass for afk system!")
                end
            end
        else
            if rd.Debug then
                print("Player " ..playerName.. " have bypass for afk system!")
            end
        end
    else
        if rd.Debug then
            print("Player " ..playerName.. " have bypass for afk system!")
        end
    end
end)

