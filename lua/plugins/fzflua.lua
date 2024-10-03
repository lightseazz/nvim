return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	opts = {
		winopts = { split = "belowright new" },
	},
	keys = {
		{ "<leader>ff", ':lua require("fzf-lua").files()<CR>', silent = true, desc = "search files" },
		{ "<leader><leader>", ':lua require("fzf-lua").files()<CR>', silent = true, desc = "search files" },
		{ "<leader>fb", ':lua require("fzf-lua").buffers()<CR>', silent = true, desc = "search list buffers" },
		{ "<leader>fk", ':lua require("fzf-lua").keymaps()<CR>', silent = true, desc = "search keymap" },
		{ "<leader>/", ':lua require("fzf-lua").live_grep()<CR>', silent = true, desc = "search live grep" },
		{ "<leader>fr", ':lua require("fzf-lua").resume()<CR>', silent = true, desc = "resume fzf lua" },
		{ "<leader>fw", ':lua require("fzf-lua").grep_cword()<CR>', desc = "Word (Root Dir)" },
		{ "<leader>fw", ':lua require("fzf-lua").grep_visual()<CR>', mode = "v", desc = "Selection (Root Dir)" },
		{ "<leader>fm", ':lua require("fzf-lua").marks()<CR>', silent = true, desc = "search marks" },
	},
}
