return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      --vim.o.background = 'light'
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_float_style = 'blend'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'sainnhe/everforest',
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      --vim.o.background = 'light'
      vim.g.everforest_background = 'hard'
      vim.g.everforest_transparent_background = 0
      vim.g.everforest_better_performance = 1
      vim.g.everforest_float_style = 'blend'
      vim.cmd.colorscheme 'everforest'
    end,
  },
}
