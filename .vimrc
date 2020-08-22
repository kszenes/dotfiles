let mapleader=" " "set leader
let maplocalleader=","
silent !echo -e "\e[2 q"
set mouse=a
set nocompatible

" -------------------------  Settings  ---------------------------------------

set relativenumber "enable hybrid numbering
set nu rnu
set nu rnu
set hlsearch "enable highlight
filetype plugin indent on "enable autoindent
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set noswapfile "disable swapfile generation
set incsearch "incremental highlight during search
set ignorecase "sets case insensitive search
set nohlsearch
set smartcase "sets case sensitive seach when capital letter
set noerrorbells "disable errorbells
set nobackup "disables backup file creation
syntax on "enable syntax
set splitbelow splitright "set split view
set wildmode=longest,list,full "enable wildmenu
set wildmenu
set wildignore+=*.gjf,*jpg,*.png,*.pdf
set wildignore+=.DS_Store,.git
set hidden "Closed file remain open in buffer
set ttimeoutlen=50 "Decrease delays
set backspace=indent,eol,start "Enable backspace for erasing line
set cursorline
set showcmd "Show all commands

" ------------------------- Plugins ----------------------------------------

call plug#begin('~/.vim/plugged')
"Plug 'masukomi/vim-markdown-folding'
Plug 'preservim/nerdtree'
"Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
"Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'kiteco/vim-plugin'
"Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'davidhalter/jedi'
"Plug 'davidhalter/jedi-vim'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'godlygeek/tabular'
"Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()

" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction

"inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()

let NERDTreeShowHidden=1 "Show hidden files in NERDTree

let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
set spelllang=en,fr

"Set theme and dark mode
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set bg=dark

"Set max file search for control-p Plugin
let g:ctrlp_max_files=0

"Speed up ctrl-p
let g:ctrlp_use_caching=0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Set ctrl-p directory
let g:ctrlp_working_path_mode = 'c'

" use <c-space>for trigger completion
"inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

let g:kite_tab_complete=1

set cot=menuone,noinsert


let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 1

" Set language to markdown for vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_folding='list'
"-------------------  Remaps  --------------------------------
"Source vimrc
nnoremap <leader>s :so ~/.vimrc<CR>
nnoremap <C-s> :so ~/.vimrc<CR>

"NERDTree shortcut
map <leader>t :NERDTreeToggle<CR>

"New line shortcut
"nnoremap <CR> o<Esc>

"Set split shortcut like vscode
map <leader>\ :vsplit<CR>

"Resize windows
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>


" "Window shortcuts
" noremap <leader>h :wincmd h<CR>
" noremap <leader>j :wincmd j<CR>
" noremap <leader>k :wincmd k<CR>
" noremap <leader>l :wincmd l<CR>

"Move line up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Tab for switching buffers
noremap <tab> :bn<CR> 
noremap <S-tab> :bN<CR>

"Duplicate line
nnoremap <C-J> yyp
nnoremap <C-K> yyP

"Close Window
nnoremap <C-x> :close<CR>

"Remap only window
"nnoremap <silent> <C-w>w :ZoomWin<CR>

"Copy Paste
vnoremap <C-c> :w !pbcopy<CR><CR>
nnoremap <C-p> :r !pbpaste<CR>

" Rmd autocompile with F5
autocmd Filetype markdown map <F5> :!pandoc % -o %:r.pdf --template eisvogel<CR><Enter>:!open %:r.pdf<CR><Enter>
autocmd Filetype rmd map <F5> :!Rscript -e "rmarkdown::render('%')"<CR><Enter>:! open %:r.pdf<CR><Enter>

command! -bang PFiles call fzf#vim#files(['~/Desktop/cnt' '~/scripts'], <bang>0)
command! FZFLib call fzf#run({'source': 'find ~/Desktop ~/scripts -type f', 'sink':  'edit'})

map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>


