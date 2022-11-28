local opt = vim.opt
local cmd = vim.cmd

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------------------
-- Main Options
--------------------

opt.encoding = 'utf-8'
opt.number = true
opt.relativenumber = true
opt.ruler = true

--------------------
-- Search options
--------------------

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false 
opt.incsearch = true

--------------------
-- Indent options
--------------------

opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2 
opt.shiftround = true
opt.expandtab = false
opt.backspace = "indent,eol,start"

--------------------
-- UI
--------------------

opt.laststatus = 2
opt.cursorline = true
opt.mouse = 'a'
opt.title = true
opt.termguicolors = true
opt.background = 'dark'
cmd "colorscheme tokyonight-night"

--------------------
-- Performances
--------------------

cmd 'set complete-=i'
opt.lazyredraw = true

--------------------
-- Clipboard, window splitting
--------------------

opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append('-')
