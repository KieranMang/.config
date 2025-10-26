return {

------------------nvim-lspconfig-----------------

    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
            vim.keymap.set("n", "<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
            vim.keymap.set("n", "<leader>vl", function()
                if vim.diagnostic.config().virtual_lines then
                    vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
                else
                    vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
                end
            end)

            vim.diagnostic.config({ virtual_text = true })
        end

    },

----------------------mason----------------------

    {
        "mason-org/mason.nvim",
        opts = {}
    },

-----------------mason-lspconfig-----------------

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },

---------------------lazydev---------------------

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
