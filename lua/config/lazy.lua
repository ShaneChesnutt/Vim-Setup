local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

-- Set leader key
vim.g.mapleader = ","

local plugins = {
  {
	  'nvim-telescope/telescope.nvim', version = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
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
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  { "lvimuser/lsp-inlayhints.nvim", branch = "anticonceal" },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup()
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  -- Debugger
  { "mfussenegger/nvim-dap" },
  { "rcarriga/cmp-dap" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "mxsdev/nvim-dap-vscode-js", dependencies = "mfussenegger/nvim-dap" },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  -- Test Runner
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "olimorris/neotest-rspec"
    }
  },
  { "vim-test/vim-test" },
  -- Status Line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  -- Color Scheme
  { "olimorris/onedarkpro.nvim" },
  -- TPope Plugins
  { 'tpope/vim-commentary' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-projectionist' },
  { "tpope/vim-rails" },
  {
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
  },
  { "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        { path = "~/workspace/personal/docs/" }
      }
      vim.g.vimwiki_global_ext = 0
    end
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require"octo".setup()
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { "kburdett/vim-nuuid" },
  { "voldikss/vim-floaterm" },
  { "godlygeek/tabular" },
  { "lewis6991/gitsigns.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { 'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup()
    end
  }
}

require("lazy").setup(plugins, {})
