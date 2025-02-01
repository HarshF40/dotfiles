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
	use 'mattn/emmet-vim'
end)
