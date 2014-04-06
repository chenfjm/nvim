""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                          "
"                                 CHEN                                     "
"                              VIM-PYTHON                                  "
"                                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"			       				 插件管理
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

if filereadable(expand("~/.vim/.vimrc.bundle"))
  source ~/.vim/.vimrc.bundle
  source ~/.vim/.vimrc.bundle.local
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
"			   				     使用说明
"
"wm   	  : 开启/关闭winmanager、taglist窗口
"gg=G 	  : 自动format代码
"<Ctr+y>, : html简写法
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      	                          主题                                      
"colorscheme github                                                     
 colorscheme Monokai-Refined
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               基本配置
"启动gVIM时最大化
 autocmd GUIEnter * winpos 0 0 | set lines=999 columns=9999
"
"开启语法高亮
 syntax on
"
"自动、智能缩进
 set tabstop=4
 set shiftwidth=4
 filetype indent on
"中文乱码"
 set fileencodings=utf-8,chinese
"默认展开所有代码
 set foldlevel=99
"显示当前的行号列号：
 set ruler
"在状态栏显示正在输入的命令
 set showcmd
"显示行号：
 set number
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ctags
"
 let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
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
"							snipMate块补全
"
 let g:acp_behaviorSnipmateLength = 1
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Taglist
"
"不同时显示多个文件的tag，只显示当前文件的
 let Tlist_Show_One_File = 1 
"如果taglist窗口是最后一个窗口，则退出vim
 let Tlist_Exit_OnlyWindow = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							 nerdtree
"
"鼠标点击							 
 let NERDTreeMouseMode = 2
"隐藏pyc文件
 let NERDTreeIgnore = ['\.pyc$']
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           winmanager
"
let g:winManagerWindowLayout='NERDTree|TagList'
 nmap wm :WMToggle<cr>
"关闭当前窗口
 nmap wc      <C-w>c     
"分割窗口移动快捷键
 nnoremap <c-h> <c-w>h
 nnoremap <c-j> <c-w>j
 nnoremap <c-k> <c-w>k
 nnoremap <c-l> <c-w>l
"设置宽度
 let g:winManagerWidth = 35
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               F5 执行文件  
 autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
 autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

 autocmd BufRead *.py nmap <F5> :!python %<CR>
 autocmd BufRead *.js nmap <F5> :!node %<CR>
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 错误检查
"
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_javascript_checkers = ['jshint']
" 
"Default: 0
"If enabled, syntastic will do syntax checks when buffers are first loaded as
"well as on saving >
 let g:syntastic_check_on_open=1

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
