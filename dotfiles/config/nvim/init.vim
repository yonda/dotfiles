" 行数
set number

set shiftwidth=2

" スプリット時に下にカーソルを移す
set splitbelow
" スプリット時に右にカーソルを移す
set splitright

" swp ファイル作らないようにする
set noswapfile

set nohlsearch

noremap ; :
" ss で :sp
nnoremap <silent> ss :sp<CR>
" vs で :vs
noremap <silent> vs :vs<CR>
" jj, jk でモードきりかえ
inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>

noremap <silent> <Space>p :pop<CR>

" 挿入モードでのカーソル移動(vim like)
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

let g:python3_host_prog = '/opt/homebrew/bin/python3'

"x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x

au FileType ruby :set nowrap tabstop=2 tw=0 sw=2 expandtab commentstring=#\ %s
let g:ruby_host_prog = '/Users/honda/.rbenv/shims/neovim-ruby-host'

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:rc_dir = expand('~/.config/nvim')

" dein.vim がなければ github から落としてくる
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

set background=dark
call dein#add('dracula/vim')
syntax enable
colorscheme dracula

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
end


call map(dein#check_clean(), "delete(v:val, 'rf')")
