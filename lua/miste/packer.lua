-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('navarasu/onedark.nvim')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- LSP plugins
  use {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
  }

  use {'kaarmu/typst.vim', ft = {'typst'}}

  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use('tpope/vim-commentary')
  use("tpope/vim-fugitive")
  use('justinmk/vim-sneak')
  use('wellle/targets.vim')
  use('michaeljsmith/vim-indent-object')
  use('inkarkat/vim-ReplaceWithRegister')

end)
