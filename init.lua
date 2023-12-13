local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local configpath = vim.fn.stdpath("config")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"rebelot/kanagawa.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
})

local builtin = require('telescope.builtin')

vim.opt.termguicolors = true
vim.api.nvim_set_option("clipboard","unnamed") 

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})

vim.cmd 'colorscheme kanagawa-dragon'

vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("BufEnter", {command = "lcd %:p:h",})

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
