## Installation
> Unix, Linux Installation

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/cd-n0/nvim.git $HOME/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > /dev/null 2>&1
```

> Windows Installation

```bat
git clone https://github.com/wbthomason/packer.nvim "%LocalAppData%\nvim-data\site\pack\packer\start\packer.nvim"
git clone --depth 1 https://github.com/cd-n0/nvim "%LocalAppData%\nvim"
start /B nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > NUL 2>&1
```

For the powershell people:

```bat
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
git clone --depth 1 https://github.com/cd-n0/nvim "$env:LOCALAPPDATA\nvim"
start /B nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > NUL 2>&1
```
