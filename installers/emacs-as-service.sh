. installers/source-to-set-repo-dir-var.sh
mkdir -p ~/.config/systemd/user/
#ln -sf $REPO_DIR/helpers/emacs.service ~/.config/systemd/user/emacs.service
cp $REPO_DIR/helpers/emacs.service ~/.config/systemd/user/emacs.service
systemctl --user enable emacs.service
systemctl --user start emacs.service
