local listOn = false
local total
local Toggled = false

RegisterCommand("scoreboardToggle", function(source, args)
    if #args == 1 then
        if args[1] == "on" then
            Toggled = true
            notify("~g~Scoreboard has been set to a toggle!")
        elseif args[1] == "off" then
            Toggled = false
            notify("~g~Scoreboard has been set to a hold!")
        else
            notify("~o~Please to /scoreboardToggle on or off")
        end
    else
        notify("~o~Please to /scoreboardToggle on or off")
    end
end)

Citizen.CreateThread(function()
    listOn = false
    while true do
        Wait(0)

        if toggle() and GetLastInputMethod(0) then
            if not listOn then
                local players = {}
                ptable = GetPlayers()
                for _, i in ipairs(ptable) do
                    table.insert(players, 
                    '<div class="col col-6">' ..
                        '<div class="player-info">' ..
                            '<div class="row">' ..
                                '<div class="col col-2 text-center">' ..
                                    '<div>ID</div>' ..
                                    '<div class="player-color">' .. GetPlayerServerId(i) .. '</div>' ..
                                '</div>' ..
                                '<div class="col col-10">' ..
                                    '<div>Name</div>' ..
                                    '<div class="player-color">' .. sanitize(GetPlayerName(i)) .. '</div>' ..
                                '</div>' ..
                            '</div>' ..
                        '</div>' ..
                    '</div>'
                    )
                end

                SendNUIMessage({ text = table.concat(players), pCount = total, icon = Config.icon, ServerName = Config.ServerName, LinkOne = Config.LinkOne, LinkTwo = Config.LinkTwo, MaxPlayers = Config.MaxPlayers })
                SetNuiFocus(true, true)
                SetNuiFocusKeepInput(true)

                listOn = true
                while listOn do
                    Wait(0)
                    DisableAllControlActions(0)
                    EnableControlAction(0, Config.KeyBind, true)
                    if (IsControlJustReleased(0, Config.KeyBind)) then
                        SetNuiFocus(false, false)
                        SetNuiFocusKeepInput(false)
                        listOn = false
                        SendNUIMessage({
                            meta = 'close'
                        })
                        break
                    end
                end
            end
        end
    end
end)

function toggle()
    if Toggled then
        return IsControlJustReleased(0, Config.KeyBind)
    else
        return IsControlPressed(0, Config.KeyBind)
    end
end


function GetPlayers()
    local players = {}

    for _, i in ipairs(GetActivePlayers()) do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    total = #players
    return players
end


function sanitize(txt)
    local replacements = {
        ['&' ] = '&amp;', 
        ['<' ] = '&lt;', 
        ['>' ] = '&gt;', 
        ['\n'] = '<br/>'
    }
    return txt
        :gsub('[&<>\n]', replacements)
        :gsub(' +', function(s) return ' '..('&nbsp;'):rep(#s-1) end)
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end
