return {

  {
    -- j k 快速移动 长按快速移动
    "rhysd/accelerated-jk",
    config = function()
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
    end,
  },
  {
    -- 快速移动查找粘贴
    "folke/flash.nvim",
    config = function()
      require("flash").setup()
      vim.keymap.set({ "n", "x", "o" }, "s", function()
        require("flash").jump {
          search = {
            mode = function(str) return "\\<" .. str end,
          },
        }
      end)
      vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end)
      vim.keymap.set({ "o" }, "r", function() require("flash").remote() end)
      vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end)
    end,
  },
  { -- 窗口快速切换
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup {
        filter_rules = {
          include_current_win = true,
          bo = {
            filetype = { "fidget", "neo-tree" },
          },
        },
      }
      vim.keymap.set("n", "<c-w>p", function()
        local window_number = require("window-picker").pick_window()
        if window_number then vim.api.nvim_set_current_win(window_number) end
      end)
    end,
  },
}
