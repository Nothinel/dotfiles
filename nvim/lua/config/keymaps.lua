-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- commands for switching buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["*y]])

-- LaTeX replace Umlaut
vim.keymap.set(
  "n",
  "<leader>uu",
  ':%s/ß/{<Bslash><Bslash>ss}/ge<Enter>:%s/ä/{<Bslash><Bslash>"a}/ge<Enter>:%s/Ä/{<Bslash><Bslash>"A}/ge<Enter>:%s/ö/{<Bslash><Bslash>"o}/ge<Enter>:%s/Ö/{<Bslash><Bslash>"O}/ge<Enter>:%s/ü/{<Bslash><Bslash>"u}/ge<Enter>:%s/Ü/{<Bslash><Bslash>"U}/ge<Enter>'
)
