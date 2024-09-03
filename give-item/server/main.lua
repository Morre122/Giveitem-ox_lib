ESX = exports["es_extended"]:getSharedObject()
local lib = exports['ox_lib']

RegisterCommand("giveitem", function(source, args, rawCommand)
    if havePermission(source) then
        TriggerClientEvent('givestuff:menu', source)
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Neturi leidimo!',
            description = 'Neturi leidimo naudotis šia komanda!',
            type = 'error'
        })
    end
end)

print("Serverio kodas veikia!") -- Tai turėtų pasirodyti tik serverio konsolėje


RegisterNetEvent('givestuff:givestuff')
AddEventHandler('givestuff:givestuff', function(item, playerId, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    print("Gautas daiktas/itemas:", item, "Žaidėjui:", playerId, "Kiekis:", quantity)

    if havePermission(source) then
        local targetPlayer = ESX.GetPlayerFromId(playerId)
        if targetPlayer then
            targetPlayer.addInventoryItem(item, quantity)
            if Config.Siustizinutes then
                TriggerClientEvent('ox_lib:notify', playerId, {
                    title = 'Sėkmingai davei daiktą/itemą!',
                    description = 'Sėkmingai davei daiktą/itemą žaidėjui ID:' .. playerId,
                    type = 'success'
                })
            end
        else
            if Config.Siustizinutes then
                TriggerClientEvent('ox_lib:notify', source, {
                    title = 'Nepavyko duoti daikto/itemo!',
                    description = 'Nepavyko duoti daikto/itemo žaidėjui ID: ' .. playerId,
                    type = 'error'
                })
            end
        end
    end
end)

function havePermission(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return false end
    local playerGroup = xPlayer.getGroup()
    local isAdmin = false
    for k,v in pairs(Config.Administracija) do
        if v == playerGroup then
            isAdmin = true
            break
        end
    end
    return isAdmin
end