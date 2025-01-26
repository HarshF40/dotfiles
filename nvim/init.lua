-- Set background to dark to match the Alacritty dark theme
vim.o.background = "dark"
-- Enable relative numbers and cursor line
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline = true

-- Set transparent background for various UI elements
--vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  -- Transparent background for normal text
--vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")  -- Transparent background for status line
--vim.cmd("hi StatusLineNC guibg=NONE ctermbg=NONE")  -- Transparent background for inactive status line
--vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")  -- Transparent background for line numbers
--vim.cmd("hi NonText guibg=NONE ctermbg=NONE")  -- Transparent background for NonText elements (e.g., whitespace)
--vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")  -- Transparent background for end of buffer
--vim.cmd("hi CursorLine guibg=NONE ctermbg=NONE")  -- Transparent current line background

-- Load user configurations for plugins, LSP, completion, etc.
require('user.plugins')
require('user.lsp')
require('user.lsp_signature')
require('user.cmp')
require('user.treesitter')
require('user.autopairs')
require('user.telescope')
require('user.colorscheme')
require('user.keymaps')
require('user.lualine')
require('user.hover')
require('user.alpha')

-- Set transparent background for various UI elements
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  -- Transparent background for normal text
vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")  -- Transparent background for status line
vim.cmd("hi StatusLineNC guibg=NONE ctermbg=NONE")  -- Transparent background for inactive status line
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")  -- Transparent background for line numbers
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")  -- Transparent background for NonText elements (e.g., whitespace)
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")  -- Transparent background for end of buffer
vim.cmd("hi CursorLine guibg=NONE ctermbg=NONE")  -- Transparent current line background
