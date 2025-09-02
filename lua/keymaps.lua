local ls = require 'luasnip'

-- Expandir o saltar con <Tab>
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if ls.expand_or_jumpable() then
    return '<Plug>luasnip-expand-or-jump'
  else
    return '<Tab>'
  end
end, { expr = true, silent = true })

-- Retroceder con <S-Tab>
vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if ls.jumpable(-1) then
    return '<Plug>luasnip-jump-prev'
  else
    return '<S-Tab>'
  end
end, { expr = true, silent = true })

-- Seleccionar entre opciones (choice nodes) con Ctrl+E
vim.keymap.set({ 'i', 's' }, '<C-e>', function()
  if ls.choice_active() then
    return '<Plug>luasnip-next-choice'
  else
    return '<C-e>'
  end
end, { expr = true, silent = true })
