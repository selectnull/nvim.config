local M = {}

function M.setup()
  return true
end

function M.on_lsp_attach(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if not client or not client:supports_method "textDocument/completion" then
    return
  end

  vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

  vim.keymap.set("i", "<CR>", function()
    if vim.fn.pumvisible() == 1 then
      return "<C-y>"
    end
    return "<CR>"
  end, { buffer = ev.buf, expr = true, silent = true })

  vim.keymap.set("i", "<Tab>", function()
    if vim.fn.pumvisible() == 1 then
      return "<C-n>"
    end
    return "<Tab>"
  end, { buffer = ev.buf, expr = true, silent = true })

  vim.keymap.set("i", "<S-Tab>", function()
    if vim.fn.pumvisible() == 1 then
      return "<C-p>"
    end
    return "<S-Tab>"
  end, { buffer = ev.buf, expr = true, silent = true })
end

return M
