-- This file sets up a file manager to be used inside of neovim
--
-- The currently used file manager is *Neo-Tree*

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x', -- there will be no important changes in one branch so nothing should break with an update
  dependencies = {
    'nvim-lua/plenary.nvim', --
    'nvim-tree/nvim-web-devicons', -- not strictly required, but reccomended
    'MunifTanjim/nui.nvim',
  },

  -- configure to open neotree with '<leader>n'
  config = function()
    vim.keymap.set('n', '<leader>n', function()
      local reveal_file = vim.fn.expand '%:p'
      if reveal_file == '' then
        reveal_file = vim.fn.getcwd()
      else
        local f = io.open(reveal_file, 'r')
        if f then
          f.close(f)
        else
          reveal_file = vim.fn.getcwd()
        end
      end

      require('neo-tree.command').execute {
        action = 'focus', -- OPTIONAL, this is the default value
        source = 'filesystem', -- OPTIONAL, this is the default value
        position = 'left', -- OPTIONAL, this is the default value
        reveal_file = reveal_file, -- path to file or folder to reveal
        reveal_force_cwd = true, -- change cwd without asking if needed
      }
    end, { desc = 'Open [N]eoTree in current working directory' })

    -- The next two lines disable the Neovim default file browser netrw
    -- (without netrw will flash before neotree shows up)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        hijack_netrw_behavior = 'open_current',
      },
    }
  end,
}
