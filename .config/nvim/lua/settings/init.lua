-- temp: https://github.com/crivotz/nv-ide/blob/master/lua/settings/init.lua
-- highlight ColorColumn ctermbg=0 guibg=lightgrey
local o = vim.opt

o.termguicolors = true -- virker det her
o.relativenumber = true 
o.hlsearch = true
o.hidden = true 
o.tabstop = 4
o.undofile = true
o.undodir = '~/.config/nvim/undo-dir'
o.cursorline = true
o.autowrite = true -- auto write buffer when it's not focued
o.autoindent = true
o.smartindent = true
o.smarttab = true
o.splitright = true
o.softtabstop = 4
o.shiftwidth = 4
o.swapfile = false
o.expandtab = true
o.smartindent = true
o.number = true
o.smartcase = true
o.undofile = false
o.incsearch = true
o.scrolloff= 8
o.modifiable = true
o.clipboard = 'unnamedplus'
o.syntax = on
o.cmdheight = 2
o.colorcolumn = '100'
o.updatetime = 50
o.statusline = '%#warningmsg#'
o.laststatus     = 3 -- always enable statusline
o.re             = 0 -- set regexp engine to auto
o.scrolloff      = 2 -- make scrolling better
o.sidescroll     = 2 -- make scrolling better
o.shiftwidth     = 2 -- set indentation width
o.sidescrolloff  = 15 -- make scrolling better
o.tabstop        = 2 -- tabsize
o.timeoutlen     = 400 -- faster timeout wait time

