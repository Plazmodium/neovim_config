return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions (using leader g instead of leader h)
				map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage Hunk" })
				map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset Hunk" })
				map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage Buffer" })
				map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
				map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset Buffer" })
				map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview Hunk" })
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame Line" })
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Line Blame" })
				map("n", "<leader>gd", gs.diffthis, { desc = "Diff This" })
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, { desc = "Diff This ~" })
				map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle Deleted" })

				-- Text object
				map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
