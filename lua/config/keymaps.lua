vim.keymap.set({ "n", "v" }, "<M-h>", "_", { noremap = false })
vim.keymap.set({ "n", "v" }, "<M-l>", "$", { noremap = false })
vim.keymap.set({ "n", "x" }, "<leader>p", [["0p]], { desc = "paste from yank register" })
