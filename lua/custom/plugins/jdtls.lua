-- ==========================================
-- Configuración de JDTLS para Java (Mason + nvim-jdtls)
-- ==========================================

local jdtls = require 'jdtls'
local home = os.getenv 'HOME'

-- Ruta al paquete de jdtls instalado por Mason
local mason_path = home .. '/.local/share/nvim/mason/packages/jdtls'

-- Workspace separado por proyecto
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.local/share/eclipse/' .. project_name

-- Detecta el root del proyecto o usa el cwd si no encuentra nada
local root_dir = require('jdtls.setup').find_root {
  '.git',
  'mvnw',
  'gradlew',
  'pom.xml',
  'build.gradle',
  '.project',
} or vim.fn.getcwd()

-- Comando para ejecutar jdtls
local cmd = {
  mason_path .. '/bin/jdtls',
  '-configuration',
  mason_path .. '/config_linux',
  '-data',
  workspace_dir,
}

-- Configuración base
local config = {
  cmd = cmd,
  root_dir = root_dir,
  settings = {
    java = {},
  },
  init_options = {
    bundles = {},
  },
}

-- Inicia o adjunta el servidor
jdtls.start_or_attach(config)

-- ==========================================
-- Keymaps opcionales para desarrollo Java
-- ==========================================
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>oi', jdtls.organize_imports, opts)
vim.keymap.set('n', '<leader>ev', jdtls.extract_variable, opts)
vim.keymap.set('v', '<leader>em', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
vim.keymap.set('n', '<leader>tc', jdtls.test_class, opts)
vim.keymap.set('n', '<leader>tm', jdtls.test_nearest_method, opts)
