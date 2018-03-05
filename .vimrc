set nocompatible              " be ViMproved, required
" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

filetype off
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'SirVer/ultisnips'                 " snippets
Plug 'Valloric/MatchTagAlways'          " keeps alt tag/bracket highlighted
Plug 'altercation/vim-colors-solarized' " color scheme
Plug 'christoomey/vim-tmux-navigator'   " tmux integration
Plug 'honza/vim-snippets'               " snippet library
Plug 'ctrlpvim/ctrlp.vim'               " fuzzy file mover
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdcommenter'         " fast language-agnostic commenting
Plug 'scrooloose/nerdtree'              " file explorer
Plug 'scrooloose/syntastic'             " Syntax highlighting
Plug 'tpope/vim-fugitive'               " git integration
Plug 'tpope/vim-repeat'                 " git integration
Plug 'tpope/vim-sensible'               " sensible defaults
Plug 'tpope/vim-surround'               " Surrounds selections
Plug 'airblade/vim-gitgutter'           " show git changes in gutter
Plug 'Xuyuanp/nerdtree-git-plugin'      " shows git changes in NERDTree
Plug 'itchyny/lightline.vim'            " lightweight statusbar
Plug 'wellle/targets.vim'               " More types of text objects

" Google Plugins - Since I got too used to them while working at Google
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Glaive, which is used to configure codefmt's maktaba flags.
Plug 'google/vim-glaive'

" Source custom plugin setup
if filereadable(expand('$HOME/.vim-custom-plugins.vim'))
  source ~/.vim-custom-plugins.vim
endif

call plug#end()              " required

" Install Google Plugins
call glaive#Install()        " required
filetype plugin indent on    " required

" -----------------------------------------------------------------------------
" Global Settings
" -----------------------------------------------------------------------------
let mapleader=','            " Set <leader> to ,
let g:mapleader=','
set autoread                 " Auto-reload changes from outside vim
syntax on                    " Turn syntax highlighting on
set relativenumber number    " Show line numbers
set history=1000             " Keep a longer command history
set t_Co=256                 " Use 256 Colors
set term=$TERM               " Set the terminal used
set noerrorbells             " Disable error sounds
set visualbell               " Show errors visually instead
set shell=/bin/bash          " Set all shell executions to run in bash
set laststatus=2              " Always show statusline

set autochdir

" Save all temporary files to a defined location: ~/.vim-tmp
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

let g:airline_powerline_fonts = 1
" Colorscheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set colorcolumn=+1

" -----------------------------------------------------------------------------
" Search Options
" -----------------------------------------------------------------------------
set hlsearch                 " Highlight search results
set ignorecase               " Ignore case in searches...
set smartcase                " ...only if there is a capital in the search

" -----------------------------------------------------------------------------
" Formatting Options
" -----------------------------------------------------------------------------
set tabstop=2     " Width of a <TAB> is set to 2 spaces. Stil is a <TAB>
set shiftwidth=2  " Indents will have a width of 2
set expandtab     " In insert mode, expands <TAB> into spaces
set smarttab      " Tab to the next tabstop

set autoindent    " Copy indent level when adding new lines
set smartindent   " Automatically add indent when adding new code blocks

set linebreak     " Visually wrap lines at convinent locations

set textwidth=80  " Automatically wrap lines at 80 characters

" -----------------------------------------------------------------------------
" Folding Settings
" -----------------------------------------------------------------------------
set foldmethod=indent " Fold on indent
set foldlevel=99      " Maximize folding capacity

" -----------------------------------------------------------------------------
" Plugin Global Settings
" -----------------------------------------------------------------------------
" Let NERDTree Show Hidden Files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\.meta$']

" Enable codefmt default mappings
Glaive codefmt plugin[mappings]

" -----------------------------------------------------------------------------
" Command Mappings
" -----------------------------------------------------------------------------
" Map ; to : to save the need to hold shift. Not like ; does much anyway
nnoremap ; :
" By default, it looks up man pages for the word under the cursor, which isn't
" very useful, so we map it to something else.
nn <s-k> <CR>
" Save all
nn <leader>s :wa<CR>
" Exit all
nn <leader>q :qa!<CR>
" Toggle quickfix window when there is something to look at
nn <leader>c :cw<CR>
" Disable find highlighting
nn <leader>h :noh<CR>
" Toggle paste shortcut
nn <leader>p :set invpaste paste?<CR>

" -----------------------------------------------------------------------------
" Navigation Mappings
" -----------------------------------------------------------------------------
" Disable arrow keys
nn <down> <NOP>
nn <up> <NOP>
nn <left> <NOP>
nn <right> <NOP>

" Pane Navigation Simplifcation
nn <C-h> <C-w>h
nn <C-l> <C-w>l
nn <C-j> <C-w>j
nn <C-k> <C-w>k

" Simplified Tab Operations
nn <C-Tab> gt
nn <C-S-Tab> gT

" Use H and L to jump to beginning/end of line
nn H ^
nn L g_

" Select line with vv
nn vv ^vg_

" tab to match
nn <tab> %

nn <leader>pp "+p

" Center on search results
nn n nzzzv
nn N Nzzzv
nn * *zzzv
nn # #zzzv
nn g* g*zzzv
nn g# g#zzzv

" -----------------------------------------------------------------------------
" Editing Mappings
" -----------------------------------------------------------------------------
" Let K be the opposite of J: split lines instead of joining them
nn K i<CR><Esc>

" Fast replace the word under the cursor
nn <leader>rr :%s/\<C-r><C-w>\>/

" -----------------------------------------------------------------------------
" Plugin Mappings
" -----------------------------------------------------------------------------
" NERDTree Shortcut
no <leader>n :NERDTreeToggle<CR>

no <leader>e :Errors<CR>
no <leader>fc :FormatCode<CR>

" Git Bindings
no <leader>gs :Gstatus<CR>
no <leader>gc :Gcommit<CR>
no <leader>gd :Gvdiff<CR>

let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" ----------------------------------------------------------------------------
" Auto Commands
" ----------------------------------------------------------------------------
" Auto reload vimrc when editing it
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Automatically change the working path to the path of the current file
"autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Load machine specific customization
if filereadable(expand('$HOME/.vim-custom.vim'))
  source ~/.vim-custom.vim
endif
