-- [Docs](https://cmp.saghen.dev/)

local M = {}

function M.setup()
  local has_blink, blink = pcall(require, "blink.cmp")
  if not has_blink then
    return false
  end

  blink.setup {
    keymap = {
      preset = "none",

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "select_and_accept", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<C-a>"] = { "hide", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "fallback_to_mappings" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    fuzzy = { implementation = "lua" },
    cmdline = { enabled = false },
    completion = {
      menu = { auto_show = true },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      ghost_text = { enabled = true },
    },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
  }

  vim.lsp.config("*", {
    capabilities = blink.get_lsp_capabilities(),
  })

  return true
end

return M
