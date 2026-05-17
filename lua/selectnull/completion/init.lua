local M = {}

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup", "fuzzy" }
vim.opt.pumheight = 12

local valid_engines = { native = true, blink = true, cmp = true }
local engine = (vim.g.completion_engine or "native"):lower()
if not valid_engines[engine] then
  vim.notify("Unknown completion engine '" .. engine .. "', falling back to 'native'", vim.log.levels.WARN)
  engine = "native"
end

local provider = require("selectnull.completion." .. engine)
if provider.setup and provider.setup() == false then
  vim.notify("Completion engine '" .. engine .. "' is unavailable, falling back to 'native'", vim.log.levels.WARN)
  engine = "native"
  provider = require "selectnull.completion.native"
  provider.setup()
end

M.engine = engine
M.on_lsp_attach = provider.on_lsp_attach or function() end

return M
