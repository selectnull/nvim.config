-- see `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- my own configuration
require "selectnull.vimopts"
require "selectnull.keymaps"
require "selectnull.emacs-insert-mode"
require "selectnull.make-css"
require "selectnull.filetypes"
require "selectnull.quickfix"
require "selectnull.whitespace"

-- completion engine: 'native' | 'blink' | 'cmp'
vim.g.completion_engine = vim.g.completion_engine or "blink"

-- plugins
local github = function(repo)
  return "https://github.com/" .. repo
end
vim.pack.add {
  github "nvim-tree/nvim-web-devicons",
  github "neovim/nvim-lspconfig",
  github "saghen/blink.lib",
  github "saghen/blink.cmp",
  github "hrsh7th/nvim-cmp",
  github "hrsh7th/cmp-nvim-lsp",
  github "hrsh7th/cmp-path",
  github "hrsh7th/cmp-buffer",
  github "nvim-treesitter/nvim-treesitter",
  github "lewis6991/gitsigns.nvim",
  github "ibhagwan/fzf-lua",
  github "stevearc/conform.nvim",
  {
    src = github "kylechui/nvim-surround",
    version = vim.version.range "4.x",
  },
  github "nvim-lualine/lualine.nvim",
}

local dev = vim.fn.expand "~/dev/codeexplorer.nvim"
vim.opt.rtp:prepend(dev)
require("codeexplorer").setup { key = "<C-CR>" }

require "selectnull.completion"
require "selectnull.lsp"

require "selectnull.colorschemes"
