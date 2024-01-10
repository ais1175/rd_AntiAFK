Config = {
    
    Locale = GetConvar('esx:locale', 'en'), -- en = english / cz = czech
    TimeHowMuchPlayerCanBeAFK = 1800, -- (In Seconds)
    KickWarning = true,
    Notification = "ESX", -- ESX, OKOK, OXLIB (CHECK THE FXMANIFEST.LUA), Custom

    UpdateCheck = true,

    ByPass = {
        GroupBypass = {
            ["owner"] = true, 
            ["developer"] = true, 
            ["admin"] = true, 
        },

        IdentifierByPass = {

            DiscordIdentifier = {
                ["discord:"] = true, 
                -- You can add unlimited more
            },
        
            LicenceIdentifier = {
                ["license:"] = true, 
                -- You can add unlimited more
            },
        
            CharIDidentifier = {
                ["char1:"] = true, 
                -- You can add unlimited more
            },

        }
    },

    DiscordLogs = { 
        Enable = true, -- Set webhook in the server/main.lua at line 1!
        
        Colour = 2600155,
        Title = "New AFK Kick!",
        Description = "The player **{NAME}** with group **{GROUP}** was kicked.\n\n**More Information**\n>>> **Name:** *{NAME}*\n**Group:** *{GROUP}*\n\n**Identifier:** *{IDENTIFIER}*\n**SteamID:** {STEAM}\n**Licence:** {LICENCE}\n**DiscordID:** {DISCORD}",
           
    }

}

-- If you need help with notifications, join the discord server and open a ticket.
-- Discord: https://discord.gg/SfjrAQzamD
RegisterNetEvent('rd:antiafk:notify')
AddEventHandler('rd:antiafk:notify', function(message, title)
    if Config.Notification == 'ESX' then
        ESX = exports['es_extended']:getSharedObject()
        ESX.ShowNotification(message)
    elseif Config.Notification == 'OKOK' then
        exports['okokNotify']:Alert(title, message, 3000, 'information', playSound)
    elseif Config.Notification == 'OXLIB' then
        lib.notify({
            title = title,
            description = message,
            type = 'inform'
        })
    elseif Config.Notification == 'Custom' then
        print('[WARNING] Set your own notification in shared/config.lua at line 65.') 
        -- Set your own notifications here.
    else
        print('[ERROR] Your notification type is not valid.')
    end
end)



