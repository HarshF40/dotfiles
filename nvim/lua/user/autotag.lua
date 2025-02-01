require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,  -- Enable auto-closing of tags
    enable_rename = true, -- Enable auto-renaming of tags
    enable_close_on_slash = false -- Disable auto-closing on trailing '/'
  },
  per_filetype = {
    ["html"] = {
      enable_close = true -- Enable auto-closing for HTML files
    }
  }
})
