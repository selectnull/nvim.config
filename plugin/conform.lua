require("conform").setup {
  notify_on_error = false,
  stop_after_first = true,
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    swift = { "swift_format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
  },
}
