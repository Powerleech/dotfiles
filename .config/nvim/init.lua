vim.g.mapleader = ' '

local packer_path = vim.fn.stdpath('data') ..
                        '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.api.nvim_command(
        '!git clone https://github.com/wbthomason/packer.nvim --depth 1 ' ..
            packer_path)
end

require'utils'.new_augroup {
    packer_compile = {'BufWritePost plugins.lua PackerCompile'}
}



require("plugins")

require("settings")
require("settings.color")
require("settings.keymap")

require("lsp-config")
