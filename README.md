# nvim
personal nvim configurations

# usage
copy the config file
```bash
# for nvim
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
```
```bash
# for vim
cp init.vim ~/.vimrc
```

uncomment vim-go or jd-vim to enable such plugins, e.g.
```
" umcomment the line below to enable plugin for golang. go should be installed on the OS.
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
```

open nvim or vim, then run cmd
```
:PlugInstall
```
