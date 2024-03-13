return {
  'neovim/nvim-lspconfig',
  config = function()
    local nvim_lsp = require('lspconfig')
    local protocol = require('vim.lsp.protocol')
    local capabilities = protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    local on_attach = function(client, bufnr)
      -- format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
      end
    end

    -- TypeScript
    nvim_lsp.tsserver.setup {
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      cmd = { "typescript-language-server", "--stdio" }
    }

    -- Cssls
    nvim_lsp.cssls.setup {
      capabilities = capabilities,
    }
  end
}
