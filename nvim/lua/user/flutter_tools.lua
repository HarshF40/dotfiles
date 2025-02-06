require('flutter-tools').setup{
  lsp = {
    on_attach = function(client, bufnr)
      local opts = { noremap=true, silent=true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    dap_configurations = {
      {
        name = "Launch Flutter",
        type = "dart",
        request = "launch",
        program = "${workspaceFolder}/lib/main.dart",
      },
    },
    dap = require('dap'),
  },
}

