fx_version "cerulean"
game "gta5"
lua54 "yes"

author "Arre Scripts"
description "Simple Store robbery script"

client_scripts {
    "client/cl_main.lua",
    "client/framework/cl_framework.lua"
}

server_scripts {
    "server/sv_main.lua",
    "server/framework/sv_framework.lua"
}

shared_scripts {
    "config.lua",
    "@ox_lib/init.lua"
}