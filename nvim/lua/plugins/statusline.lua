return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            theme = "gruvbox-material",
            options = {
                section_separators = "",
                component_separators = { left = "│", right = "│" },
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"filetype", "filename"},
                lualine_c = {"lsp_status", "selectioncount"},
                lualine_x = {"branch", "diff", "diagnostics"},
                lualine_y = {"progress"},
                lualine_z = {"location"},
            },
        },
    }
}


