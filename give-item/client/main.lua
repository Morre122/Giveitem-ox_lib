ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('givestuff:menu')
AddEventHandler('givestuff:menu', function()
    local input = lib.inputDialog('Duoti daiktą/itemą', {
        {type = 'input', label = 'Itemas/Daiktas', description = 'Įveskite daikto/itemo pavadinimą', required = true, min = 1, max = 200},
        {type = 'number', label = 'ID', description = 'Žaidėjo ID, kuriam duodamas daiktas/itemas', required = true},
        {type = 'number', label = 'Kiekis', description = 'Jūsų norimo daikto/itemo kiekis', required = true},
    })

    if input then
        local item = input[1]
        local playerId = input[2]
        local quantity = input[3]

        TriggerServerEvent('givestuff:givestuff', item, playerId, quantity)
    end
end)
