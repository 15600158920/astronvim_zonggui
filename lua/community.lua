-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" }, -- 猫不齐主题
  { import = "astrocommunity.colorscheme.miasma-nvim" }, -- 主题
  { import = "astrocommunity.utility.noice-nvim" }, -- 命令栏
  { import = "astrocommunity.completion.cmp-cmdline" }, -- 命令补齐
  --
  --

  { import = "astrocommunity.markdown-and-latex.peek-nvim" }, -- markdown 预览
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" }, -- 文件浏览

  -- import/override with your plugins folder
}
