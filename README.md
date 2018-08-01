## Install Git
```
sudo apt-get install git
```
## Install Tmux
```
sudo apt-get install tmux
```
## Install tpm- Tmux Plugin Manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
## Create tmux configuration file '.txux.conf'

## Copy contents of downloaded .tmux.conf to created .tmux.conf

## Open tmux (to reload configurations press C-a + I)

## Install Neovim
```
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```
## Install python dependency
### Better to do this with miniconda -
### Install [miniconda](https://conda.io/miniconda.html)
- Install python 2 plugin for neovim
```
create --name py27 python=2.7
source activate py27
pip install neovim
source deacticondavate
```
- Install python 3 plugin for neovim
```
conda create --name py27 python=2.7
source activate py27
pip install neovim
source deactivate
```
