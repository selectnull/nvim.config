-- see `:help colorscheme`

vim.pack.add {
  "https://github.com/srt0/codescope.nvim",
  "https://github.com/oskarnurm/koda.nvim",
  "https://github.com/vague-theme/vague.nvim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/cocopon/iceberg.vim",
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/metalelf0/kintsugi-nvim",
}

local function _kanagawa()
  local c = require "kanagawa"

  c.setup {
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    colors = {
      theme = {
        all = { ui = { bg_gutter = "none" } },
      },
    },
  }
  vim.cmd.colorscheme "kanagawa-dragon"
end

-- _kanagawa()

vim.cmd.colorscheme "codescope"
