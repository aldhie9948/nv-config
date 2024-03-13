return {
  'famiu/bufdelete.nvim',
  config = function()
    local map = vim.keymap.set 
    map('n', '<leader>x', function() require('bufdelete').bufdelete(0,true) end, { desc = 'Close current buffer tab'})
  end
}
