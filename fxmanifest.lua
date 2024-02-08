fx_version 'cerulean'
game 'gta5'
description 'QT Store Utility Core'
author 'QT Store'
lua54 'yes'

shared_scripts {
    'config.lua',
    'utility/shared/*.lua',
    'utility/framework.lua',
    'strings.lua'
}

client_scripts {
    'utility/client/*.lua',
    'cl_main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'utility/server/*.lua',
    'sv_main.lua'
}