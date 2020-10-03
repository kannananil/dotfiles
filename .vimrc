set nocompatible                        " make vi compatible
set hlsearch                            " set search highlight
set nu                                  " set numbering for lines
set ruler                               " show cursor position
set incsearch                           " incremented search 
set showcmd                             " display incomplete commands
set ls=2                                " display the status bar 
set history=50                          " Keeps history for previous 50 commands
set smartindent                         " sets indentation by default
set tabstop=2                           " sets tab spacing to two 
set softtabstop=2                       " sets double tab sapcing two two
set shiftwidth=2                        " sets shiftwidth for autouindenting 
set expandtab                           " expands tabs
syntax enable                           " switches on the syntax based coloring
set wildignore+=.swp                    " ignore .swp files while opeing a file 
set wrap                                " sets linewrapping
set foldmethod=indent                   " fold based on indentation level
set backspace=indent,eol,start          " allow backspacing over indention, line breaks and insertion start 
"--------------------------------------------------Plugins---------------------------------------------------
" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" nerdtree 
map <C-n> :NERDTreeToggle<CR>
map <C-y> "*y
map <C-d> idescribe("",function(){<CR>it("",function(){<CR>assert.deepStrictEqual(actual,expected);<CR>})<CR>});<CR><ESC>(wla
