return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    local function telescope_buffer_dir()
      return vim.fn.expand('%:p:h')
    end

    local fb_actions = require "telescope".extensions.file_browser.actions

    telescope.setup ({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close
          },
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          theme = 'dropdown',
          -- disable netrw and use telescope-file-browser in its place
          hijack_netrw = true, 
          mappings = {
            ['i'] = {
              ["<C-w>"] = function() vim.cmd('normal vbd') end,
            },
            ['n'] = {
              -- your custom normal mode mappings
              ['N'] = fb_actions.create,
              ['h'] = fb_actions.goto_parent_dir, 
              ['/'] = function() vim.cmd('startinsert') end,
            }
          }
        }
      }
    }
  )

    telescope.load_extension('file_browser')

    vim.keymap.set("n", "sf", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 }
      })
    end)


        -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })


  end
}
