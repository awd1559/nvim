
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase


set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set tabstop=4
set shiftwidth=4
set autoindent
set paste
set incsearch
set hlsearch
set ignorecase
set smartcase

"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler

"mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"让vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC




"colorscheme badwolf     " awesome colorscheme
colorscheme snazzy
syntax enable           " enable syntax processing
set tabstop=4       	" number of visual spaces per TAB
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




"Pathogen
"git clone https://github.com/vim-airline/vim-airline
"git clone https://github.com/connorholyday/vim-snazzy
"git clone https://github.com/Valloric/YouCompleteMe
"git clone https://github.com/majutsushi/tagbar
"git clone https://github.com/lvht/tagbar-markdown
"git clone https://github.com/hushicai/tagbar-javascript.vim
"git clone https://github.com/vim-scripts/taglist.vim
"git clone https://github.com/vim-scripts/mru.vim
"git clone https://github.com/scrooloose/nerdtree
"git clone https://github.com/kien/ctrlp.vim
"git clone https://github.com/mbbill/undotree
"git clone https://github.com/OmniSharp/omnisharp-vim


"vim-plugin
":PlugInstall 
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'
Plug 'hushicai/tagbar-javascript.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/mru.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
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


