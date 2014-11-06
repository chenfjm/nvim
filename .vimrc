
"                                 CHEN                                     "
"                              VIM-PYTHON                                  "
"                                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								插件管理
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/.vim/local'
"call vundle#rc(path)

if filereadable(expand("~/.vim/.vimrc.bundle"))
  	source ~/.vim/.vimrc.bundle
endif

filetype plugin indent on 
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								使用说明
"
"wm   	  : 开启/关闭NerdTree窗口
"gg=G 	  : 自动format代码
"<Ctr+y>, : html简写法
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      	                          主题                                      
"colorscheme github
 colorscheme monokai
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               基本配置
"启动gVIM时最大化
 autocmd GUIEnter * set lines=999 columns=9999
"
"开启语法高亮
 syntax on
"
"自动、智能缩进
 set tabstop=4
 set expandtab
 set shiftwidth=4
 filetype indent on
"中文乱码"
 set fileencodings=utf-8,chinese
"默认展开所有代码
 set foldlevel=99
"显示当前的行号列号：
 set ruler
"显示行号：
 set number
"行宽
 set textwidth=80
"隐藏菜单栏,工具栏和侧边栏
 set guioptions-=m
 set guioptions-=T
 set guioptions-=r
 set guioptions-=L
"启用鼠标
 set mouse=a
"在html标签之间跳转(%)
 runtime macros/matchit.vim 
"高亮搜索单词
 set hlsearch
"在当前目录及子目录下用find打开指定文件
 set path=./**
"proto语法文件
 augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
 augroup end
"启动界面
set shortmess=atI
"Alt 组合键不映射到菜单上
set winaltkeys=no

imap jj <Esc>
imap <C-h> <left>
imap <C-l> <right>
cmap q<CR> qa<CR>

if has("gui_running")
"ubuntu---------------------------------------------------------------------
"配置字体
	set guifont=YaHei\ Consolas\ Hybrid\ 12
"开启气泡提示
	set ballooneval
	set balloondelay=100
"ubuntu---------------------------------------------------------------------
else
"OSX------------------------------------------------------------------------
"删除键
 set backspace=indent,eol,start
"OSX------------------------------------------------------------------------
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   mac os map
if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
map <Esc>OP <F1>
map <Esc>OQ <F2>
map <Esc>OR <F3>
map <Esc>OS <F4>
map <Esc>[16~ <F5>
map <Esc>[17~ <F6>
map <Esc>[18~ <F7>
map <Esc>[19~ <F8>
map <Esc>[20~ <F9>
map <Esc>[21~ <F10>
map <Esc>[23~ <F11>
map <Esc>[24~ <F12>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ctags
"
let Tlist_Ctags_Cmd='/usr/bin/ctags'
 "let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
"用法：$ ctags –R src
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            自动补全
"
"omni 
 let OmniCpp_ShowPrototypeInAbbr = 1
"autocmd FileType python set omnifunc=pythoncomplete#Complete
 autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
 autocmd FileType css set omnifunc=csscomplete#CompleteCSS
 autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
 autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							nerdtree
"
"不显示帮助信息
 let NERDTreeMinimalUI=1
"鼠标点击							 
 let NERDTreeMouseMode = 2
"宽度
let g:NERDTreeWinSize = 32 
"忽略文件、隐藏文件
 let NERDTreeIgnore = ['\.pyc$']
 let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']
 nmap wm :NERDTreeToggle<cr>
"关闭当前窗口
 nmap wc      <C-w>c     
"分割窗口移动快捷键
 nnoremap <c-h> <c-w>h
 nnoremap <c-j> <c-w>j
 nnoremap <c-k> <c-w>k
 nnoremap <c-l> <c-w>l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"									tagbar
"
nmap tb :Tagbar<cr>
let tagbar_ctags_bin='/usr/bin/ctags'
let tagbar_width=32
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1

"autocmd BufWinEnter *.py :TagbarOpen
"autocmd BufWinEnter *.c :TagbarOpen
"autocmd BufWinEnter *.cpp :TagbarOpen
"autocmd BufWinEnter *.js :TagbarOpen
"autocmd BufWinLeave *.py :TagbarClose
"autocmd BufWinLeave *.c :TagbarClose
"autocmd BufWinLeave *.cpp :TagbarClose
"autocmd BufWinLeave *.js :TagbarClose
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"						instant- markdown
"
"依赖：
" $gem install pygments.rb
" $gem install redcarpet
" $npm -g install instant-markdown-d
"
 au BufRead,BufNewFile *.md set filetype=markdown
 let g:instant_markdown_autostart = 0
 nmap <C-p> :InstantMarkdownPreview<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 错误检查
"
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1

"安装flake8: easy_install flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E401,E265,E302,E261,E262,E123,F403,E128'
let g:syntastic_javascript_checkers = ['jshint'] 
"Default: 0
"If enabled, syntastic will do syntax checks when buffers are first loaded as
"well as on saving >
 "let g:syntastic_check_on_open=1

"Default: 0
"Enable this option to tell syntastic to always stick any detected errors into
"the loclist: >
 let g:syntastic_always_populate_loc_list=1

"Default: 2
"When set to 1 the error window will be automatically opened when errors are
"detected, and closed when none are detected. >
 let g:syntastic_auto_loc_list=1

"When set to 2 the error window will be automatically closed when no errors are
"detected, but not opened automatically. >
"let g:syntastic_auto_loc_list=2

"only errors no warnings
 let g:syntastic_quiet_messages={'level': 'warnings'}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"									YouCompleteMe
"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" 关掉补全时的预览窗口
set completeopt=longest,menu                
" 不用每次提示加载.ycm_extra_conf.py文件
let g:ycm_confirm_extra_conf = 0              
" 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 0 

let g:ycm_filetype_whitelist = {'c' : 1, 'cpp' : 1, 'java' : 1, 'python' : 1}
" 评论中也应用补全
let g:ycm_complete_in_comments = 1        
" 两个字开始补全
let g:ycm_min_num_of_chars_for_completion = 2   
" 开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_tags_files=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 关键字补全	
let g:ycm_seed_identifiers_with_syntax = 1
""上下左右键的行为 会显示其他信息
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-k>\<C-j>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-k>\<C-j>" : "\<PageUp>"
"set YouCompleteMe trigger key 
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
"let g:ycm_key_list_previous_completion = ['<Up>']

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	


let g:ycm_key_invoke_completion = '<Enter>'
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}
nnoremap <C-[> :YcmCompleter GoToDeclaration<CR>
nnoremap <C-]> :YcmCompleter GoToDefinition<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"										ultisnips
" Track the engine.
"Bundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Bundle 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"										pyclewn
"
 let g:pyclewn_args="--terminal=TERMINAL --window=bottom"

 autocmd BufRead *.c* map <F5>  :TagbarClose<CR> :Pyclewn<CR> :call StartDebug()<CR> :call StartDebugC()<CR> 
 autocmd BufRead *.py map <F5>  :TagbarClose<CR> :Pyclewn pdb %:p<CR> :call StartDebug()<CR> :call StartDebugPy()<CR>
 autocmd BufRead *.py nmap <F6> :!python %<CR> 
 autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
 autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
 map <F4>  :nbclose<CR> <C-j>wc :call StopDebug()<CR>

 func! StartDebug()
 map <S-b> :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>										
 map <S-e> :exe "Cclear " . expand("%:p") . ":" . line(".")<CR>										
 map <S-u> :exe "Cup "<CR>										
 map <S-d> :exe "Cdown "<CR>										
 map <S-n> :exe "Cnext "<CR>										
 map <S-c> :exe "Ccontinue "<CR>										
 map <S-s> :exe "Cstep "<CR>										
 map <S-f> :exe "Cfinish "<CR>										
 map <S-w> :exe "Cwhere "<CR>	
 map <S-l> :exe "Cinfo locals "<CR>	
 map <S-t> :exe "Cinfo break "<CR>	
 map <S-x> :exe "Cfoldvar " . line(".")<CR>	 
 endfunc

 func! StartDebugC()
     map <S-z> :exe "Csigint "<CR>										
     map <S-a> :exe "Cinfo args "<CR>	
     map <S-r> :exe "Crun "<CR>										
     map <S-p> :exe "Cprint " . expand("<cword>") <CR>
     map <S-q> :exe "Cquit "<CR>										
 endfunc
 func! StartDebugPy()
     map <S-z> :exe "Cinterrupt "<CR>										
     map <S-a> :exe "Cargs "<CR>	
     map <S-r> :exe "Creturn "<CR>	
     map <S-p> :exe "Cp " . expand("<cword>") <CR>
     map <S-q> :exe "Cquit "<CR> <C-j>wc
 endfunc

 func! StopDebug()
 unmap <S-b>
 unmap <S-e>
 unmap <S-u>
 unmap <S-d>
 unmap <S-n>
 unmap <S-c>
 unmap <S-s>
 unmap <S-f>
 unmap <S-w>
 unmap <S-l>
 unmap <S-t>
 unmap <S-x>
 unmap <S-z>
 unmap <S-a>
 unmap <S-r>
 unmap <S-p>
 unmap <S-q>
 endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								DoxygenToolkit
"
let g:DoxygenToolkit_authorName="chenfjm@gmail.com"
let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
map <C-a> :DoxAuthor<CR>
map <C-s> :Dox<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

