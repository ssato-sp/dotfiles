
let s:dein_config_dir = expand('$CONFIG/nvim/dein')
let s:dein_dir        = expand('$DATA/dein')
let s:dein_repo_dir   = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
        endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

let g:dein#install_max_processes = 16
let g:dein#install_message_type  = 'none'

if dein#load_state(s:dein_dir)

  call dein#begin(s:dein_dir)

  let s:toml_dir    = s:dein_config_dir . '/toml'
  let s:toml        = s:toml_dir . '/dein.toml'
  let s:toml_lazy   = s:toml_dir . '/dein_lazy.toml'
  let s:toml_python = s:toml_dir . '/dein_python.toml'
  let s:toml_cpp    = s:toml_dir . '/dein_cpp.toml'

  call dein#load_toml(s:toml,        {'lazy': 0})
  call dein#load_toml(s:toml_lazy,   {'lazy': 1})
  call dein#load_toml(s:toml_python, {'lazy': 1})
  call dein#load_toml(s:toml_cpp,    {'lazy': 1})

  call dein#end()
  call dein#save_state()

endif

if dein#check_install()
  call dein#install()
endif
