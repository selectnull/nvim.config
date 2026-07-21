-- see `:help colorscheme`

local M = {}

-- install colorschemes
local github = require("selectnull.pack").github
vim.pack.add {
  github "srt0/codescope.nvim",
  github "oskarnurm/koda.nvim",
  github "vague-theme/vague.nvim",
  github "rebelot/kanagawa.nvim",
  github "cocopon/iceberg.vim",
  github "EdenEast/nightfox.nvim",
  github "metalelf0/kintsugi-nvim",
}

local function _kanagawa()
  require("kanagawa").setup {
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    colors = {
      theme = {
        all = { ui = { bg_gutter = "none" } },
      },
    },
  }
end

local function _kintsugi()
  require("kintsugi").setup {
    transparent = false,
    terminal_colors = true,
    bold_keywords = true,
    italic_comments = true,
  }
end

M.select = function(colorscheme)
  if string.find(colorscheme, "^kanagawa") then
    _kanagawa()
  elseif string.find(colorscheme, "^kintsugi") then
    _kintsugi()
  end
  vim.cmd.colorscheme(colorscheme)
end

return M
