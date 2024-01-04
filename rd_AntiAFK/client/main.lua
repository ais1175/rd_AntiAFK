Citizen.CreateThread(function()
	while true do
		Wait(1000)
		playerPed = GetPlayerPed()
		if playerPed then
			currentPos  = GetEntityCoords(playerPed, true)
			if prevPos and currentPos == prevPos then
				if timeLeft > 0 then
					if rd.Notification.NotificationPlayerBelowKicked and timeLeft == math.ceil(rd.Afk.TimeHowMuchPlayerCanBeAFK / 4) then

                        local template = rd.NotificationMessage
                        local replacements = {
                            ["{TIMELEFT}"] = timeLeft,
                        }
                        local pattern = "{(.-)}"
                        local result = template:gsub(pattern, function(key)
                            return replacements['{' .. key .. '}'] or key
                        end)

                        Notify(result)
					end
					timeLeft = timeLeft - 1
				else
                    TriggerServerEvent("RespectDevelopment:afk:kick")
				end
			else
				timeLeft = rd.Afk.TimeHowMuchPlayerCanBeAFK
			end

			prevPos = currentPos 
		end
	end
end)

function Notify(result)
    Wait(250)
    if rd.Notification.NotificationType == "ESX" then
        ESX = exports["es_extended"]:getSharedObject()
        ESX.ShowNotification(result)
    elseif rd.Notification.NotificationType == "OKOK" then
        exports['okokNotify']:Alert('AFK', result, 3000, 'warning', playSound)
    elseif rd.Notification.NotificationType == "OXLIB" then
        lib.notify({
            title = "AFK",
            description = result,
            type = "warning"
        })
    elseif rd.Notification.NotificationType == "CUSTOM" then
        print("[WARNING] Set your own notification in client/main.lia at line 49.") 
        -- Here you set your own notification!
        -- For text set variable "result" btw without ""! :D
    end
end


