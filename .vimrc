"
" vim: set ts=4 sw=4 sts=0:
"
"-----------------------------------------------------------------------------
" vundle start
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" color
Bundle 'mrkn256.vim'
Bundle 'guicolorscheme.vim'
Bundle 'wombat256.vim'
Bundle 'vividchalk.vim'
Bundle 'xoria256.vim'
Bundle 'Lucius'

"" lang
Bundle 'tpope/vim-rails'
Bundle 'vim-coffee-script'
Bundle 'coffee.vim'
Bundle 'VimClojure'
Bundle 'https://github.com/moro/vim-review.git'
Bundle 'https://github.com/tpope/vim-endwise.git'
Bundle 'Sass'

"" surround & textobj
Bundle 'https://github.com/kana/vim-surround.git'
Bundle 'textobj-user'
Bundle 'https://github.com/h1mesuke/vim-alignta.git'
Bundle 'https://github.com/nelstrom/vim-textobj-rubyblock.git'

Bundle 'https://github.com/terryma/vim-multiple-cursors.git'

"" unite
Bundle 'Shougo/unite.vim'
Bundle 'https://github.com/h1mesuke/unite-outline.git'
Bundle 'https://github.com/basyura/unite-rails'
Bundle 'tacroe/unite-mark'
Bundle 'pasela/unite-webcolorname'
Bundle 'https://github.com/sgur/unite-qf.git'
Bundle 'unite-colorscheme'

"" neocomplcache
"Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'

"" misc
"Bundle 'snipMate'
Bundle 'sudo.vim'
Bundle 'visualstar.vim'
Bundle 'emacscommandline'
Bundle 'ref.vim'
Bundle 'https://github.com/tpope/vim-fugitive'
Bundle 'https://github.com/fuenor/qfixhowm.git'
Bundle 'The-NERD-Commenter'
"Bundle 'skk.vim'
Bundle 'https://github.com/tyru/eskk.vim.git'
Bundle 'repeat.vim'
Bundle 'syntaxGemfile.vim'
Bundle 'glidenote/octoeditor.vim'
Bundle 'scrooloose/syntastic'

" == Unite.vim
" Unite髢九＞縺溘ｉinsert mode
let g:unite_enable_start_insert=1
let g:unite_source_file_ignore_pattern = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:unite_source_file_mru_ignore_pattern = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:unite_winheight = 10
let g:unite_source_file_mru_time_format = "%Y-%m-%dT%H:%M:%S "
let g:unite_cursor_line_highlight = 'CursorLine'

nnoremap <silent> <SPACE>b :<C-u>Unite buffer<CR>
nnoremap <silent> <SPACE>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <SPACE>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <SPACE>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <SPACE>u :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <SPACE>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
nnoremap <Space>l :Unite outline<CR>
nnoremap <Space>M :Unite mark<CR>
nnoremap <Space>c :Unite webcolorname<CR>
nnoremap <Space>q :Unite qf<CR>


"-----------------------------------------------------------------------------
" for Fugitive
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
inoremap <ESC> <ESC>:set iminsert=0<CR>
inoremap jj <ESC>

set mouse=a
set guioptions+=a
set ttymouse=xterm2

"-----------------------------------------------------------------------------
" statulines
set laststatus=2


"-----------------------------------------------------------------------------
" FileType
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
"
set autoindent

"-----------------------------------------------------------------------------
" keymap
" nnoremap wh <C-w>h
" nnoremap wj <C-w>j
" nnoremap wk <C-w>k
" nnoremap wl <C-w>l
 nnoremap ; :
" nmap ,r :r ! ruby %<CR>
imap ^[OA <Up>
imap ^[OB <Down>
imap ^[OC <Right>
imap ^[OD <Left>
"-----------------------------------------------------------------------------
"" autocmd
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

"---------------------------------------------------
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
" InsertMode謚懊￠縺溘ｉ菫晏ｭ
" autocmd InsertLeave *  silent! wall

"-----------------------------------------------------------------------------
" Color
set t_Co=256

"-----------------------------------------------------------------------------
" end of line space highlight
set listchars=tab:\ \ 
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

"謾ｹ陦梧枚蟄励→繧ｿ繝匁枚蟄励ｒ陦ｨ遉ｺ
set list
set listchars=tab:>-
""謾ｹ陦梧枚蟄励→繧ｿ繝匁枚蟄励�濶ｲ險ｭ螳(NonText縺梧隼陦後ヾpecialKey縺後ち繝)
hi NonText guibg=NONE guifg=DarkGreen
hi SpecialKey guibg=NONE guifg=Gray40

set nocompatible               " be iMproved
filetype off
syntax on
:nnoremap <ESC><ESC> :nohlsearch<CR>
