return {
  'NvChad/nvterm',
  config = function()
    local nvterm = require('nvterm')
    local nvterminal = require('nvterm.terminal')

    nvterm.setup({
      terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
          float = {
            relative = 'editor',
            row = 0.3,
            col = 0.25,
            width = 0.5,
            height = 0.4,
            border = "single",
          },
          horizontal = { location = "rightbelow", split_ratio = .3, },
          vertical = { location = "rightbelow", split_ratio = .5 },
        }
      },
      behavior = {
        autoclose_on_quit = {
          enabled = false,
          confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
      },
    })


    local map = vim.keymap.set 

    -- new terminals
    map("n", "<leader>h", function()
      nvterminal.new 'horizontal'
    end, { desc = "Terminal New horizontal term" })

    map("n", "<leader>v", function()
      nvterminal.new 'vertical'
    end, { desc = "Terminal New vertical window" })

    -- toggleable
    map({ "n", "t" }, "<A-v>", function()
      nvterminal.toggle 'vertical'
    end, { desc = "Terminal Toggleable vertical term" })

    map({ "n", "t" }, "<A-h>", function()
      nvterminal.toggle 'horizontal'
    end, { desc = "Terminal New horizontal term" })

    map({ "n", "t" }, "<A-i>", function()
      nvterminal.toggle 'float'
    end, { desc = "Terminal Toggle Floating term" })

    map("t", "<ESC>", function()
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_close(win, true)
    end, { desc = "Terminal Close term in terminal mode" })

  end
}
