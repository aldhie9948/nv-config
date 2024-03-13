return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    -- OR setup with some options
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
        }
      },
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        }
      },
      git = {
        ignore = false
      }
    })

    local map = vim.keymap.set 
    map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })
    map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'Focus Nvim Tree'})
  end
}
