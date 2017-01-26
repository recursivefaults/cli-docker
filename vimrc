" An example for a vimrc file.  "
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set laststatus=2
set relativenumber
set undofile
set autoindent
set incsearch		" do incremental searching
" Set tabbing preferences
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Cursor customization
set guicursor=a:blinkon0

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch g highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  g on
"  set hlsearch
"endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"if !exists(":DiffOrig")
"  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"		  \ | wincmd p | diffthis
"endif
set modelines=0
call pathogen#infect()
syntax on
filetype plugin indent on
colorscheme jellybeans
"Long line handling
set wrap
set textwidth=119
set formatoptions=qrn1
"Autosave
"set FocusLost * :wa
set colorcolumn=120

"Split management
set winwidth=120
set winminwidth=40

"Backups
set backupdir=~/.vim_swp
set undodir=~/.vim_swp
set dir=~/.vim_swp

"Mappings
let mapleader = ","
"Save a file with esc esc
nnoremap <ESC><ESC> :w<CR>
"Turn off Hilighting
nnoremap <leader><space> :noh<cr>
"Buffer menu
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>q :CtrlP<CR>
nnoremap <leader>t :call RunCurrentSpecFile()<cr>
nnoremap <leader>a :call RunAllSpecs()<cr>
nnoremap <leader>w <C-w>
nnoremap <tab> %
vnoremap <tab> %

"CtrlP Settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|d|o)$',
  \ }
