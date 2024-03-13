return {
  'MunifTanjim/prettier.nvim',
  dependencies = {
    'jose-elias-alvarez/null-ls.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local prettier = require('prettier')
    prettier.setup {
      bin = 'prettierd',
      filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less"
      }
    }
  end
}
