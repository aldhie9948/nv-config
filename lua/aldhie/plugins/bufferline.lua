return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', },
  version = '*',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        mode = "buffer",
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        offsets = {
          {
            filetype = 'NvimTree',
            text = "File Explorer",
            highlights = 'Directory',
            separator = true
          }
        }
      },
      highlights = {
        separator = {
          guifg = '#073642',
          guibg = '#002b36',
        },
        separator_selected = {
          guifg = '#073642',
        },
        background = {
          guifg = '#657b83',
          guibg = '#002b36'
        },
        buffer_selected = {
          guifg = '#fdf6e3',
          gui = "bold",
        },
        fill = {
          guibg = '#073642'
        }
      },
    })

    -- keymap
    local map = vim.keymap.set 
    map('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Go to next buffer'})
    map('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Go to previous buffer'})

  end
}
