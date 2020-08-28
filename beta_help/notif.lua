
function notification()
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
    ESX.ShowAdvancedNotification('BETA-Life', 'Tutoriel', 'Tapez: /rules pour avoir les règles ou /touche pour avoir les touches', mugshotStr, 1)
    UnregisterPedheadshot(mugshot)
end

Citizen.CreateThread(function ()
    while true do
        notification()
        Citizen.Wait(240)
    end
end)