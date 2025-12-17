--lua/plugins/twilight.lua
return {
    "folke/twilight.nvim",
    opts = {
        dimming = {
            alpha = 0.25, -- livello di oscuramento (0 = trasparente, 1 = completamente scuro)
            -- usa i colori del tema (everforest gestisce "Normal")
            color = { "Normal", "#ffffff" },
            inactive = true, -- oscura anche le finestre non attive
        },
        context = 10,       -- quante righe attorno al cursore restano evidenziate
        treesitter = true,  -- usa treesitter per capire il contesto
        expand = {          -- quali nodi treesitter espandere
            "function",
            "method",
            "table",
            "if_statement",
        },
    },
}
