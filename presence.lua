local application = {};

function setDiscordRichPresence()
    if (not isDiscordRichPresenceConnected()) then
        return;
    end

    resetDiscordRichPresenceData();
    local connected = setDiscordApplicationID(application.id);
    if (connected) then
        setDiscordRichPresencePartySize(#getElementsByType("player"), application['server'].max_slots);
        if (application['buttons'][1].use) then setDiscordRichPresenceButton(1, application['buttons'][1].name, application['buttons'][1].link); end
        if (application['buttons'][2].use) then setDiscordRichPresenceButton(2, application['buttons'][2].name, application['buttons'][2].link); end
        if (application['server']['description']:len() > 0) then setDiscordRichPresenceDetails(application['server'].description); end
        setDiscordRichPresenceAsset(application['server'].logo, application['server'].name);
        setDiscordRichPresenceState(application['server'].name);
        setDiscordRichPresenceStartTime(1);
    end
end

addEvent("addPlayerRichPresence", true);
addEventHandler("addPlayerRichPresence", resourceRoot,
    function(data)
        application = data;
        setDiscordRichPresence();
    end
);

addEventHandler("onClientPlayerJoin", root, 
    function()
        if (not isDiscordRichPresenceConnected()) then
            return;
        end

        setDiscordRichPresencePartySize(#getElementsByType("player"), application['server'].max_slots);
    end
);

addEventHandler("onClientPlayerQuit", root, 
    function()
        if (not isDiscordRichPresenceConnected()) then
            return;
        end
        
        setDiscordRichPresencePartySize(#getElementsByType("player"), application['server'].max_slots);
    end
);