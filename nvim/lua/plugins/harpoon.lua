return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {"<leader>e", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end},
            {"<leader>a", function() require("harpoon"):list():add() end},

        }
    }
}
