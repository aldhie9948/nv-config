return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { { "prettierd", "prettier" } },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
				async = false,
			},
		})

		local keymap = vim.keymap
		keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 500,
				async = false,
			})
		end, { desc = "Format in file or range (in visual mode)" })
	end,
}
