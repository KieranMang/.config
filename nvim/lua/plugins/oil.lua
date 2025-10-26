return {
    {
        'stevearc/oil.nvim',
        opts = {
            columns = {
                "icon",
            },
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
    }
}
