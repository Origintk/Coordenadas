--[[
    By Solzinho
]]

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/nomeaqui" then
		CancelEvent()
		TriggerClientEvent("salva", source)
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterServerEvent("coordenadas")
AddEventHandler("coordenadas", function( PlayerName , x , y , z )
SendWebhookMessage(ac_webhook_coordenadas, "```\n{"..x..","..y..","..z.."},```")
end)

Citizen.CreateThread(function()
	ac_webhook_coordenadas = GetConvar("ac_webhook_coordenadas", "none")
	function SendWebhookMessage(webhook,message)
		if webhook ~= "none" then
			PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
		end
	end
end)
