-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format('require"plugins.%s"', name)
  end

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'weilbith/nvim-code-action-menu' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }

  -- Treesitter
  use { 
      'SmiteshP/nvim-gps', 	
      requires = 'nvim-treesitter/nvim-treesitter',
      config = lua_path'nvim-gps' 
  }

-- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Status Line and Bufferline
  use { 'famiu/feline.nvim', config = lua_path'feline' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = lua_path'gitsigns' }

  -- Code Commenter
  use { 'preservim/nerdcommenter' }

  -- Folke
  use { 'folke/trouble.nvim' }
  use { 'folke/which-key.nvim', config = lua_path'which-key' }

  use { 'junegunn/fzf', run = ':call fzf#install()' }
  use { 'junegunn/fzf.vim', after = 'fzf', config = lua_path'fzf-vim' }

  -- Registers & clipboard
  use { 'AckslD/nvim-neoclip.lua', config = lua_path"nvim-neoclip" }

 -- Telescope
  use { 
      'nvim-telescope/telescope.nvim', 
      requires = {
         'nvim-lua/popup.nvim', 
         'nvim-lua/plenary.nvim', 
         'cljoly/telescope-repo.nvim', 
         'nvim-telescope/telescope-dap.nvim', 
         'nvim-telescope/telescope-live-grep-args.nvim',
         'nvim-telescope/telescope-dap.nvim'
      },
      config = lua_path'telescope' 
  }

  -- Debugger
  use { 'mfussenegger/nvim-dap', config = lua_path"nvim-dap" }
  use { 'rcarriga/nvim-dap-ui', config = lua_path"nvim-dap-ui" }
  use { 'theHamsta/nvim-dap-virtual-text', config = lua_path"nvim-dap-virtual-text" }

end)
