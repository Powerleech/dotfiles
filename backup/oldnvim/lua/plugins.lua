require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format('require"plugins.%s"', name)
  end

  use { 'ggandor/lightspeed.nvim', config = lua_path'lightspeed' }
  -- use { "williamboman/mason.nvim", config = lua_path'mason-nvim' }
  -- use { "williamboman/mason-lspconfig.nvim", config = lua_path"mason-lspconfig-nvim" }


  -- folke
  use { 'folke/trouble.nvim' }
  use { 'folke/lsp-colors.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { 'folke/which-key.nvim', config = lua_path'which-key' }
  use { "onsails/lspkind-nvim" }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'weilbith/nvim-code-action-menu' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
  use { 'williamboman/nvim-lsp-installer' }
  -- Rename with visualisation
		use({
			"smjonas/inc-rename.nvim",
			config = function()
				require("inc_rename").setup()
			end,
		})
  -- cmp
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      },
    config = lua_path'cmp-nvim'
  }

  -- Treesitter
  use {
      'SmiteshP/nvim-gps',
      requires = 'nvim-treesitter/nvim-treesitter',
      config = lua_path'nvim-gps'
  }

  -- NERDtree
  use { 'preservim/nerdtree' }

  -- colorscheme
     use { 'sainnhe/gruvbox-material' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Status Line and Bufferline
  use { 'famiu/feline.nvim', config = lua_path'feline' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = lua_path'gitsigns' }

  -- Code Commenter
   use { 'tpope/vim-commentary' }

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
