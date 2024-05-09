return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    -- require("peek").setup({
    --     auto_load = true,
    --       close_on_bdelete = true,  -- close preview window on buffer delete
    --       syntax = true,            -- enable syntax highlighting, affects performance
    --       theme = 'dark',           -- 'dark' or 'light'
    --       update_on_change = true,
    --       app ={ 'chromium', '--new-window' },          -- 'webview', 'browser', string or a table of strings
    --       filetype = { 'markdown' },-- list of filetypes to recognize as markdown
    --       throttle_at = 200000,     -- start throttling when file exceeds this
    --       throttle_time = 'auto',
    -- })
    -- vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    -- vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    -- 使用 peek preview 窗口
    local peek = require "peek"

    vim.api.nvim_create_user_command("PeekOpen", function()
      if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == "markdown" then
        vim.fn.system "i3-msg split horizontal"
        peek.open()
      end
    end, {})

    vim.api.nvim_create_user_command("PeekClose", function()
      if peek.is_open() then
        peek.close()
        vim.fn.system "i3-msg move left"
      end
    end, {})
  end,
}
