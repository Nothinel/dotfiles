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
vim.keymap.set("n", "<localleader><Tab>", '<Esc>/<++><CR>"_c4l', { desc = "replace umlauts in LaTeX" })
-- Keymap: run latexindent on the current file
vim.keymap.set("n", "<localleader>lf", function()
  local filename = vim.fn.expand("%:p")
  vim.cmd("silent! write") -- save first
  vim.fn.system({ "latexindent", "-m", "-w", "-c=/home/kr80cora/NextCloud/Dokumente/latex_backups", filename })
  vim.cmd("edit!") -- reload the buffer
  print("Formatted with latexindent")
end, { desc = "Format with latexindent" })

-- EP
local function execute_copy_pdfs()
  vim.cmd("!python copy_pdfs.py")
  print("copied pdfs to cloud folder")
end
vim.keymap.set("n", "<localleader>cp", execute_copy_pdfs, { desc = "copy current pdf to local year folder" })

local function execute_copy_all_to_nextcloud()
  vim.cmd("! ./copyall2Nextcloud.sh |")
  print("copied pdfs to shared cloud folder")
end
vim.keymap.set("n", "<localleader>ca", execute_copy_all_to_nextcloud, { desc = "EP: sync local with shared folder" })

local function include_solutions()
  vim.cmd([[:%s/INCLUDESOLUTIONSfalse/INCLUDESOLUTIONStrue/e]])
  vim.cmd(":update")
  vim.api.nvim_input("<C-o>")
  print("Included solutions")
end
vim.keymap.set("n", "<localleader>sy", include_solutions, { desc = "EP: include solutions" })

local function exclude_solutions()
  vim.cmd([[:%s/INCLUDESOLUTIONStrue/INCLUDESOLUTIONSfalse/e]])
  vim.cmd(":update")
  vim.api.nvim_input("<C-o>")
  print("Excluded solutions")
end
vim.keymap.set("n", "<localleader>sn", exclude_solutions, { desc = "EP: exclude solutions" })

local function publish_solutions()
  vim.cmd([[:%s/PUBLISHSOLUTIONSfalse/PUBLISHSOLUTIONStrue/e]])
  vim.cmd(":update")
  vim.api.nvim_input("<C-o>")
  print("Solutions for publication")
end
vim.keymap.set("n", "<localleader>spy", publish_solutions, { desc = "EP: solutions for publication" })

local function internal_solutions()
  vim.cmd([[:%s/PUBLISHSOLUTIONStrue/PUBLISHSOLUTIONSfalse/e]])
  vim.cmd(":update")
  vim.api.nvim_input("<C-o>")
  print("Solutions for internal use")
end
vim.keymap.set("n", "<localleader>spn", internal_solutions, { desc = "EP: solutions for internal use" })

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
  local line = vim.fn.search(string.format("task\\*\\?{[AEHKLMPWZ]\\+}{%s}", expr))
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

vim.keymap.set("n", "<localleader>ff", function()
  exclude_solutions()
  -- vim.defer_fn(execute_copy_pdfs, 3000)
  vim.defer_fn(function()
    execute_copy_pdfs()
    vim.defer_fn(function()
      include_solutions()
      vim.defer_fn(function()
        execute_copy_pdfs()
      end, 5000)
    end, 1000)
  end, 5000)
end, { desc = "Compile with and without solutions and copy those pdfs to cloud and shared storage" })

-- Markdown
vim.keymap.set("n", "<leader>md", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:r") .. ".pdf"
  local cmd =
    string.format("pandoc %s -o %s --pdf-engine=pdflatex", vim.fn.shellescape(file), vim.fn.shellescape(output))
  vim.fn.system(cmd)
  print("Converted to " .. output)
end, { desc = "Convert Markdown to PDF" })
