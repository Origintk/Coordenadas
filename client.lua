RegisterNetEvent("salva")
AddEventHandler("salva", function()
	x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	    local PlayerName = GetPlayerName()
	    TriggerServerEvent("coordenadas", PlayerName , x , y , z)			
end)
