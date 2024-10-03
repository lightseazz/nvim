vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

-- UI =========================================
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.wrap = false

vim.opt.splitbelow = true -- Horizontal splits will be below
vim.opt.splitright = true -- Vertical splits will be to the right

-- Editing =========================================
vim.opt.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
vim.opt.smartcase = true -- Don't ignore case when searching if pattern has upper case

vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Use this number of spaces for indentation
vim.opt.smartindent = true -- Make indenting smart
vim.opt.tabstop = 4 -- Insert 2 spaces for a tab
