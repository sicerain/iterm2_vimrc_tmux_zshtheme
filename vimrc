call plug#begin('~/.vim/plugged')

"C++自动补全
Plug 'ycm-core/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 两个字符后自动补全"
let g:ycm_min_num_identifier_candidate_chars = 2
" 回车自动补全不换行
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 跳转到定义处
nnoremap <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" 全异步自动补全"
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \   'cs,lua,javascript': ['re!\w{2}'],
  \   }
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ }

let ycm_show_diagnostics_ui = 0  " 禁用YCM自带语法检查(使用ale)

"C++语法检查
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
nmap <leader>e :Errors<cr> " 开启error底栏
nmap <leader>l :lclose<cr> " 关闭error底栏
nmap <leader>r :SyntasticReset<cr> " 清除error检查
nmap <leader>c :SyntasticCheck<cr> " 打开error检查

"C++ tag跳转
Plug 'ludovicchabant/vim-gutentags'
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_define_advanced_commands = 1

"显示tags list
Plug 'vim-scripts/taglist.vim'
" ctags 配置:F3快捷键显示程序中的各种tags，包括变量和函数等。
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=25

"C++ 语法高亮
Plug 'octol/vim-cpp-enhanced-highlight'

"vim-airline
Plug 'vim-airline/vim-airline'
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
"let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射关闭buffer的键位
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"vim-airline-themes
Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme='solarized'
let g:airline_theme='minimalist'

"solarized8 vim主题插件
""Plug 'lifepillar/vim-solarized8'
""let g:solarized_termtrans=0
""let g:solarized_statusline="flat"
""let g:solarized_diffmode="high"
""let g:solarized_visibility="high"
""let g:solarized_extra_hi_groups=1

"python自动补全插件
Plug 'davidhalter/jedi-vim'

"python缩进脚本
Plug 'Yggdroot/indentLine' 
let g:indentLine_enabled = 0
let g:indentLine_defaultGroup = 'SpecialKey'
nmap <leader>L :IndentLinesToggle<cr>


"目录树插件
Plug 'preservim/nerdtree'
" NERDTree 配置:F2快捷键显示当前目录树
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25 
call plug#end()

" 打开文件类型检测, 加了这句才可以用智能补全
filetype plugin indent on

" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
	" 如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "#!/bin/bash")
        return
	endif
    call setline(1, "/**")
    call append(line("."), "* @file ".expand("%"))
    call append(line(".")+1, "* @author sunbingyu(sunbingyu@baidu.com)")
    call append(line(".")+2, "* @data ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+3, "* @version $Revision$")
    call append(line(".")+4, "* @brief")
    call append(line(".")+5, "*")
    call append(line(".")+6, "**/")
	" 新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
 
"""""""""
"键盘命令
"""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

"""""""""""
" vim 配置
"""""""""""
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
" 共享剪贴板  
set clipboard=unnamed 
" 从不备份  
set nobackup
" make 运行
:set makeprg=g++\ -Wall\ \ %
" 自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
syntax enable
set background=dark
"colorscheme solarized8_low
colorscheme sonokai
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
" 禁止生成临时文件
set nobackup
set noswapfile
" 搜索忽略大小写
set ignorecase
" 搜索逐字符高亮
set hlsearch
set incsearch
" 行内替换
set gdefault
" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
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
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
 au BufRead,BufNewFile *  setfiletype txt
" 行列高亮
set cursorcolumn
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black guibg=NONE guifg=NONE
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
" :inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endfunction
set completeopt=longest,menu 
