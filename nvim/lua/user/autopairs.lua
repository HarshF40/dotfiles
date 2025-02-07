require('nvim-autopairs').setup{
  check_ts = true,  -- Enable Treesitter support for better tag completion
  filetypes = {"html"},
  enable_close = true,
}


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

