#Hallelujah
echo "Hallelujah please make sure this is in ~/.hallelujah1/"
read



read -p "Set up tmux/vim [y/n] ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  ln -s ~/.hallelujah1/tmux.conf-aleluya   ~/.tmux.conf
  ln -s ~/.hallelujah1/vimrc-aleluya       ~/.vimrc
  ln -s ~/.hallelujah1/bin-aleluya         ~/bin-aleluya
  cd ..
  tar xvf .hallelujah1/vim-aleluya.tgz
  cd .hallelujah1
fi

read -p "Set up git user [y/n]? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git config --global user.email "loveJesus@loveJesus.xyz"
  git config --global user.name "loveJesus"
fi

read -p "Set up ssh [y/n]? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git config --global user.email "loveJesus@loveJesus.xyz"
  git config --global user.name "loveJesus"
fi


