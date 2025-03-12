vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu")
vim.cmd("set rnu")
vim.g.mapleader = " "
vim.keymap.set({ "v", "n" }, "<leader>c", '"*y')
vim.keymap.set({ "v", "n" }, "<leader>v", '"*p')
