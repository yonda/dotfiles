" vi互換の動作を無効にするおまじない
set nocompatible

filetype off
filetype plugin indent off

"-----------------------------------------------------------------------------
" NeoBundler
"-----------------------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
    set nocompatible
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

""""""""""""""""""""""""""""""
" syntacs のチェックを行う
NeoBundle 'scrooloose/syntastic'

" rubocop のチェックを行う
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

""""""""""""""""""""""""""""""
" Unit.vim の設定
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" バッファ一覧
noremap <C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-F> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" NERDTree
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" NERDTree のショートカット
" " Ctrl + e でディレクトリ表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
  
" デフォルトでツリーを表示させる
" autocmd VimEnter * execute 'NERDTree'
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Gitを便利に使う
" fugitive の設定
NeoBundle 'tpope/vim-fugitive'

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" git blame のショートカット
nnoremap <Space>gb :<C-u>Gblame<Enter>

" nnoremap <Space>gd :<C-u>Gdiff<Enter>
" nnoremap <Space>gs :<C-u>Gstatus<Enter>
" nnoremap <Space>gl :<C-u>Glog<Enter>
" nnoremap <Space>ga :<C-u>Gwrite<Enter>
" nnoremap <Space>gc :<C-u>Gcommit<Enter>
" nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

nnoremap <buffer><Space>r :R<CR>
nnoremap <buffer><Space>s :A<CR>
nnoremap <buffer><Space>m :Rmodel<Space>
nnoremap <buffer><Space>c :Rcontroller<Space>
nnoremap <buffer><Space>v :Rview<Space>
" nnoremap <buffer><Space>p :Rpreview<CR>
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
NeoBundle 'https://github.com/basyura/unite-rails'
nnoremap <buffer><C-H><C-V>  :<C-U>Unite rails/view<CR>
nnoremap <buffer><C-H><C-M>  :<C-U>Unite rails/model<CR>
nnoremap <buffer><C-H><C-O>  :<C-U>Unite rails/controller<CR>
"""""""""""""""""""""""""""""

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

"""""""""""""""""""""""""""""
" コメントアウト用の plugin
NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
" cc でコメントアウト
nmap cc <Plug>NERDCommenterToggle
vmap cc <Plug>NERDCommenterToggle
"""""""""""""""""""""""""""""

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

"""""""""""""""""""""""""""""
" 入力補完
NeoBundle 'Shougo/neocomplcache'

" 参照 http://qiita.com/hide/items/229ff9460e75426a2d07
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Memo 用 の plugin
NeoBundle 'glidenote/memolist.vim'

let g:memolist_path = expand('~/memolist')
let g:memolist_gfixgrep = 1
let g:memolist_unite = 1
let g:memolist_unite_option = "-vertical -start-insert"
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>
"""""""""""""""""""""""""""""

" colorschme を確認する
" Usage :Unite -auto-preview colorscheme
NeoBundle 'unite-colorscheme'

"""""""""""""""""""""""""""""
" color
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'guicolorscheme.vim'
NeoBundle 'wombat256.vim'
NeoBundle 'vividchalk.vim'
NeoBundle 'xoria256.vim'
NeoBundle 'Lucius'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"-----------------------------------------------------------------------------

"""""""""""""""""""""""""""""
" vim default

set noswapfile
set nohlsearch
set noincsearch
set number
set showcmd
" 対応する括弧やブレースを表示する
set showmatch
" 検索時に大文字小文字を区別しない
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。
set wrapscan

set shiftwidth=4
set tabstop=4

" jj, jk でモードきりかえ
inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>
" default な挙動だが、statusline の色を変えるために設定している
inoremap <silent> <C-c> <ESC>

nnoremap <silent><Space>b :b#<CR>
" ノーマルモードでは ; を : として扱う
nnoremap ; :

"status line を常に表示する
set laststatus=2

" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

""""""""""""""""""""""""""""""
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

"-----------------------------------------------------------------------------
" FileType ごとの設定
"-----------------------------------------------------------------------------
au FileType ruby     :set nowrap tabstop=2 tw=0 sw=2 expandtab commentstring=#\ %s
au FileType cucumber :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType haml     :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType sass     :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType coffee   :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType Gemfile  :set nowrap tabstop=2 tw=2 sw=2 expandtab

syntax on
