vim.wo.relativenumber = true
vim.opt.spell = true
vim.opt.spelllang = {"en_us"}
vim.o.suffixes = ",,"
vim.cmd([[autocmd BufEnter *.pdf execute "!evince '%' > /dev/null &" | bdelete %]])

