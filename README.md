A [cflint](https://github.com/cflint/CFLint) [vim-syntastic](https://github.com/vim-syntastic/syntastic) script.


## Install

cflint-syntastic follows the standard runtime path structure.  Using
a common and well known plugin manager to install cflint-syntastic is recommended.

For Pathogen just clone the repo, for other plugin managers
add the appropriate lines and execute the plugin's install command.

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/cflint/cflint-syntastic.git ~/.vim/bundle/cflint-syntastic`
*  [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'cflint/cflint-syntastic'`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * `NeoBundle 'cflint/cflint-syntastic'`
*  [Vundle](https://github.com/gmarik/vundle)
  * `Plugin 'cflint/cflint-syntastic'`

Please make sure `cflint` is [installed](https://github.com/cflint/CFLint/blob/master/build-instructions.md)
and in the PATH.

## Disable
In .vimrc, add `let g:syntastic_cf_checkers=[]`

## Other
Added support for use with [cf-utils](https://github.com/davejlong/cf-utils.vim)
