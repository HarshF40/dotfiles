require "lsp_signature".setup({
  bind = true,
  floating_window = true, -- Show definition in a floating window
  hint_enable = false,    -- Disable inline hints
  handler_opts = {
    border = "rounded"    -- Border style for floating window
  },
  extra_trigger_chars = { ".", "->" }, -- Trigger definition lookup on these characters
})

