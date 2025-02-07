vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
  	use 'neovim/nvim-lspconfig'
  	use 'hrsh7th/nvim-cmp'
  	use 'hrsh7th/cmp-nvim-lsp'
  	use 'nvim-treesitter/nvim-treesitter'
  	use 'windwp/nvim-autopairs'
  	use 'nvim-lua/plenary.nvim'
  	use 'nvim-telescope/telescope.nvim'
  	use 'bluz71/vim-moonfly-colors'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'ray-x/lsp_signature.nvim'
	use 'goolord/alpha-nvim'
	use 'windwp/nvim-ts-autotag'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'nvim-flutter/flutter-tools.nvim'
	use 'mfussenegger/nvim-dap'
	use 'nvim-tree/nvim-tree.lua'
end)
