local QBCore = nil
isLoggedIn = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(200)
	end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    isLoggedIn = true
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload")
AddEventHandler("QBCore:Client:OnPlayerUnload", function()
    isLoggedIn = false
end)

Citizen.CreateThread(function() 
    while true do
		Citizen.Wait(1000)
		if isLoggedIn then
			Citizen.Wait(100)
        	QBCore.Functions.GetPlayerData(function(PlayerData)
            	local player = PlayerPedId()
            	local health = GetEntityHealth(player) - 100
            	local hunger = PlayerData.metadata["hunger"]
            	local thirst = PlayerData.metadata["thirst"]
            	local stress = PlayerData.metadata["stress"]
            	local armor  = GetPedArmour(player)
				--local talking = false
				--local mumbleData = exports["mumble-voip"]:RetrieveMumbleData()

            	if IsEntityInWater(player) then
                	oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
            	else
                	oxy = 100 - GetPlayerSprintStaminaRemaining(PlayerId())
            	end

				if IsPauseMenuActive() then
					SendNUIMessage({show = false})
				end

--[[ 				if mumbleData and mumbleData[svrId] and not mumbleData[svrId].radioActive and NetworkIsPlayerTalking(PlayerId()) then 
					talking = 'normal'
				elseif mumbleData and mumbleData[svrId] and mumbleData[svrId].radioActive then 
					talking = 'radio'
				else 
					talking = false 
				end ]]

            	SendNUIMessage({
                	type = "updateStatusHud",
					show = true,
                	varSetHealth = health,
                	varSetArmor = armor,
                	varSetOxy = oxy,
                	--varSetVoice = mumbleData,
					--talking = talking,
                	varSetHunger = hunger,
                	varSetThirst = thirst,
                	varSetStress = stress,
            	})
			end)
        end
    end
end)

-- Radar While Driving
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local player = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)

		if IsPedInAnyVehicle(player, false) and vehicleIsOn then
			DisplayRadar(true)
		else
			DisplayRadar(false)
		end
	end
end)

-- Round MiniMap
Citizen.CreateThread(function()
	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end
	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
	
	SetMinimapClipType(1)
	SetMinimapComponentPosition('minimap', 'L', 'B', -0.0160, -0.030, 0.140, 0.23)
	SetMinimapComponentPosition('minimap_mask', 'L', 'B', -0.012, 0.015, 0.2, 0.292)
	SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.012, 0.015, 0.2, 0.292)
	SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
end)