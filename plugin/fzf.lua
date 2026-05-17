local fzf = function()
  return require "fzf-lua"
end

local search_args = { "grep", "current_word_grep", "resume_grep" }

local search_actions = {
  grep = function()
    fzf().live_grep_native()
  end,
  current_word_grep = function()
    fzf().grep_cword()
  end,
  resume_grep = function()
    fzf().live_grep { resume = true }
  end,
}

local fsearch_command = function(command_opts)
  local action = search_actions[command_opts.args]
  if not action then
    vim.notify(string.format("Unknown search option: %s", command_opts.args), vim.log.levels.ERROR)
    return
  end

  action()
end

local fsearch_options = {
  nargs = 1,
  complete = function(arg_lead)
    return vim.tbl_filter(function(option)
      return option:find("^" .. vim.pesc(arg_lead)) ~= nil
    end, search_args)
  end,
}

vim.api.nvim_create_user_command("FSearch", fsearch_command, fsearch_options)

-- keybinds
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-p>", function()
  fzf().files()
end, opts)
vim.keymap.set("n", "<leader><tab>", function()
  fzf().buffers()
end, opts)
vim.keymap.set("n", "<M-p>", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes(":FSearch ", true, false, true))
end, opts)
