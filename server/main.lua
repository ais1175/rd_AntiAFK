local Webhook = 'https://discord.com/api/webhooks/1193289844047225054/oE_qNeYrxm9l_CqfEuEEhGk_Z4TQMOT6m2hTk9MUq-wJ41NhhzW5I8t4gxwDfKtd0xg6'

ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('RespectDevelopment:afk:kick')
AddEventHandler('RespectDevelopment:afk:kick', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = GetPlayerName(source)
    local PlayerGroup = xPlayer.getGroup()
    local PlayerIdentifier = xPlayer.getIdentifier()
    local steamid = false
    local license = false
    local discord = false

    for k,v in pairs(GetPlayerIdentifiers(source))do            
          if string.sub(v, 1, string.len('steam:')) == 'steam:' then
            steamid = v
          elseif string.sub(v, 1, string.len('license:')) == 'license:' then
            license = v
          elseif string.sub(v, 1, string.len('discord:')) == 'discord:' then
            discord = v
        end     
    end
    if not Config.ByPass.GroupBypass[xPlayer.getGroup(source, 0)] then
        if not Config.ByPass.IdentifierByPass.CharIDidentifier[xPlayer.getIdentifier(source, 0)] then
            if not Config.ByPass.IdentifierByPass.LicenceIdentifier[license] then
                if not Config.ByPass.IdentifierByPass.DiscordIdentifier[discord] then
                    DropPlayer(source, Config.KickMessage)

                    if Config.DiscordLogs.Enable then         
                        local date = os.date('%H:%M - %d/%m/%Y')
                        local template = Config.DiscordLogs.Description  
                        local PlayerIdentifier = xPlayer.getIdentifier()
                        local PlayerCoords = xPlayer.getCoords(useVector)
                
                        local replacements = {
                            ['{NAME}'] = playerName,
                            ['{GROUP}'] = PlayerGroup,
                            ['{IDENTIFIER}'] = PlayerIdentifier,
                            ['{STEAM}'] = steamid,
                            ['{DISCORD}'] = discord,
                            ['{LICENCE}'] = license,
                        }

                        local pattern = '{(.-)}'
                        local result = template:gsub(pattern, function(key)
                            return replacements['{' .. key .. '}'] or key
                        end)

                        local DiscordLog = {
                            {
                                ['color'] = Config.DiscordLogs.Colour,
                                ['title'] = Config.DiscordLogs.Title,
                                ['description'] = result,
                                ['footer'] = {
                                    ['text'] = 'Respect Development 〢 ' ..date.. '',
                                    ['icon_url'] = 'https://media.discordapp.net/attachments/627098670021607444/1189648805767946280/rsz_1rsz_screenshot_3.png?ex=659eedc9&is=658c78c9&hm=46b027b12319ca1b93531bc0ecd8429bc67c3a0cb1c2065671b5ef694901cf34&=&format=webp&quality=lossless',
                                },
                            }
                        }
                        PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ username = 'New AFK Kick', embeds = DiscordLog, avatar_url = 'https://media.discordapp.net/attachments/627098670021607444/1189648805767946280/rsz_1rsz_screenshot_3.png?ex=659eedc9&is=658c78c9&hm=46b027b12319ca1b93531bc0ecd8429bc67c3a0cb1c2065671b5ef694901cf34&=&format=webp&quality=lossless' }), { ['Content-Type'] = 'application/json' })
                
                    end
                else
                    Wait(500)
                end
            else
                Wait(500)
            end
        else
            Wait(500)
        end
    else
        Wait(500)
    end
end)

