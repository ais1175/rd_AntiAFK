fx_version 'cerulean'
game 'gta5'

author 'Respect Development'
description 'Anti AFK'
version '1.0.0'

lua54 'yes'

shared_scripts {
    'shared/config.lua',
    --'@ox_lib/init.lua', -- UNMARK IT HERE, IF YOU WANT USE OXLIB NOTIFICATION
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
    'shared/DiscordLogs.lua',
}












