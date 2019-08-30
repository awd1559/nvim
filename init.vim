"
"
"
"
"
" ==== TEST ====
"set clipboard=unnamed
"let &t_ut=''
"set listchars=tab:▸\ ,trail:▫


" ====== OS ==============
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
	let g:iswindows = 1
else
	let g:islinux = 1
endif


	
" ====
" ==== Auto install for first time use
" ====
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if iswindows && empty(glob('C:\\Users\\Administrator\\AppData\\Local\\nvim\\autoload\\plug.vim'))
	silent !curl -fLo C:\\Users\\Administrator\\AppData\\Local\\nvim\\autoload\\plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================================================
" === Editor Setup ===================================
" ====================================================
set autochdir
set number
syntax on
syntax enable           " enable syntax processing
set cursorline
set norelativenumber
set wrap
set tw=0
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set autoindent
set paste
set ignorecase
set smartcase
set expandtab
set tabstop=4       	" number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set list
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set ttimeoutlen=0
set viewoptions=cursor,folds,slash,unix
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set formatoptions-=tc
set splitright
set splitbelow
set laststatus=2	"总是显示状态栏
set ruler		"显示光标当前位置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set showmatch           " highlight matching [{()}]

"mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"让vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC




set softtabstop=4   	" number of spaces in tab when editing
set expandtab       	" tabs are spaces
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
"每当我打开一个 *.py 文件, python 的缩进文件即 ~/.vim/indent/python.vim 将会被加载
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.


"Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default,  0: 所有折叠都会被关闭; 99 :  折叠总是被打开
set foldnestmax=10      " 10 nested fold max， 防止过多的嵌套折叠
set foldmethod=indent   " fold based on indent level， 基于缩进来折叠




"Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk

  
"Leader Shortcuts
let mapleader=","       " leader is comma


let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>



" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N>:q<CR>



" ===
" === Status bar behaviors
" ===
set noshowmode
set showcmd
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu


" ===
" === Searching options
" ===
exec "nohlsearch"
set ignorecase
set smartcase




" =============================================
" ==== Map ====================================
" =============================================

" Save & quit
map Q :q<CR>
map W :w<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Undo in Insert mode
inoremap <C-u>


" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Duplicate words
map <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Folding
map <silent> <LEADER>o za




" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>u <C-w>k
map <LEADER>e <C-w>j
map <LEADER>n <C-w>h
map <LEADER>i <C-w>l

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map se :set splitbelow<CR>:split<CR>
map sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tn and ti
map tn :-tabnext<CR>
map ti :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>







" ===
" === Install Plugins with Vim-Plug
" ===
"vim-plugin
":PlugInstall 
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'liuchengxu/space-vim-theme'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
"Plug 'w0rp/ale'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-markdown-subscope'

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'
"Plug 'tmhedberg/SimpylFold'
Plug 'mhinz/vim-startify'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
"Plug 'yuttie/comfortable-motion.vim'
Plug 'brooth/far.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'kassio/neoterm'
Plug 'vim-scripts/restore_view.vim'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

call plug#end()


























"YouCompleteMe
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']		   "shift+tab: backward select
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>' ] "tab or enter to select
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>




"tagbar
nmap <F8> :TagbarToggle<CR>
"tagbar-js
"npm install -g esctags




"taglist
"yum install ctags
let Tlist_Ctags_Cmd="/usr/bin/ctags" 	"taglist with ctags"  
let Tlist_Show_One_File=1     			"only show current file's taglist    
let Tlist_Exit_OnlyWindow=1   			"if taglist is the last window, exit vim   
let Tlist_Use_Right_Window=0			"taglist window showup at left by default
let Tlist_Use_SingleClick=1
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=1
let Tlist_GainFocus_On_ToggleOpen=1
"let Tlist_Max_Tag_Length
"let Tlist_WinHeight
"let Tlist_WinWidth  
nnoremap ll :TlistToggle<CR>
"nnoremap :TlistOpen<CR>
"nnoremap :TlistClose<CR>




"mru
let MRU_Window_Height=15
let MRU_Use_Current_Window=1
let MRU_Auto_Close=1
nnoremap  mm :MRU<CR>		"bb open mru window




"NerdTree
let NERDTreeWinPos = "left"
nnoremap tt :NERDTreeToggle<CR>   "normal mode切换
map <C-n> :NERDTreeToggle<CR>      "ctrl-n 随时切换




"CtrlP
let g:ctrlp_map = '<c-p>'		"ctrl+p 触发文件搜索
let g:ctrlp_cmd = 'CtrlP'		"in search file mode

let g:ctrlp_working_path_mode = 'ra'		"search path
"c - directory of current file
"r - nearest that contains one of these dir or files : .git .hg .svn
"a - like c, but only if the current working dir

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows


