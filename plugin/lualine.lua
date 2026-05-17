require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "branch" },
    lualine_b = { { "filename", path = 1 } },
    lualine_c = {},
    lualine_x = {
      "encoding",
      "filetype",
      {
        "fileformat",
        symbols = {
          unix = "", -- e712
          dos = "", -- e70f
          mac = "", -- e711
        },
      },
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
}
