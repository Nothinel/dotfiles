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

-- LaTeX
vim.keymap.set(
  "n",
  "<localleader>uu",
  ':%s/ß/{<Bslash><Bslash>ss}/ge<Enter>:%s/ä/{<Bslash><Bslash>"a}/ge<Enter>:%s/Ä/{<Bslash><Bslash>"A}/ge<Enter>:%s/ö/{<Bslash><Bslash>"o}/ge<Enter>:%s/Ö/{<Bslash><Bslash>"O}/ge<Enter>:%s/ü/{<Bslash><Bslash>"u}/ge<Enter>:%s/Ü/{<Bslash><Bslash>"U}/ge<Enter>',
  { desc = "replace umlauts in LaTeX" }
)
-- EP
vim.keymap.set(
  "n",
  "<localleader>cp",
  ":! cp ExPhyI_WiSe_2025.pdf ../2025/ExPhyI_WiSe_2025_Blatt",
  { desc = "copy current pdf to local year folder" }
)
vim.keymap.set(
  "n",
  "<localleader>ca",
  ":! ./copyall2Nextcloud.sh <Enter>",
  { desc = "EP: sync local with shared folder" }
)
vim.keymap.set(
  "n",
  "<localleader>sy",
  ":%s/INCLUDESOLUTIONSfalse/INCLUDESOLUTIONStrue/<Enter>:update<Enter><C-o>",
  { desc = "EP: include solutions" }
)
vim.keymap.set(
  "n",
  "<localleader>sn",
  ":%s/INCLUDESOLUTIONStrue/INCLUDESOLUTIONSfalse/<Enter>:update<Enter><C-o>",
  { desc = "EP: exclude solutions" }
)
--":%s/<Bslash>(<Bslash><Bslash>SERIE[IVX]<Bslash>+<Bslash>)true/<Bslash>1false/<Enter>:%s/<Bslash>(<Bslash><Bslash>SERIEI<Bslash>)false/<Bslash>1true/<Enter>:update<Enter><C-o>",
vim.keymap.set("n", "<localleader>ss", function()
  local expr = vim.fn.input("roman number of series?: ")
  vim.cmd([[%s/\(\SERIE[IVX]\+\)true/\1false/]])
  vim.cmd(string.format("%%s/\\vSERIE%sfalse/SERIE%strue/", expr, expr))
  vim.cmd("update")
end, { desc = "EP: select series" })
