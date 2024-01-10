-- {{FX Information}} --
fx_version 'cerulean'
game 'gta5'

-- {{Resource Information}} --
author 'Respect Development'
description 'Anti AFK'
version '1.1'

-- {{Manifest}} --
lua54 'yes'

shared_scripts {
    'shared/Config.lua',
    --'@ox_lib/init.lua', ⚠️ Unmark it here, if you want use ox_lib notification ⚠️
}

client_scripts {
    '@es_extended/locale.lua',
    'client/main.lua',
    'locales/*.lua',
}

server_scripts {
    'server/main.lua',
    'server/updater.lua',
}













