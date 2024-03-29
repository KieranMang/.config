-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'



    -- File Navigation

use 'junegunn/fzf'
use 'junegunn/fzf.vim'

use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
}



    -- Visuals

  use ({
	  "catppuccin/nvim",
   	   as = "catppuccin",
          config = function()
	          vim.cmd('colorscheme catppuccin-mocha')
          end
      })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'}

use {
    "goolord/alpha-nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()

        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end
}

use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

use {'sbdchd/neoformat'}



-- Utilities

use('lervag/vimtex')

use('mbbill/undotree')

use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }


use{'christoomey/vim-tmux-navigator'}



-- Other Stuff

use{'ThePrimeagen/vim-be-good'}

end)
