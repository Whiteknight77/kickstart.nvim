-- This file configures the texpresso plugin

return {
  'let-def/texpresso.vim',
  config = function()
    require 'texpresso'
  end,
  vim.keymap.set('n', '<leader>Tt', ':TeXpresso %<Return>', { desc = 'Open [T]expresso' }),
  vim.keymap.set('n', '<leader>TT', ':TeXpresso %<Return>', { desc = 'Open [T]expresso' }),
  vim.keymap.set({ 'n', 'v' }, '<C-t>', ':TeXpresso %<Return>', { desc = 'Open [T]expresso' }),
}
