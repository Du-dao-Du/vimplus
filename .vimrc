"Vundle配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar' "vim 类结构查看插件
Plugin 'jiangmiao/auto-pairs' "对括号中的括号等自动插入
Plugin 'vim-airline/vim-airline' "状态栏样式插件
Plugin 'hail2u/vim-css3-syntax' " css3语法检查
Plugin 'gorodinskiy/vim-coloresque' " css3配色
Plugin 'mattn/emmet-vim' "命令行批量输入html标签
Plugin 'pangloss/vim-javascript' "javascript语法
Plugin 'alvan/vim-closetag' "html tag auto close
Plugin 'Yggdroot/indentLine' "缩进对齐
Plugin 'maksimr/vim-jsbeautify' "格式化 前端代码
Plugin 'othree/html5.vim' "html5 语法包
Plugin 'othree/javascript-libraries-syntax.vim' "javascript 语法包 包含angular react vue jquery requireJS 等
Plugin 'sickill/vim-monokai' "vim monokai 主题
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin '1995eaton/vim-better-javascript-completion' "javascript html 内置对象代码提示
Plugin 'tomasr/molokai' "vim 主题
Plugin 'digitaltoad/vim-pug'  "前端语法高亮
"Plugin 'dNitro/vim-pug-complete' "自动生成html标签
Plugin 'posva/vim-vue'  "vue 语法高亮
Plugin 'myhere/vim-nodejs-complete' "nodejs 内置方法提示
"Plugin 'heavenshell/vim-jsdoc' "命令行生成注释
Plugin 'isRuslan/vim-es6' "ES6语法高亮
Plugin 'leshill/vim-json' "json高亮
"Plugin 'rhysd/vim-clang-format' "代码风格
"Plugin 'jelera/vim-javascript-syntax' "javascript 语法检查
"Plugin 'mxw/vim-jsx' "jsx 语法
Plugin 'Valloric/YouCompleteMe' "代码提示 https://github.com/Valloric/YouCompleteMe
"Plugin 'ternjs/tern_for_vim' "node js html 等语法提示
call vundle#end()

if has("gui_running")
    au GUIEnter * simalt ~x " 窗口启动时自动最大化
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    "set showtabline=0 " 隐藏Tab栏
endif

syntax on
"set sw=2
"set ts=2
"set et
"set smarttab " 在行和段开始处使用制表符
"set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set t_Co=256 "256位色"

"--------------------syntastic相关---------------------------------

"检查语法错误
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

"-------------------显示相关---------------------------------------

set cul "高亮光标所在行
set cuc
color molokai     " 设置背景主题  
set guifont=Monaco:h14:b
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=2     " 光标移动到buffer的顶部和底部时保持3行距离  
set laststatus=2   " 启动显示状态行(1),总是显示状态行(2)  
"set foldenable      " 允许折叠  
"set foldmethod=manual   " 手动折叠  
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=2
" 统一缩进为4
set softtabstop=2
set shiftwidth=2
" 使用空格代替制表符
set expandtab

" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=1
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=$,@,%,#,-,_
"快捷键配置----------------------------------------------------------------------------
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"代码格式化插件
noremap <F12> gg=G
"html标签自动补全
map! <C-O> <C-Y>,
"列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"tagbar
nmap <F9> :TagbarToggle<CR>
"实用配置------------------------------------------------------------------------------
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"自动保存
set autowrite
" 去掉输入错误的提示声音
"set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm

"禁止生成临时文件
set noundofile
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"set tags=tags
set autochdir "输出时只有文件名，不带./ ../等目录前缀(默认了执行％在当前的目录下)
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
" Enable omni completion.
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType JavaScript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

let g:NERDTreeShowHidden=1

"把omni补全设置成tab键
let g:SuperTabDefaultCompletionType="<C-X><C-O>" 
"css配色插件---------------------------------------------------------------
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END
let g:cssColorVimDoNotMessMyUpdatetime = 1

"js加强补全----------------------------------------------------------------
let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive
let g:vimjs#smartcomplete = 0
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.
let g:vimjs#chromeapis = 0
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


"--------------------------------------------------------------------闭合html标签
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

let g:syntastic_javascript_checkers = ['eslint']

"自动删除行尾空格
autocmd FileType c,cc,cpp,python,ruby,java,sh,html,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

filetype plugin indent on    " required
