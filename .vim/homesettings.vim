" Show invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Set relative numbers
set number
set relativenumber

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set molokai colorscheme
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" NERDtree plugin settings
map <leader>t :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" persistent undo even after closing vim
try
    set undodir=~/.vim/undo/
    set undofile
catch
endtry

" powerline settings
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

