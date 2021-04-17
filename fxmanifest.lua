fx_version 'cerulean'
game 'gta5'


ui_page {
	'html/index.html',
}

files {
	'html/css/style.css',
	'html/css/vstyle.css',
	'html/grid.css',

	'html/fonts/pricedown.ttf',
	'html/fonts/gta-ui.ttf',
	'html/js/app.js',
	'html/index.html',

	'html/css/jquery-ui.min.css',
	'html/js/jquery.min.js',
	'html/js/jquery-ui.min.js',

	-- Vehicle Images
	'html/img/vehicle/fuel.png',

	'html/img/vehicle/locked.png',
	'html/img/vehicle/unlocked.png',

	'html/img/vehicle/off.png',
	'html/img/vehicle/on.png',

	'html/img/vehicle/nitrious.png',

	'html/img/vehicle/seatbelt.png',
	'html/img/vehicle/seatbelton.png',
	'html/img/vehicle/seatbeltoff.png',

	'html/img/vehicle/lowbeam.png',
	'html/img/vehicle/highbeam.png',

	'html/img/vehicle/left-arrow.png',
	'html/img/vehicle/right-arrow.png',
	'html/img/vehicle/hazards.png',
	'html/img/vehicle/signalsoff.png',

	-- Voice Images

	'html/sounds/seatbelt-buckle.ogg',
	'html/sounds/seatbelt-unbuckle.ogg',
	'html/sounds/car-indicators.ogg',

	-- Player Status Images

	"html/img/brain.svg",
	"html/img/burger.svg",
	"html/img/heart.svg",
	"html/img/oxy.svg",
	"html/img/shield.svg",
	"html/img/water.svg",
	"html/css/compass.png",
}

client_scripts {
	'client/hud-c.lua',
	'client/stress.lua',
	'client/vhud-c.lua',
	'client/fuel.lua',
}

server_scripts {
	'config.lua',
	"server/main.lua",
}

exports {
	'GetFuel',
	'SetFuel'
}