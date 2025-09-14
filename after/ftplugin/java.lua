local jdtls = require 'jdtls'

-- Detecta la raíz del proyecto
local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
  return
end

-- Workspace único por proyecto
local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls/workspace/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local config = {
  cmd = {
    vim.fn.stdpath 'data' .. '/mason/packages/jdtls/bin/jdtls',
    '-configuration',
    vim.fn.stdpath 'cache' .. '/jdtls/config',
    '-data',
    workspace_dir,
  },
  root_dir = root_dir,
}

jdtls.start_or_attach(config)
