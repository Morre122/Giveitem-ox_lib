fx_version 'cerulean'
game 'gta5'
author 'Morre'
description 'Duoti daiktą/itemą By Morre'
version '1.0.0'
lua54 'yes'

client_script {
	'client/main.lua',
	'config.lua',
}
server_script {
	'server/main.lua',
	'config.lua',
}
shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua'
} 

dependency {
	'ox_lib',
	'ox_inventory'
}