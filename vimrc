let mapleader ="ö"
noremap <leader>y "*y
noremap <leader>y "*y
noremap <leader>y "*y
noremap <leader>y "*y
noremap <leader>y "*y

"Use Clipboard
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+Y
noremap <leader>P "+P

"mache unechte Zeilenumbrücke sichtbar, bei langen Zeilen
set breakindent
set showbreak=...

"Zeilennummern
set number
set relativenumber

"Cursor Zeile markieren
set cursorline

"Begrenze Zeilen auf 80 Zeichen
autocmd FileType tex set textwidth=80
autocmd BufRead,BufNewFile *.txt set textwidth=80
autocmd BufRead,BufNewFile *.py set textwidth=80
"highlight ColorColumn ctermbg=green
"Highlight Every Char beyond 80 with red
autocmd BufRead,BufNewFile *.txt :match ErrorMsg '\%>80v.\+'
autocmd BufRead,BufNewFile *.py :match ErrorMsg '\%>80v.\+'
autocmd BufRead,BufNewFile *.tex :match ErrorMsg '\%>80v.\+'
"set colorcolumn=80

" remove unwanted trailing whitespaces in the whole file
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"Autoindent newline the same as the one before
"set autoindent
"Do it smarter than above
set smartindent

"Set german and English as languages for Spellchecking
"set spell
set spelllang=en,de

"Python syntax or else
syntax on
filetype indent plugin on

"Spellchecking for .tex docs
autocmd FileType tex setlocal spell spelllang=en_us
"Spellchecking for .txt files
autocmd BufRead,BufNewFile *.txt setlocal spell


"Get rid of folding
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

"Set Tab and Shiftwidth to 4 spaces (tab)
set ts=4 sw=4

" Execute current script by pressing F9
nnoremap <F9> :w<Enter>:!%:p<Enter><Enter>

" Kommentiere Blöcke Comment Blocks
vnoremap <leader>%% :s/^%//<Enter>:noh<Enter>
vnoremap <leader>% :s/^/%/<Enter>:noh<Enter>

vnoremap <leader>## :s/^#//<Enter>:noh<Enter>
vnoremap <leader># :s/^/#/<Enter>:noh<Enter>

" Make brackets and quotes easier by opening them and closing and jumpint on
" double open
inoremap "" ""<++><Esc>4hi
inoremap (( ()<++><Esc>4hi
inoremap [[ []<++><Esc>4hi
inoremap {{ {}<++><Esc>4hi
inoremap '' ''<++><Esc>4hi

" jump to next empty line
noremap <leader><Space><Space> /^$<Enter>

 " Input Angstrom angstrom Angström angström
inoremap <leader><leader>AA Å

" Highlight all search pattern matches 
set hlsearch

" Show search results while typing
set incsearch

colo industry
" For Autocompletition with TAB install vim-supertab via pacman 
set guifont=Hack:h11

