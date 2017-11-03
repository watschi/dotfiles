" Show invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Set relative numbers
set number
set relativenumber

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set colorscheme
set termguicolors
colorscheme gruvbox

" NERDtree plugin settings
map <leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" Persistent undo even after closing vim
try
    set undodir=~/.vim/undo/
    set undofile
catch
endtry

" Markdown settings
" Disable default folding
let g:vim_markdown_folding_disabled = 1
" Dont autostart markdown preview
let g:instant_markdown_autostart = 0
" Autosize TOC-split
let g:vim_markdown_toc_autofit = 1
" Format tables nicely
map <leader>ft :TableFormat<CR>:Tabularize<CR>
map <leader>c :Toc<CR>

" Powerline settings
" set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim/
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:gruvbox_number_column='bg1'
let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='normal'
