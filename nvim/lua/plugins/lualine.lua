return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = 'palenight',  -- use the modified theme table
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = { "buffers" },
      lualine_y = { "searchcount", "selectioncount" },
      lualine_z = { "tabs" },
    },
  },
}

