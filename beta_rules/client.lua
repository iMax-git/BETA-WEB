local text = vector3(-825.728, -112.712, 27.958)

function Draw3DText(x,y,z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end


local distance_until_text_disappears = 50

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if Vdist2(GetEntityCoords(PlayerPedId(), false), text) < distance_until_text_disappears then
                Draw3DText(text.x, text.y, text.z, 1.5, "Tapez la commande /rules<br>pour lire le réglement !")
            end
        end
    end
)