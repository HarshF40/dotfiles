require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require('lspconfig.util').root_pattern(".clangd", ".git", "build"),
}

