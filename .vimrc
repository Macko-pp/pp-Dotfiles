imap <F9> <Esc>:w<CR>:!clear<CR><CR>:!node %<CR><CR>:!clear<CR>
imap <F7> <Esc>:wq<CR>
imap <F8> <Esc>:w<CR>
imap <F3> <Esc>:NERDTree<CR>

set number
set title
set showmatch
set ruler
set ignorecase
set hlsearch
set encoding=utf-8
set termencoding=utf-8
set nobackup
set wmnu

set t_Co=256

set autoindent
set smartindent
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cursorline

set updatetime=100

set laststatus=2

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 16
let g:onedark_terminal_italics = 1

let g:lightline = {
    \ 'colorscheme': 'one',
    \ }

let g:airline_theme='onedark'

let g:one_allow_italics = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd"))
  augroup colorset
    autocmd!
    let s:cursor_grey = { "gui": "#2C323C", "cterm": "236", "cterm16": "0" } " Tweak to personal taste
    autocmd ColorScheme * call onedark#set_highlight("CursorLine", { "bg": s:cursor_grey })
  augroup END
endif

set termguicolors

syntax on
colorscheme onedark

"colorscheme one
"set background=dark

