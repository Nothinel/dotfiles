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
  ':%s/ß/{<Bslash><Bslash>ss}/Ige<Enter>:%s/ä/{<Bslash><Bslash>"a}/Ige<Enter>:%s/Ä/{<Bslash><Bslash>"A}/Ige<Enter>:%s/ö/{<Bslash><Bslash>"o}/Ige<Enter>:%s/Ö/{<Bslash><Bslash>"O}/Ige<Enter>:%s/ü/{<Bslash><Bslash>"u}/Ige<Enter>:%s/Ü/{<Bslash><Bslash>"U}/Ige<Enter>',
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
vim.keymap.set("n", "<localleader>ss", function()
  local expr = vim.fn.input("roman number of series?: ")
  local cursorpos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[%s/\(\SERIE[IVX]\+\)true/\1false/]])
  vim.cmd(string.format("%%s/\\vSERIE%sfalse/SERIE%strue/", expr, expr))
  vim.api.nvim_win_set_cursor(0, cursorpos)
  vim.cmd("update")
end, { desc = "EP: select series" })

vim.keymap.set("n", "<localleader>so", function()
  local expr = vim.fn.input("which task number?")
  local line = vim.fn.search(string.format("task\\*\\?{[MZAWLEK]\\+}{%s}", expr))
  if line == 0 then
    print("did not find task")
    return
  end
  local linetext = vim.fn.getline(line)
  local path, filename = linetext:match(string.format("{%s}{.-}{%%s*([^}]+)%%s*}{%%s*([^}]+)%%s*}", expr))
  if not path or not filename then
    print("unable to extract filename or path from line")
    return
  end
  local fullpath = string.format("%s/%s.tex", path, filename)
  vim.cmd("edit " .. fullpath)
end, { desc = "EP: open task", silent = true })

-- Keymap: run latexindent on the current file
vim.keymap.set("n", "<localleader>lf", function()
  local filename = vim.fn.expand("%:p")
  vim.cmd("silent! write") -- save first
  vim.fn.system({ "latexindent", "-m", "-w", "-c=/home/kr80cora/NextCloud/Dokumente/latex_backups", filename })
  vim.cmd("edit!") -- reload the buffer
  print("Formatted with latexindent")
end, { desc = "Format with latexindent" })
