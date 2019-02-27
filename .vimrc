"###########         Vundle                 ###############"
"Vundle is short for Vim bundle and is a Vim plugin manager."
" see https://github.com/VundleVim/Vundle.vim#about "

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'scrooloose/nerdtree'
 Plugin 'Xuyuanp/nerdtree-git-plugin'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"#########          YouCompleteMe            ################"
" YouCompleteMe
" Python Semantic Completion
let g:ycm_python_binary_path = '/usr/bin/python3'
" C family Completion Path
let g:ycm_global_ycm_extra_conf='~/.ycm/cpp/.ycm_extra_conf.py'
" Mapping key for jump
nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <c-h> :YcmCompleter GoToDefinition<CR>| 
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
" When this option is set to 1 YCM will ask once per .ycm_extra_conf.py file if it is safe to be loaded
let g:ycm_confirm_extra_conf = 0
" if keyword of programming language you're writing is autocompleted
let g:ycm_seed_identifiers_with_syntax = 1
" enable YCM tag  
let g:ycm_collect_identifiers_from_tags_files = 1
" autocomple from N-th of char
let g:ycm_min_num_of_chars_for_completion=2
" enable autocomplation in comments
let g:ycm_complete_in_comments = 1
" enable autocomplation in string 
let g:ycm_complete_in_strings = 1
" if identifiers in comments and string can be autocompleted
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" short-cut for selecting first item in prompt (default <TAB> and <Down>)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" short-cut for selecting last item in prompt (default <S-TAB> and <UP>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" if prompt automatically, default <C-Space>
"let g:ycm_key_invoke_completion = ['<C-Space>']
" hide autocomplation prompt, can be shown by type <C-Space>
"let g:ycm_key_list_stop_completion = ['<C-y>']

"###########          NERDTree              ################"
"open a NERDTree automatically when vim starts up"
"autocmd vimenter * NERDTree

"open a NERDTree automatically when vim starts up if no files were specified"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"close vim if the only window left open is a NERDTree"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"change default arrows"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


"###########         NERDTree  Git      ################"
let g:NERDTreeIndicatorMapCustom = {"Modified" : "*", "Staged" : "@", "Untracked" : "~", "Renamed" : "Rn", "Unmerged" : "═", "Deleted" : "D", "Dirty" : "Dirty", "Clean" : "C", 'Ignored' : 'I', "Unknown" : "?"}

"##########          COLOR THEME             ################"
"color theme"
:color desert


"##########          LINE NUMBER             ################"
set number



"##########          SPACE INTENT            ################"
"space intent"
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


"###########          AUTO FORMATER         ################"
" need to install astyple
" sudo apt-get install astyle
 map <F2> :call FormatCode()<CR>
 func! FormatCode()
     exec "w"
     if &filetype == 'C' || &filetype == 'h'
         exec "!astyle --style=google %"
     elseif &filetype == 'cpp'
         exec "!astyle --style=google %"        
     return
     endif
 endfunc
