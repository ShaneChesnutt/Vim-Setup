-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  use ({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  use { "lvimuser/lsp-inlayhints.nvim", branch = "anticonceal" }

  use {
    "danymat/neogen",
    config = function()
      require("neogen").setup()
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- Debugger
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/cmp-dap" }
  use { "theHamsta/nvim-dap-virtual-text" }
  use { "mxsdev/nvim-dap-vscode-js", require = { "mfussenegger/nvim-dap" } }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }

  -- Test Runner
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "olimorris/neotest-rspec"
    }
  })
  use { "vim-test/vim-test" }

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opts = true }
  }

  -- Color Scheme
  use { "olimorris/onedarkpro.nvim" }

  -- TPope Plugins
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-projectionist' }
  use { "tpope/vim-rails" }

  use {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        view_options = {
          -- Show hidden files
          show_hidden = true,
          is_hidden_file = function(name)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function()
            return false
          end,
        },
      })
    end
  }

  use { "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_list = {
        { path = "~/workspace/personal/docs/" }
      }
      vim.g.vimwiki_global_ext = 0
    end
  }

  use {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require"octo".setup()
    end
  }

  use { "kburdett/vim-nuuid" }
  use { "voldikss/vim-floaterm" }
  use { "godlygeek/tabular" }
  use { "nathanaelkane/vim-indent-guides" }
  use { "lewis6991/gitsigns.nvim" }
end)
