require('catppuccin').setup({
    disable_background = true
})


function ColourMyPencils(colour)
    colour = colour or 'catppuccin'
    vim.cmd.colorscheme(colour)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColourMyPencils()
