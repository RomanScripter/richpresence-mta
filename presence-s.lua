--[[
    https://discord.com/developers/applications <- LINK DISCORD DEVELOPERS PAGE
    CREATE APPLICATION (WITH YOUR SERVER NAME)
    INSERT YOUR SERVER LOGO
    COPY THIS APPLICATION ID
--]]

local application = {
    id = "1166352538489065553",

    server = {
        name = "Roman Store Inc.",
        logo = "https://i.imgur.com/wkRCwhI.png",
        max_slots = tonumber(getServerConfigSetting("maxplayers")),
        description = "Melhor loja de resources do MTA:SA."
    },

    buttons = {
        [1] = {
            use = true,
            name = "Discord",
            link = "https://discord.gg/romanstore"
        },

        [2] = {
            use = true,
            name = "Conectar",
            link = "mtasa://26.0.147.32:22003"
        }
    }
};

addEventHandler("onPlayerResourceStart", root,
    function(theResource)
        if (theResource == getThisResource()) then
            triggerClientEvent(source, "addPlayerRichPresence", resourceRoot, application);
        end
    end
);