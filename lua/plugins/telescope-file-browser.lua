return {

  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

  config = function()
    require("telescope").setup {
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }
    vim.keymap.set("n", "<space>fd", ":Telescope file_browser<CR>")

    -- open file_browser with the path of the current buffer
    vim.keymap.set("n", "<space>fd", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

    -- Alternatively, using lua API
    vim.keymap.set("n", "<space>fd", function() require("telescope").extensions.file_browser.file_browser() end)
  end,
}
