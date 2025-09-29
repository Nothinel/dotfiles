vim.g.mapleader = " "
vim.g.maplocalleader = "ö"
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- commands for switching buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>Y", [["*y]])
vim.keymap.set({"n", "v"}, "<localleader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<localleader>P", [["*p]])

-- latex vimtex
vim.keymap.set("n", "<localleader>uu", ':%s/ß/{<Bslash><Bslash>ss}/ge<Enter>:%s/ä/{<Bslash><Bslash>"a}/ge<Enter>:%s/Ä/{<Bslash><Bslash>"A}/ge<Enter>:%s/ö/{<Bslash><Bslash>"o}/ge<Enter>:%s/Ö/{<Bslash><Bslash>"O}/ge<Enter>:%s/ü/{<Bslash><Bslash>"u}/ge<Enter>:%s/Ü/{<Bslash><Bslash>"U}/ge<Enter>')
-- noremap <leader>uu :%s/ß/{\\ss}/ge<Enter>:%s/ä/{\\"a}/ge<Enter>:%s/Ä/{\\"A}/ge<Enter>:%s/ö/{\\"o}/ge<Enter>:%s/Ö/{\\"O}/ge<Enter>:%s/ü/{\\"u}/ge<Enter>:%s/Ü/{\\"U}/ge<Enter>

