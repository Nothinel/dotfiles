vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- tab is 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true -- conver tabs to spaces
vim.opt.autoindent = true
vim.opt.list = true --show trailing whitespace · and tabs as "» "
vim.opt.listchars = { tab = '» ', trail = '·'}

-- vim.opt.ignorecase = true -- ignore case when searching
-- vim.opt.smartcase = true -- except when using capital letters

vim.opt.hlsearch = false -- no highlight of all found cases of last search
vim.opt.incsearch = true -- show found instansces while typing in the search

vim.opt.scrolloff = 5 -- minimum number of lines to keep above and below cursor
vim.opt.sidescrolloff = 5 -- minimum number of columns left or right of cursor

vim.opt.showmode = false

vim.opt.undofile = true

vim.o.confirm = true -- ask if you want to save if closing unsaved

vim.g.have_nerd_font = false

-- bufferline
vim.opt.termguicolors = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})


-- python language servers
--
vim.lsp.config('ruff', {
  cmd = {'ruff', "server"},
  filetypes = {'python', "py"},
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  init_options = {
    settings = {
      -- Ruff language server settings go here
      format = {
        ["quote-style"] = "single"
      }
    }
  }
})
vim.lsp.enable('ruff')

vim.lsp.config('jedi_language_server', {
  cmd = {'jedi-language-server'},
  filetypes = {'python', "py"},
  { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }
})
vim.lsp.enable('jedi_language_server')

-- stuff to install
-- jedi-language-server
-- ruff
-- ripgrep
