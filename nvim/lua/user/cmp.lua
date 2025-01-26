local cmp = require'cmp'

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
	  format = function(entry, item)
		  return item
		end,
  },
  experimental = {
	  ghost_text = true,
  },
})
