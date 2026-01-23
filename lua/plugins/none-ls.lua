-- https://stackoverflow.com/questions/78108133/issue-with-none-ls-configuration-error-with-eslint-d
-- solution to eslint_d not working. Requires dependcy none-ls.nvim
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {

				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				require("none-ls.code_actions.eslint"),
				require("none-ls.diagnostics.eslint"),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
