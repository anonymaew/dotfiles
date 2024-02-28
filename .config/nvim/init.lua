vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { -- VSCode theme
    'tomasiser/vim-code-dark',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.codedark_transparent = 1
      vim.cmd.colorscheme('codedark')
    end,
  },
  { -- Treesitter for better syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'all',
        highlight = {
          enable = true,
          disable = { 'markdown', 'latex' },
        },
        indent = {
          enable = true,
        },
      }
    end,
  },
  { -- For Jupyter Notebook
    "GCBallesteros/jupytext.nvim",
    config = true,
    lazy = false,
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  { -- Seemless navigation between tmux and vim 
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  -- Commenting code using gc
  { 'numToStr/Comment.nvim', opts = {} },
  { -- Telescope for fuzzy finding
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- tpope plugins
  'tpope/vim-sleuth',
  'tpope/vim-sensible',
  'tpope/vim-surround',
  { -- GitHub Copilot
    'github/copilot.vim',
    init = function()
      vim.g.copilot_filetypes = {
	markdown = 1,
	yaml = 1
      }
    end,
  },
})

vim.wo.number = true
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
