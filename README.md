VimConfig
=========

###获取配置文件  

	git clone https://github.com/chenfjm/VimPlugins.git
	mv VimConfig ~/.vim
	cd .vim
	git submodule init
	git submodule update   
	cp .vimrc ~

###安装插件  

	gvim
	:PluginInstall   
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

###安装依赖软件  

	apt-get install ctags
	tar xzf pyclewn-1.11.py3.tar.gz
	cd pyclewn-1.11.py3
	python setup.py install --force  


- [pyclewn](http://pyclewn.sourceforge.net/)
