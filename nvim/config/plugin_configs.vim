" ===========================================================
" ===                       Nerd Tree                     ===    
" ===========================================================
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" ===========================================================
" ===                        Ale                          ===    
" ===========================================================
let g:ale_completion_enabled = 0

" ===========================================================
" ===                      Ligthline                      ===    
" ===========================================================
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'lineinfo': ' %3l:%-2v'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ }
\ }

function! LightlineFugitive()
      if exists('*fugitive#head')
            let branch = fugitive#head()
            return branch !=# '' ? ' '.branch : ''
      endif
      return ''
endfunction

let g:lightline.separator = {
      \   'left': '', 'right': ''
\ }
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
\ }

let g:lightline.tabline = {
      \   'left': [ ['tabs'] ],
      \   'right': [ ['close'] ]
\ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" ===========================================================
" ===              Git gutter (Git diff)                  ===    
" ===========================================================
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

" ===========================================================
" ===                       Deoplete                      ===    
" ===========================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete_disable_auto_complete = 1

call deoplete#custom#buffer_option('auto_complete', v:true)

call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/6.0.0/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/6.0.0/lib/clang'

let g:deoplete#sources#jedi#show_docstring = 1
