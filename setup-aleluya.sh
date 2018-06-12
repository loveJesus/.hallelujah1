#!/bin/bash
# For God so loved the world, that He gave His only begotten Son
# That all who believe in Him should not perish but have everlasting
# LIFE
echo "Hallelujah please make sure this is in ~/.hallelujah1/"

read -p "Set up apt [y/n] ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  read -p "Set up phase 1 - Hallelujah [y/n] ? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
     
    sudo apt install diatheke libsword-utils  -y
    sudo apt-get install software-properties-common python-software-properties sqlite3 -y
    echo | sudo add-apt-repository ppa:gophers/archive
    echo | sudo add-apt-repository ppa:git-core/ppa
    aleluya=`mktemp`
    wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O $aleluya.deb && sudo dpkg -i $aleluya.deb
    rm $aleluya.deb -f
    sudo apt update
    sudo apt install locales-all -y
    sudo dpkg-reconfigure locales
    sudo apt install socat ufw vim tmux zsh whois telnet dnsutils build-essential  -y
    sudo apt install lib32z1 lib32ncurses5 lib32stdc++6  -y
    sudo useradd hallelujah 
    sudo usermod hallelujah -G sudo,adm,audio,www-data,video,voice,cdrom,floppy,plugdev,users,input
    sudo chsh hallelujah -s /bin/zsh
    sudo chown hallelujah:hallelujah /home/hallelujah 
  fi  #HALLELUJAH phase 1

  read -p "Set up sword user or root [u/r] ? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Uu]$ ]]
  then
    echo "yes" | installmgr -init
    echo "yes" | installmgr -rc
    echo "yes" | installmgr -r CrossWire
    echo "yes" | installmgr -ri CrossWire ESV2011
  elif [[ $REPLY =~ ^[Rr]$ ]]
  then
    sudo -iu root bash -c 'echo "yes" | installmgr -init'
    sudo -iu root bash -c 'echo "yes" | installmgr -rc'
    sudo -iu root bash -c 'echo "yes" | installmgr -r CrossWire'
    sudo -iu root bash -c 'echo "yes" | installmgr -ri CrossWire ESV2011'
  fi


  read -p "Set up lxde vnc Hallelujah [y/n] ? " -n 1 -r
  echo
  if [[ $REPLY = "y" ]]; then
      sudo apt install vnc4server lxde-core -y
  fi

  read -p "Set up dev environment? [y/n] ? " -n 1 -r
  echo
  if [[ $REPLY = "y" ]]; then
      sudo apt-get install docker.io
      sudo usermod hallelujah -G  docker

      sudo apt-get install  socat git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

      #wget https://github.com/JetBrains/kotlin-native/releases/download/v0.7/kotlin-native-linux-0.7.tar.gz
      curl https://sh.rustup.rs -sSf | sh
      curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
      sudo apt-get install -y nodejs
      #sudo npm install -g grunt-cli yarn @angular/cli

      curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
      sudo apt-get update && sudo apt-get install yarn -y

      sudo apt perl ruby-dev ocaml opam  clang golang-1.10-go flex bison -y
      sudo apt-get install python-dev python-pip python-virtualenv python-numpy python-matplotlib -y
      sudo apt install php php-dev php-mcrypt php-mysql php-mbstring php-dom -y
      sudo apt install libpcap-dev libnet1-dev rpcbind openssh-server nmap -y


      sudo apt install mongodb-server postgresql postgresql-contrib mysql-server libmysqlclient-dev libsqlite3-dev -y
      sudo apt install elixir esl-erlang -y
      echo Y | mix local.hex 
      echo Y | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
      #Install apache2 and php
      #sudo apt install apache2 apache2-utils libapache2-mod-php -y
      # Enable mod_rewrite for apache2
      #sudo a2enmod rewrite

      # clone rbenv
      git clone https://github.com/rbenv/rbenv.git ~/.rbenv
      git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
      git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

      # add configuration to bashrc
      echo "export PATH=$PATH:$HOME/.rbenv/bin:$HOME/.rbenv/shims" >> ~/.bashrc
      echo "eval $(rbenv init -)" >> ~/.bashrc
      echo "export PATH=$HOME/.rbenv/plugins/ruby-build/bin:$PATH" >> ~/.bashrc
      gem install bundler jekyll mysql2 rails jekyll-pagedown

      read -p "Set up mono environment? [y/n] ? " -n 1 -r
      echo
      if [[ $REPLY = "y" ]]; then
     
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
        echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
        sudo apt update
        # install mono libraries
        sudo apt install mono-devel mono-complete referenceassemblies-pcl ca-certificates-mono mono-xsp4 -y
        # install mono ide
        sudo apt install monodevelop-nunit monodevelop-versioncontrol monodevelop-database -y
      fi

  fi

fi

read -p "Set up prezto [y/n] ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  zsh -c ' 
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto";
  setopt EXTENDED_GLOB;
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do;
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}";
  done ;'
fi

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


