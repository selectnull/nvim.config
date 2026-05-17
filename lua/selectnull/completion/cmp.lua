local M = {}

function M.setup()
  local has_cmp, cmp = pcall(require, "cmp")
  local has_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if not has_cmp or not has_cmp_lsp then
    return false
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ["<S-Tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
    },
  }

  vim.lsp.config("*", {
    capabilities = cmp_lsp.default_capabilities(),
  })

  return true
end

return M
