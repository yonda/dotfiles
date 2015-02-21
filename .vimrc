set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

filetype plugin indent on

"-----------------------------------------------------------------------------
" NeoBundler
"-----------------------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"-----------------------------------------------------------------------------

" color
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'guicolorscheme.vim'
NeoBundle 'wombat256.vim'
NeoBundle 'vividchalk.vim'
NeoBundle 'xoria256.vim'
NeoBundle 'Lucius'

" lang
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-coffee-script'
NeoBundle 'coffee.vim'
NeoBundle 'VimClojure'
NeoBundle 'https://github.com/moro/vim-review.git'
NeoBundle 'https://github.com/tpope/vim-endwise.git'
NeoBundle 'Sass'

" surround & textobj
NeoBundle 'https://github.com/kana/vim-surround.git'
NeoBundle 'textobj-user'
NeoBundle 'https://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'https://github.com/nelstrom/vim-textobj-rubyblock.git'
NeoBundle 'https://github.com/terryma/vim-multiple-cursors.git'

" unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'https://github.com/h1mesuke/unite-outline.git'
NeoBundle 'https://github.com/basyura/unite-rails'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'https://github.com/sgur/unite-qf.git'
NeoBundle 'unite-colorscheme'

" neocomplcache
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets'

" markdown
NeoBundle 'Markdown'
NeoBundle 'suan/vim-instant-markdown'

"" misc
"Bundle 'snipMate'
NeoBundle 'sudo.vim'
NeoBundle 'visualstar.vim'
NeoBundle 'emacscommandline'
NeoBundle 'ref.vim'
NeoBundle 'https://github.com/tpope/vim-fugitive'
NeoBundle 'https://github.com/fuenor/qfixhowm.git'
NeoBundle 'The-NERD-Commenter'
"Bundle 'skk.vim'
NeoBundle 'https://github.com/tyru/eskk.vim.git'
NeoBundle 'repeat.vim'
NeoBundle 'syntaxGemfile.vim'
NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'alpaca-tc/alpaca_tags'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : ''
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.c =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.cpp =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
<

" == Unite.vim
let g:unite_enable_start_insert=1
let g:unite_source_file_ignore_pattern = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:unite_source_file_mru_ignore_pattern = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:unite_winheight = 10
let g:unite_source_file_mru_time_format = "%Y-%m-%dT%H:%M:%S "
let g:unite_cursor_line_highlight = 'CursorLine'
let g:syntastic_check_on_open=1

" バッファ一覧を表示する
nnoremap <silent> <SPACE>b :<C-u>Unite buffer<CR>
" 今開いているファイルのディレクトリを開く
nnoremap <silent> <SPACE>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ファイル一覧
nnoremap <silent> <SPACE>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <SPACE>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <SPACE>u :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <SPACE>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" 鵜ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
" 鵜ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

nnoremap <Space>l :Unite outline<CR>
nnoremap <Space>M :Unite mark<CR>
nnoremap <Space>c :Unite webcolorname<CR>
nnoremap <Space>q :Unite qf<CR>

"-----------------------------------------------------------------------------
" for Fugitive(git wrapper)
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>

"-----------------------------------------------------------------------------
" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"-----------------------------------------------------------------------------
"spe_cuke
function! s:SetupSpeCuke()
    command! RunTestFile exe '!sc ' . expand('%:p')
    command! RunTestCase exe '!sc --line ' . line('.') . ' ' . expand('%:p')

	nnoremap -tf :RunTestFile<CR>
	nnoremap -tc :RunTestCase<CR>
endfunction

au BufRead,BufNewFile *_spec.rb,*.feature call s:SetupSpeCuke()
"-----------------------------------------------------------------------------
" misc
set ignorecase
set list
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない))
set noswapfile
set nohlsearch
set noincsearch
set number
set showcmd
set showmatch
set smartcase
set shiftwidth=4
set tabstop=4
set wrapscan

" カーソルが何行目の何列目に置かれているかを表示する
set ruler
"inoremap <ESC> <ESC>:set iminsert=0<CR>
inoremap jj <ESC>
inoremap jk <ESC>

set mouse=a
set guioptions+=a
set ttymouse=xterm2

"-----------------------------------------------------------------------------
" statulines
"-----------------------------------------------------------------------------
set laststatus=2

"-----------------------------------------------------------------------------
" FileType
"-----------------------------------------------------------------------------
au FileType ruby     :set nowrap tabstop=2 tw=0 sw=2 expandtab commentstring=#\ %s
au FileType c setl ts=8 sw=4 noexpandtab
au FileType cc       :set nowrap tabstop=4 tw=4 sw=4 expandtab
au FileType h        :set nowrap tabstop=4 tw=4 sw=4 expandtab
au FileType clojure  :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType cucumber :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType haml     :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType sass     :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType coffee   :set nowrap tabstop=2 tw=2 sw=2 expandtab
au FileType Gemfile  :set nowrap tabstop=2 tw=2 sw=2 expandtab
filetype plugin on
syntax on

"-----------------------------------------------------------------------------
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"-----------------------------------------------------------------------------
"
set fileencoding=utf-8
set fileformats=unix,dos,mac

if exists('&ambiwidth')
	set ambiwidth=double
endif

"-----------------------------------------------------------------------------
set autoindent
"-----------------------------------------------------------------------------
" keymap
nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l
 nnoremap ; :
" nmap ,r :r ! ruby %<CR>
imap ^[OA <Up>
imap ^[OB <Down>
imap ^[OC <Right>
imap ^[OD <Left>
"-----------------------------------------------------------------------------
" autocmd
au QuickfixCmdPost vimgrep cw
"-----------------------------------------------------------------------------
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
" highlight CursorLine ctermbg=Black guibg=black

"-----------------------------------------------------------------------------
set cursorline
"-----------------------------------------------------------------------------
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" for GUI
if has('gui_macvim')
  set transparency=10
  set antialias
  set guifont=Menlo:h14
endif

autocmd QuickFixCmdPost *grep* cwindow

let howm_dir = '~/Dropbox/hown/'
let mapleader = "\\"
set wrap

"-----------------------------------------------------------------------------
" Color
set t_Co=256
"-----------------------------------------------------------------------------
" end of line space highlight
set listchars=tab:\ \
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

set list
set listchars=tab:>-
hi NonText guibg=NONE guifg=DarkGreen
hi SpecialKey guibg=NONE guifg=Gray40

set nocompatible               " be iMproved
filetype off
syntax on
:nnoremap <ESC><ESC> :nohlsearch<CR>

"""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""

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

