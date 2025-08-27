vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.wrap = true
vim.opt.guifont = "AtykonsonMono Nerd Font 11"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.list = true
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
vim.keymap.set("n", "PageUp", "<nop>")
vim.keymap.set("n", "PageDown", "<nop>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<Tab>", ">")
vim.keymap.set("v", "<S-Tab>", "<")

-- clumsy bindings due to shift hehe
vim.cmd([[cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
]])
