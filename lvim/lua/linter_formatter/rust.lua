-- local formatters = require("lvim.lsp.null-ls.linters")
-- formatters.setup({
-- 	{
-- 		exe = "rustfmt",
-- 		filetypes = { "rust" },
-- 	},
-- })

-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
-- 	{
-- 		exe = "rust_analyser",
-- 		filetypes = { "rust" },
-- 	},
-- })

vim.list_extend(lvim.lsp.override, { "rust_analyzer" })
lvim.plugins = {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({
				tools = {
					autoSetHints = true,
					hover_with_actions = true,
					runnables = {
						use_telescope = true,
					},
				},
				server = {
					cmd = { vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer" },
					on_attach = require("lvim.lsp").common_on_attach,
					on_init = require("lvim.lsp").common_on_init,
				},
			})
		end,
		ft = { "rust", "rs" },
	},
}
