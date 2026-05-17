local config = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    suffix = "",
  },
}
vim.diagnostic.config(config)

local completion = require "selectnull.completion"

-- Improve LSPs UI
local icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕 ",
  Interface = " ",
  Keyword = " ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

local completion_kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(completion_kinds) do
  completion_kinds[i] = icons[kind] and icons[kind] .. kind or kind
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("selectnull-lsp-attach", { clear = true }),
  callback = function(ev)
    completion.on_lsp_attach(ev)

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "grr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "gri", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, {})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<C-l>h", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    end, {})

    vim.keymap.set("n", "<C-l><C-l>", vim.diagnostic.open_float, {})
    vim.keymap.set("n", "<C-l>l", vim.diagnostic.open_float, {})
    vim.keymap.set("n", "<C-l><C-p>", vim.diagnostic.goto_prev, {})
    vim.keymap.set("n", "<C-l>p", vim.diagnostic.goto_prev, {})
    vim.keymap.set("n", "<C-l><C-n>", vim.diagnostic.goto_next, {})
    vim.keymap.set("n", "<C-l>n", vim.diagnostic.goto_next, {})

    vim.keymap.set(
      "n",
      "<C-l>rr",
      (function()
        return function()
          vim.lsp.stop_client(vim.lsp.get_active_clients())
          if vim.bo.modified then
            print "Stopping LSP. Reload the buffer to restart it."
          else
            print "Restarting LSP and reloading the buffer."
            vim.cmd "edit!"
          end
        end
      end)(),
      {}
    )
  end,
})

vim.lsp.enable { "pyright", "lua_ls", "tsgo", "bashls", "html", "clangd" }
