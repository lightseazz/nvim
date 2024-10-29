return {
	"echasnovski/mini.files",
	opts = {
		mappings = {
			close = "<esc>",
			go_in = "L",
			go_out = "H",
			go_in_plus = "<CR>",
			go_out_plus = "",
		},
	},
	config = function(_, opts)
		require("mini.files").setup(opts)

		--- Create mapping to show/hide dot-files
		local show_dotfiles = true
		local filter_show = function(fs_entry)
			return true
		end

		local filter_hide = function(fs_entry)
			return not vim.startswith(fs_entry.name, ".")
		end

		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			local new_filter = show_dotfiles and filter_show or filter_hide
			require("mini.files").refresh({ content = { filter = new_filter } })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak left-hand side of mapping to your liking
				vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
			end,
		})

		--- Create mappings to modify target window via split
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local cur_target = MiniFiles.get_explorer_state().target_window
				local new_target = vim.api.nvim_win_call(cur_target, function()
					vim.cmd(direction .. " split")
					return vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target)
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, "<C-s>", "belowright horizontal")
				map_split(buf_id, "<C-v>", "belowright vertical")
			end,
		})
	end,
	keys = {
		{
			"<leader>e",
			":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
			silent = true,
			desc = "open mini files current file",
		},
	},
}
