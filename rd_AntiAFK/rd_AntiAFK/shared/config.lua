rd = {}

rd.Debug = false

rd.Afk = {
    TimeHowMuchPlayerCanBeAFK = 1800, -- (In Seconds)
}

rd.Notification = {

    NotificationPlayerBelowKicked = true,
    NotificationType = "ESX" -- ESX, OXLIB (CHECK THE FXMANIFEST.LUA), OKOK
}

rd.GroupBypass = {
    ["owner"] = true, 
    ["developer"] = true, 
    ["admin"] = true, 
}

rd.IdentifierByPass = {

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

rd.NotificationMessage = "You will be kicked in {TIMELEFT} seconds!" -- {TIMELEFT} = Show time, when player will be kicked.
rd.KickMessage = "You have been kicked: You are AFK!"



