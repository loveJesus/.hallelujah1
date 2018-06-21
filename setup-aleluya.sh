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
    sudo apt install ufw -y
    sudo ufw allow ssh
    sudo ufw enable
    sudo apt-get install apt-transport-https zip unzip w3m aspcud m4 davfs2 gawk -y
    sudo apt-get install software-properties-common python-software-properties sqlite3 -y
    echo | sudo add-apt-repository ppa:gophers/archive
    echo | sudo add-apt-repository ppa:git-core/ppa
    aleluya=`mktemp`
    wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O $aleluya.deb && sudo dpkg -i $aleluya.deb
    rm $aleluya.deb -f
    sudo apt update
    sudo apt install locales-all -y
    sudo dpkg-reconfigure locales
    sudo apt install socat ufw vim tmux zsh whois telnet dnsutils build-essential davfs2 -y
    sudo apt install lib32z1 lib32ncurses5 lib32stdc++6  -y
    sudo useradd hallelujah 
    sudo chsh hallelujah -s /bin/zsh
    sudo chown hallelujah:hallelujah /home/hallelujah 
    pip install requests
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
      mkdir ~/.vnc
      cat <<ALELUYA >| ~/.vnc/xstartup
#!/bin/sh

# Uncomment the following two lines for normal desktop:
# unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#x-window-manager &
startlxde
ALELUYA
     chmod 755 ~/.vnc/xstartup
     vncpasswd
  fi

  read -p "Set up dev environment? [y/n] ? " -n 1 -r
  echo
  if [[ $REPLY = "y" ]]; then
    read -p "Set up docker environment? [y/n] ? " -n 1 -r
    echo
    if [[ $REPLY = "y" ]]; then
 
      sudo apt-get install docker.io
      sudo usermod hallelujah -G  docker
    fi
      sudo apt-get install  socat git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

      #wget https://github.com/JetBrains/kotlin-native/releases/download/v0.7/kotlin-native-linux-0.7.tar.gz
      curl https://sh.rustup.rs -sSf | sh
      curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash
      sudo apt-get install -y nodejs
      #sudo npm install -g grunt-cli yarn @angular/cli

      curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
      sudo apt-get update && sudo apt-get install yarn -y

      sudo apt perl ruby-dev ocaml opam  clang golang-1.10-go flex bison -y
      sudo apt-get install python-dev python-pip python-virtualenv python-numpy python-matplotlib -y
      sudo apt install php php-dev php-sqlite3 php-xml php-curl php-mcrypt php-mysql php-mbstring php-dom -y
      sudo apt install libpcap-dev libnet1-dev rpcbind openssh-server nmap -y


      sudo apt install mongodb-server postgresql postgresql-contrib mysql-server libmysqlclient-dev libsqlite3-dev -y
      sudo apt install elixir esl-erlang -y
      echo Y | mix local.hex 
      echo Y | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
      #Install apache2 and php
      #sudo apt install apache2 apache2-utils libapache2-mod-php -y
      # Enable mod_rewrite for apache2
      #sudo a2enmod rewrite
      curl -s "https://get.sdkman.io" | bash
      . source "$HOME/.sdkman/bin/sdkman-init.sh"

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

read -p "Set up postfix HALLELUJAH [y/n] ? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

  sudo bash <<ALELUYA
  sudo groupadd vmail-aleluya -g 5000
  sudo useradd vmail-aleluya -u 5000 -g 5000 -m
ALELUYA

  sudo apt install postfix  -y
  sudo cp ~/.hallelujah1/etc-aleluya/postfix-aleluya/* /etc/postfix -r
  read -p "Hallelujah - hostname : " HOSTNAME_ALELUYA
  echo
  sudo bash -c "echo $HOSTNAME_ALELUYA >| /etc/mailname" 
  sudo postconf -e "myhostname = $HOSTNAME_ALELUYA" 
  
  sudo apt install dovecot-lmtpd -y
  sudo cp ~/.hallelujah1/etc-aleluya/dovecot-aleluya/* /etc/dovecot -r

  sudo bash <<ALELUYA
  echo $HOSTNAME_ALELUYA >> /etc/postfix/vhosts-aleluya
  echo aleluya@$HOSTNAME_ALELUYA aleluya@$HOSTNAME_ALELUYA aleluya@loveJesus.xyz >> /etc/postfix/virtual-aleluya
  echo aleluya@$HOSTNAME_ALELUYA $HOSTNAME_ALELUYA/aleluya-aleluya/ >> /etc/postfix/vmaps-aleluya
  cd /etc/postfix
  mkdir -p /var/spool/postfix/private
  ./remap-aleluya.sh
  mkdir -p /var/dovecot/d-aleluya/$HOSTNAME_ALELUYA/
  echo aleluya@$HOSTNAME_ALELUYA:$RND_ALELUYA:::::: > /var/dovecot/d-aleluya/$HOSTNAME_ALELUYA/passwd-aleluya
ALELUYA

  sudo ufw allow smtp
fi


read -p "Set up kafka HALLELUJAH [y/n] ? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # For God so loved the world that He gave His only begotten Son
  # That all who believe in Him should not perish but have everlasting life
  sudo adduser --system --group --no-create-home kafka-s-aleluya
  sudo apt install zookeeperd -y
  sudo systemctl start zookeeper
  sudo systemctl enable zookeeper
  sudo ufw allow in on tun0 to any port 2181 proto tcp
  pushd .
  cd /usr/local
  curl http://www-eu.apache.org/dist/kafka/1.1.0/kafka_2.11-1.1.0.tgz |  sudo tar xzvf - 
  sudo rm -rf kafka-aleluya
  sudo mv kafka_2.11-1.1.0 kafka-aleluya
  sudo gawk -i inplace '{ if (NR!=252) {print $0 "# ALELUYA "} else {print "JAVA_MAJOR_VERSION=$($JAVA -version 2>&1 | sed -E -n \x27s/.* version \"([0-9]*).*$/\1/p\x27) " }' kafka-run-class.sh
  sudo mkdir /tmp/kafka-aleluya-logs
  sudo chmod 700 /tmp/kafka-aleluya-logs
  sudo chown kafka-s-aleluya /tmp/kafka-aleluya-logs
  sudo sed -i 's/^log.dirs.*/log.dirs=\/tmp\/kafka-aleluya-logs/g' /usr/local/kafka-aleluya/config/server.properties
  popd

   cat <<ALELUYA >| /tmp/kafka-aleluya.service
# For God so loved the world that He gave His only begotten Son
# That all who believe in Him should not perish but have everlasting life

# change supervised to systemd
# and output dir
[Unit]
Description=Hallelujah - Kafka  messg
After=network.target

[Service]
User=kafka-s-aleluya
Group=kafka-s-aleluya
ExecStart=/usr/local/kafka-aleluya/bin/kafka-server-start.sh /usr/local/kafka-aleluya/config/server.properties
ExecStop=/usr/local/kafka-aleluya/bin/kafka-server-stop.sh
Restart=always

[Install]
WantedBy=multi-user.target
ALELUYA
sudo mv /tmp/kafka-aleluya.service /etc/systemd/system/kafka-aleluya.service
sudo systemctl enable kafka-aleluya
sudo systemctl start kafka-aleluya

fi


read -p "Set up redis HALLELUJAH [y/n] ? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
# For God so loved the world that He gave His only begotten Son
# That all who believe in Him should not perish but have everlasting life

sudo adduser --system --group --no-create-home redis-aleluya
sudo mkdir /var/lib/redis-aleluya
sudo chown redis:redis /var/lib/redis-aleluya
sudo chmod 770 /var/lib/redis-aleluya


cd /tmp
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
rm redis-stable.tar.gz
cd redis-stable
make
#make test
sudo make install

sudo mkdir /etc/redis-aleluya
sudo cp /tmp/redis-stable/redis.conf /etc/redis-aleluya/redis-aleluya.conf
sed -i 's/^supervised.*/supervised systemd/g'
sed -i 's/^dir.*/dir /var/lib/redis-aleluya/g'

  cat <<ALELUYA > /etc/systemd/system/redis-aleluya.service
# For God so loved the world that He gave His only begotten Son
# That all who believe in Him should not perish but have everlasting life

# change supervised to systemd
# and output dir
[Unit]
Description=Hallelujah - Redis In-Memory Data Store
After=network.target

[Service]
User=redis-aleluya
Group=redis-aleluya
ExecStart=/usr/local/bin/redis-server /etc/redis-aleluya/redis-aleluya.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target
ALELUYA

fi #HALLELUJAH end redis set up

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
  echo ". ~/bin-aleluya/startup-aleluya.sh" >> ~/.zshrc
  cp ~/.hallelujah1/envhere-aleluya ~/.envhere-aleluya

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
  mkdir -p ~/.ssh
  cat <<ALELUYA >>~/.ssh/config
Host *
  ForwardAgent yes
  ServerAliveInterval 180
  ServerAliveCountMax 2
ALELUYA
  cat <<ALELUYA >> ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPG7JBEeyLsXnLVSyH6CzK1iJI1vC5NX5BaVQlPUhcXerpf/6r0zOf0QKUPo3lacOJxNtpX1KS+kY/mo4ehtIqFwfAysRwoh3nFgFdi+8fmYSR/gDUmj9Cxio56e45Wt0Vr1tCt+K0R0igaR1Gj+mWSQSDwJTxG5PJ+20fRy2H57j2q4oPVqDTBJ73Z7HqDIUQXiU/eHRq1G39scRiaPwqya7D7E6i5ttiZPQ7oVxBWZSaKDvwtjJJAim71AGDHzfl3glzbgtNdb7Jb/1c/mVf3vRLRdPJeIZOa/QL/Y+Rd6/rlUv84yVU/ZpkTGYWcb9ndlcJ/dBctiKB47hsL8+N hallelujah@praiseJesus
ALELUYA
  chown hallelujah ~/.ssh
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/authorized_keys
fi


sudo usermod hallelujah -G sudo,adm,audio,www-data,video,voice,cdrom,floppy,plugdev,users,input,davfs2,docker
