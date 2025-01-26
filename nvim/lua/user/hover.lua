local lsp_util = vim.lsp.util
local hover_bufnr = nil
local hover_winnr = nil
local show_definitions = false -- Track whether definition mode is enabled

-- Function to open a floating window with the definition
local function show_definition()
    if not show_definitions then return end -- Only show if enabled

    if vim.bo.readonly or vim.fn.mode() == "n" then
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        local params = {
            textDocument = { uri = vim.uri_from_bufnr(0) },
            position = { line = line - 1, character = col },
        }

        vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result, ctx, _)
            if err or not result or not result.contents then return end

            -- Close existing floating window if open
            if hover_winnr and vim.api.nvim_win_is_valid(hover_winnr) then
                vim.api.nvim_win_close(hover_winnr, true)
            end

            -- Prepare content for floating window
            local content = lsp_util.convert_input_to_markdown_lines(result.contents)
            content = lsp_util.trim_empty_lines(content)

            -- Create a floating window buffer
            hover_bufnr = vim.api.nvim_create_buf(false, true)

            -- Set the filetype for syntax highlighting
            local filetype = vim.bo.filetype  -- Use current filetype for hover buffer
            vim.api.nvim_buf_set_option(hover_bufnr, 'filetype', filetype)

            -- Set lines for the hover buffer
            vim.api.nvim_buf_set_lines(hover_bufnr, 0, -1, false, content)

            -- Apply syntax highlighting
            vim.cmd("syntax enable") -- Enable syntax highlighting

            -- Create the floating window
            hover_winnr = vim.api.nvim_open_win(hover_bufnr, false, {
                relative = "cursor",
                row = 1,
                col = 0,
                width = 50,
                height = #content,
                style = "minimal",
                border = "rounded",
            })
        end)
    end
end

-- Trigger definition popup when cursor moves (only in normal mode)
vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function()
        if vim.fn.mode() == "n" then
            vim.defer_fn(show_definition, 100) -- Slight delay to avoid flickering
        end
    end,
})

-- Close the floating window when entering any mode other than normal
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        if hover_winnr and vim.api.nvim_win_is_valid(hover_winnr) then
            vim.api.nvim_win_close(hover_winnr, true)
        end
    end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:[vix]",
    callback = function()
        if hover_winnr and vim.api.nvim_win_is_valid(hover_winnr) then
            vim.api.nvim_win_close(hover_winnr, true)
        end
    end,
})

-- Add commands to enable or disable the definition mode
vim.api.nvim_create_user_command("ShowDef", function()
    show_definitions = true
    print("Definition mode enabled")
end, {})

vim.api.nvim_create_user_command("HideDef", function()
    show_definitions = false
    -- Close any open hover window
    if hover_winnr and vim.api.nvim_win_is_valid(hover_winnr) then
        vim.api.nvim_win_close(hover_winnr, true)
    end
    print("Definition mode disabled")
end, {})

