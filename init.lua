-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
vim.opt.relativenumber = false -- 取消相对行号
-- 覆盖 telescope buffer 的快捷键
vim.keymap.set(
  "n",
  "<leader><space>",
  function() require("telescope.builtin").buffers() end,
  { noremap = true, silent = true }
)

-- 通过 osc52 协议打通 粘贴板
vim.opt.clipboard = "unnamedplus"
function my_paste(reg)
  return function(lines)
    --[ 返回 “” 寄存器的内容，用来作为 p 操作符的粘贴物 ]
    local content = vim.fn.getreg '"'
    return vim.split(content, "\n")
  end
end

if os.getenv "SSH_TTY" == nil then
  --[ 当前环境为本地环境，也包括 wsl ]
  vim.opt.clipboard:append "unnamedplus"
else
  vim.opt.clipboard:append "unnamedplus"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      --[ 小括号里面的内容可能是毫无意义的，但是保持原样可能看起来更好一点 ]
      ["+"] = my_paste "+",
      ["*"] = my_paste "*",
    },
  }
end
