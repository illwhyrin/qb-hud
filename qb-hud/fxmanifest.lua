fx_version 'cerulean'
game 'gta5' 

description 'QB-Hud'
version '1.0.0'

client_scripts {
    'config.lua',
    'client/client.lua',
    'client/stress.lua'
}

server_scripts {
    'server/server.lua'
}

ui_page 'html/index.html'

files{
    'html/img/*.png',
    "html/img/*.svg",
    'html/index.html',
    'html/script.js',
    'html/styles.css'
}