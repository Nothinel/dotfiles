-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>uu",
  ':%s/ß/{<Bslash><Bslash>ss}/ge<Enter>:%s/ä/{<Bslash><Bslash>"a}/ge<Enter>:%s/Ä/{<Bslash><Bslash>"A}/ge<Enter>:%s/ö/{<Bslash><Bslash>"o}/ge<Enter>:%s/Ö/{<Bslash><Bslash>"O}/ge<Enter>:%s/ü/{<Bslash><Bslash>"u}/ge<Enter>:%s/Ü/{<Bslash><Bslash>"U}/ge<Enter>'
)
-- noremap <leader>uu :%s/ß/{\\ss}/ge<Enter>:%s/ä/{\\"a}/ge<Enter>:%s/Ä/{\\"A}/ge<Enter>:%s/ö/{\\"o}/ge<Enter>:%s/Ö/{\\"O}/ge<Enter>:%s/ü/{\\"u}/ge<Enter>:%s/Ü/{\\"U}/ge<Enter>
