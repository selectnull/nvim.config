local gitsigns = require "gitsigns"
gitsigns.setup {
  on_attach = function(bufnr)
    vim.keymap.set("n", "<C-,>", gitsigns.prev_hunk, {})
    vim.keymap.set("n", "<C-.>", gitsigns.next_hunk, {})
  end,
}
