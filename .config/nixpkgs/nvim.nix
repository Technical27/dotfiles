''
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=100
set shortmess+=c
set signcolumn=yes

set encoding=utf-8

set foldmethod=syntax
set foldnestmax=10
set foldlevel=2
set nofoldenable

set lazyredraw
set synmaxcol=180
set re=2

set autoread

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set clipboard+=unnamedplus

set termguicolors

set wrap
set breakindent

set number
set showmatch

set mouse=a

set undofile

nnoremap <silent> <esc> :let @/ = ""<return><esc>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

filetype plugin indent on
syntax on

nnoremap T :bprev<CR>
nnoremap Y :bnext<CR>

nnoremap <C-u> :UndotreeToggle<CR>

let g:vim_markdown_preview_github = 1
let g:vim_markdown_preview_hotkey = '<C-m>'
let g:vim_markdown_preview_browser = 'Chromium'
let g:vim_markdown_preview_use_xdg_open = 1

let g:AutoPairsFlyMode = 1

fun! Fzf_dev()
  let l:fzf_files_options =
    \'--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  fun! s:get_open_files()
    let l:buffers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.name')
    let l:len = len(fnamemodify(".", ":p"))
    return map(l:buffers, 'v:val[l:len:]')
  endf

  fun! s:files()
    let l:buffers = s:get_open_files()
    let l:files = filter(split(system($FZF_DEFAULT_COMMAND), '\n'), 'index(l:buffers, v:val) == -1')
    return s:prepend_icon(l:files)
  endf

  fun! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      if filereadable(l:candidate)
        let l:filename = fnamemodify(l:candidate, ':p:t')
        let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
        call add(l:result, printf('%s %s', l:icon, l:candidate))
      endif
    endfor

    return l:result
  endf

  fun! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endf

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endf

nnoremap <C-p> :call Fzf_dev()<CR>

let g:coc_global_extensions = [
  \'coc-json',
  \'coc-css',
  \'coc-html',
  \'coc-lists',
  \'coc-snippets',
  \'coc-syntax',
  \'coc-emoji',
  \'coc-git',
  \'coc-vetur',
  \'coc-rust-analyzer',
  \'coc-prettier',
  \'coc-tsserver',
  \'coc-tabnine',
  \]

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:localvimrc_persistent = 1

let g:closetag_filenames = '*.html,*.tsx,*.jsx,*.vue'
let g:closetag_filetypes = 'html,typescriptreact,javascriptreact,vue'

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" clear whitespace on save
fun! TrimWhitespace ()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endf

augroup ClearWhitespace
  autocmd BufWritePre * call TrimWhitespace()
augroup end

augroup RemoveHighlight
  autocmd BufLeave,BufWinLeave * nohlsearch
augroup end

noremap <right> <C-w>l
noremap <left> <C-w>h
noremap <down> <C-w>j
noremap <up> <C-w>k

set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

hi clear SignColumn
hi! link CocErrorSign GruvboxRed
hi! link CocWarningSign GruvboxOrange
hi! link CocInfoSign GruvboxYellow
''
# vim: set ft=vim:
