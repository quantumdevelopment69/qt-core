RegisterNetEvent("qt-core:ItemInterval")
 AddEventHandler("qt-core:ItemInterval", function(task, item, count)
    if IsValidTask(task) and QT.GetFromId(source) then
        if task == "add" then
            QT.AddItem(source, item, count)
        elseif task == "remove" then
            QT.RemoveItem(source, item, count)
        end
    end
end)


