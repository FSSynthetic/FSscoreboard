local listOn = false
local total

Citizen.CreateThread(function()
    listOn = false
    while true do
        Wait(0)

        if IsControlJustReleased(0, Config.KeyBind) and GetLastInputMethod(0) then
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
                    if(IsControlJustReleased(0, Config.KeyBind)) then
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
