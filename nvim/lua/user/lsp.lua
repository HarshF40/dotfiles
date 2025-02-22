--python
require'lspconfig'.pyright.setup{}

--c/cpp
require'lspconfig'.clangd.setup{
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require('lspconfig.util').root_pattern(".clangd", ".git", "build"),
}

--js
require'lspconfig'.ts_ls.setup{
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
  root_dir = require('lspconfig.util').root_pattern("package.json", "tsconfig.json", ".git"),
  on_attach = function(client, bufnr)
    -- Optional: Disable ts_ls formatting if using a separate formatter (e.g., Prettier)
    client.server_capabilities.documentFormattingProvider = false

    -- Keybindings for LSP (if not already set globally)
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }
    buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- HTML LSP
require'lspconfig'.html.setup{
  filetypes = { "html" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- Initialize Mason (Dart LSP)
require('mason').setup()
require('mason-lspconfig').setup()
require'lspconfig'.dartls.setup{
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

-- prisma
require'lspconfig'.prismals.setup{
  on_attach = function(client, bufnr)
    -- Keybindings for LSP
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }
    buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
