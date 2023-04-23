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
  -- VSCode theme
  {
    'tomasiser/vim-code-dark',
    lazy = false,
    priority = 1000,
    config = function()
	    vim.cmd.colorscheme('codedark')
    end,
  },
  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  -- Commenting code using gc
  { 'numToStr/Comment.nvim', opts = {} },
  -- tpope plugins
  'tpope/vim-sleuth',
  'tpope/vim-sensible',
})

vim.wo.number = true
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
