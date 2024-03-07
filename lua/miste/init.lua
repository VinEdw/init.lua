-- Use the other files in this directory
require("miste.set")
require("miste.remap")

-- Ensure lazy.nvim is installed
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

-- Install plugins
require("lazy").setup({
  -- Onedark editor theme
  {
    "navarasu/onedark.nvim",
    opts = { style = "darker" },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },

  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSP Plugins
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  -- Vimscript plugins
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "justinmk/vim-sneak",
  "wellle/targets.vim",
  "michaeljsmith/vim-indent-object",
  "inkarkat/vim-ReplaceWithRegister",
  -- Typst plugin
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },
})

-- Flash a highlight on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
augroup END
]]
