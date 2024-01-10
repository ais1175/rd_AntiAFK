Citizen.CreateThread(function()
	while true do
		Wait(1000)
		Player = PlayerId()
		if Player then
			Position = GetEntityCoords(Player, true)
			if LastPosition and Position == LastPosition then
				if Time > 0 then
				    if Config.KickWarning and Time == math.ceil(Config.TimeHowMuchPlayerCanBeAFK / 4) then

                        local message = TranslateCap('Player_will_be_kicked')
                        local template = message
                        local replacements = {
                            ["{TIMELEFT}"] = Time,
                        }
                        local pattern = "{(.-)}"
                        local result = template:gsub(pattern, function(key)
                            return replacements['{' .. key .. '}'] or key
                        end)

                        TriggerEvent('rd:antiafk:notify', result, TranslateCap('Notification_Title'))
                    end

                    Time = Time - 1

				else
                    TriggerServerEvent("RespectDevelopment:afk:kick")
				end
			else
				Time = Config.TimeHowMuchPlayerCanBeAFK
			end

			LastPosition = Position 
		end
	end
end)





