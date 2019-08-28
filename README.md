# Spacemacs on Ubuntu 19 #

## Main part ##

### Building emacs from source ###

#### Clone git emacs repo ####

```bash
git clone --depth 1 git://git.sv.gnu.org/emacs.git ~/Comp/emacs-source
```

#### Depedencies ####

```bash
sudo apt install -y autoconf automake libtool texinfo build-essential xorg-dev libgtk2.0-dev libjpeg-dev libncurses5-dev libdbus-1-dev libgif-dev libtiff-dev libm17n-dev libpng-dev librsvg2-dev libotf-dev libgnutls28-dev libxml2-dev
```
#### Building emacs ####

```bash
cd ~/Comp/emacs-source
./autogen.sh
./configure --with-x-toolkit=lucid --with-mailutils
make bootstrap
sudo make install
```

### Installing spacemacs ###

#### Clone spacemacs repo ####

```bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d
git checkout develop
```

#### Add source-code-pro font ####

```bash
wget -O $HOME/source-code-pro-fonts.tar.gz https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.tar.gz
cd $HOME
tar xvf $HOME/source-code-pro-fonts.tar.gz
sudo mkdir -p /usr/share/fonts/OTF
sudo cp $HOME/source-code-pro-2.030R-ro-1.050R-it/OTF/* /usr/share/fonts/OTF
rm $HOME/source-code-pro* -r
```

#### Clone this repo to get ``.spacemacs`` and useful aliases ####

```bash
git clone https://github.com/pietrodito/spacemacs-setup ~/Comp/spacemacs-setup
cd ~/Comp/spacemacs-setup
./run-installers.sh
```

#### GUI emacs as a service with systemd ####

* Files concerned
``` 
installers/emacs-as-service.sh
~/.config/systemd/user/emacs.service@ -> helpers/emacs-systemd.service
helpers/emacs-aliases.zsh
```

##### For documentation purpose only (everything is already configured in this repo) #####

* Creation of command ``m`` to lauch emacsclient in new frame
* Inside ``(config-user () ...)`` in ``~/.spacemacs``
```elisp
  ;; New frame will open fullscreen
  (add-to-list 'default-frame-alist '(fullscreen . fullboth))
```

___

## Markdown Preview ##

* Research
``pandoc`` needed
### First step : installation of TexLve
```sudo apt install -y texlive-full```
#### Then : installation of pandoc
```sudo apt install -y pandoc```
```sudo apt install -y markdown```


---
## Lisp setup

### SLIME
```bash
sudo apt install sbcl -y
```

### Quicklisp package manager :
See https://www.quicklisp.org/beta/


---
## R with ESS

### Get latest R version from CRAN
#### Add backport repo
``` bash
# Add GPG sig
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# Add repo to sources.list
echo "deb https://cloud.r-project.org//bin/linux/ubuntu xenial-cran35/" | sudo tee -a /etc/apt/sources.list
# Update
sudo apt update
```
#### Install R
```
sudo apt install r-base
```
