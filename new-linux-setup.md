
# Table of Contents

1.  [Installation:](#org78589ea)
    1.  [Creating bootable USB stick on mac: https://linuxnewbieguide.org/how-to-put-a-linux-iso-onto-a-usb-stick-and-make-it-bootable-on-a-mac/](#orgca54d7f)
    2.  [Having some trouble with getting it to boot on the machine. See also linux-on-p51.org](#orgd88fef6)
    3.  [Outcome: easiest to just burn to DVD and boot from that](#org7c55c26)
2.  [Enable repos:](#org0e04133)
    1.  [sudo -i software-properties-gtk](#org4c68fcd)
        1.  [In "other software": add (s/zesty/current-release-nickname/): deb http://archive.canonical.com/ubuntu zesty partner](#org1d4edd3)
        2.  [check desired repos in 1st & 2nd tab](#org13a2938)
        3.  [in updates tab, check desired updates](#org7a6e1c9)
        4.  [Additional Drivers &#x2013; autosearch](#org6e34435)
3.  [Preferences:](#org5248f20)
    1.  [dvorak](#org8035136)
    2.  [Displays/Night Light](#org2fa8b9e)
4.  [sudo apt install:](#org56ef613)
    1.  [vim xcape vlc xsel python-pygments openssh-server php-memcached memcached tmux htop make chrome-gnome-shell silversearcher-ag autojump tmuxinator gnome-sushi rename hardinfo jq](#org7fceb1f)
    2.  [lm-sensors (so system-monitor can see fan speed)](#orgf9b6444)
    3.  [Windows emulation (maybe):](#org50554f5)
        1.  [wine, winetricks, playonlinu](#org698d9da)
5.  [Gnome-tweak-tool to change various settings](#org3c2e428)
    1.  [Under keyboard / 'additional layout options'](#orgb6f7db4)
        1.  [caps-lock / 'swap ESC and caps lock'](#org9a7ad68)
        2.  [Under ctrl-key-position I can switch left-alt and left-ctrl](#orgfb383eb)
        3.  [Change overview shortcut to (nonexistent) right-super [I use super-space instead]](#org1bb09c5)
    2.  [Under fonts: can scale fonts](#org3f1281b)
6.  [Vim setup:](#org527eadc)
    1.  [vim: pathogen -](#org6c365ec)
        1.  [mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim](#org8ef85b8)
    2.  [mkdir -p ~/tmp/vim<sub>backup</sub>](#orgf92a7d1)
    3.  [Necessary? cd ~/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git](#orgbe4f26d)
7.  [Download & install:](#org8190879)
    1.  [Chrome - although I'm noticing it's a CPU hog, at least in VM, at least w/ lots of tabs](#org00c5bbf)
    2.  [LastPass](#org17d3b08)
    3.  [Dropbox](#orgab456f9)
        1.  [Then clone dotfiles](#org819260f)
    4.  [Spacemacs](#org0dd36fa)
        1.  [git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d](#orga12ab5f)
    5.  [autojump](#orge5e8308)
        1.  [have to manually set up on ubuntu (done in .bashrc)](#org8e39a57)
    6.  [Clipboard Manager:](#orgce2f09e)
        1.  [CopyQ:](#orgf40a238)
        2.  [Or look for a faster one](#org8dd830f)
    7.  [(Gnome) extensions::](#org97e865f)
        1.  [(unneeded in 18.04+ ?) Show indicators on top bar, not just that little bottom tray.](#orgc252daa)
        2.  [dash-to-dock. NOTE:](#org011df2e)
        3.  [no topleft hot corner](#org93eb390)
        4.  [do not disturb](#org0afedd9)
        5.  [NoAnnoyance (eliminate "..window is created" by auto-raising created windows](#orgabb0d86)
        6.  [openweather](#orgc2ac857)
        7.  [touchpad indicator](#orgd2ffb7f)
        8.  [DO NOT install Indicator Multiload, breaks 18.04](#orgd3c8df9)
        9.  [gnome-sushi &#x2013; preview from file browser with space bar](#org9e5abdd)
        10. [system-monitor (right one): https://extensions.gnome.org/extension/120/system-monitor/](#orgd7efbc2)
        11. [OLD:](#orgbd2f8aa)
    8.  [cdhist (aka \`cd &#x2013;\`)](#org70cdab6)
        1.  [have to have setuptools beforehand:](#org226a904)
        2.  [& then](#orgb16da42)
    9.  [Useful extras: http://www.omgubuntu.co.uk/2017/04/things-to-do-after-installing-ubuntu-17-04](#orgf9c20ab)
    10. [Virtualbox [NOT NEEDED FOR DOCKER]](#org736959e)
    11. [Aptik to auto-reinstall apps & ppas after upgrade:](#org007ce36)
        1.  [https://www.howtogeek.com/206454/how-to-backup-and-restore-your-apps-and-ppas-in-ubuntu-using-aptik/](#orgcfc2634)
        2.  [sudo apt-add-repository ppa:teejee2008/ppa](#org15ecc81)
        3.  [sudo apt update](#org073f878)
        4.  [sudo apt install aptik](#org7ad59d4)
        5.  [sudo apt install aptik-gtk (important! for GUI)](#org569e9b6)
    12. [Docker](#org604e4ae)
        1.  [DO NOT NEED docker-machine or virtualbox!](#orgc06f3d1)
        2.  [docker installation is kind of a pain in the ass.](#orgf82fceb)
        3.  [https://docs.docker.com/install/linux/docker-ce/ubuntu/](#org09d7ce7)
        4.  [Be sure to add self to docker group, start docker service. May need to reboot.](#org6baedae)
        5.  [then install docker-compose:](#org5b948a3)
        6.  [Oudated:](#org4608101)
    13. [Firefox? If so,](#orgf1f5c33)
        1.  [https://addons.mozilla.org/en-US/firefox/addon/ctrl-number-to-switch-tabs/](#org92d8cd5)
        2.  [https://addons.mozilla.org/en-US/firefox/addon/lastpass-password-manager/](#org674c134)
8.  [Customization tweaks:](#org4acf4c1)
    1.  [NOTE: MOST CUSTOMIZATION CAN BE SKIPPED BY COPYING OVER .CONFIG](#org3d2f8ad)
    2.  [Fonts:](#org251a326)
        1.  [Fira Mono: https://fonts.google.com/specimen/Fira+Mono](#orgc59b0b6)
        2.  [Hack: https://sourcefoundry.org/hack/](#orgcfca01e)
    3.  [Window managers:](#org29e984b)
        1.  [Openbox &#x2013; super minimal, elegant](#orgbfc9d23)
        2.  [Pantheon (from Elementary OS)](#org308c7a8)
    4.  [Network:](#orgda10a03)
        1.  [Static IP address:](#org6cfdb07)
    5.  [Icons:](#org159bebd)
        1.  [Numix](#org9d46c9d)
        2.  [Papirus](#org0661198)
    6.  [Theme:](#org487ae96)
        1.  [Plano: http://www.omgubuntu.co.uk/2017/04/plano-gtk-theme](#orge58eced)
    7.  [Other:](#org507b5c5)
        1.  [Rename file for volume-change bleep so that it'll be silent:](#org00cce6f)
        2.  [X11-forwarding setup](#org17c99c7)
    8.  [Nautilus (file manager):](#org4331109)
        1.  [Remove some of the default Nautilus bookmarks:](#org03d675c)
    9.  [~/.ssh/config: add](#orge46f7cf)
    10. [Add audio eq (may possibly cause problems?):](#orgeef297b)
        1.  [sudo apt install pulseaudio-equalizer](#org9f42c13)
        2.  [https://askubuntu.com/a/982556](#orgb2e5968)
        3.  [but then individual applications may not be using the eq. Install volume control](#org151399e)
    11. [Silence MOTD, which is typically Canonical spam:](#org81f82a9)
        1.  [touch ~/.hushlogin](#org82fee44)
9.  [Keyboard layout:](#org19fd8c5)
    1.  [Showing keypresses: \`xev\`](#org717aff9)
        1.  [Or in terminal, \`showkey\`](#org1d5cb20)
        2.  [Although note differences: https://superuser.com/a/248568](#org39eb8e4)
    2.  [Final solution for the P51 (X11):](#org3549d1c)
        1.  [1. Do some switching in tweak-tool/typing:](#org7ab3817)
        2.  [2. config file for xkd, at 'sudo vi /usr/share/X11/xkb/keycodes/evdev'](#org31da48e)
        3.  [3. And then to set left & rt control to l & r parens:](#org9a32c75)
        4.  [4. Everything below this is showing my work; only the above is necessary (for the P51).](#org00053ba)
    3.  [Wayland keyboard layout:](#org0a5fa9f)
        1.  [Swapping right alt and right ctrl:](#orgdacdec8)
        2.  [Ctrl-alone as paren:](#org9857bf7)
        3.  [CopyQ keyboard shortcut doesn't work in all apps, so instead](#org59edd68)
10. [Keyboard shortcuts:](#org22120ce)
    1.  [settings/devices/keyboard:](#org980e26c)
    2.  [Set win/space to open overview](#org083ff8f)
    3.  [Close: super-q](#org3841fcd)
11. [Clojure:](#orgb2b208c)
    1.  [2019: \`sudo apt install clojure\` is enough; no need to manually install Java (but what version does that install? I'm not sure)](#org4e7cace)
    2.  [Installing OpenJDK 11: https://linuxize.com/post/install-java-on-ubuntu-18-04/#installing-the-default-openjdk-java-11](#org167db98)
    3.  [Java:](#org5bd2ac0)
        1.  [NOTE: probably time to not use the oracle jdk shown below; use Open JDK instead.](#org17064c4)
        2.  [Add repo for oracle jdk: (note: webupd8team is not as sketchy as they sound ;P )](#org5f77ab0)
        3.  [install:](#orga9f3d58)
        4.  [Discussion of the above at](#orgebde43f)
    4.  [Leiningen (don't install through apt, too old):](#org2aab134)
        1.  [https://github.com/technomancy/leiningen](#org1bfc321)
    5.  [I like to use lein-drip and drip:](#orga4939be)
        1.  [drip: https://github.com/flatland/drip](#orga9e9d0c)
        2.  [lein-drip: https://github.com/josteink/lein-drip](#org2cc2698)
    6.  [must follow installation directions for clojure-lint](#orga6bc601)
        1.  [https://github.com/n2o/clojure-lint-spacemacs-layer#installation](#org17ed611)
12. [Terminal:](#orgf3fbdd0)
    1.  [Favorites so far:](#org0c79612)
        1.  [Default Gnome terminal + tmux & tmuxinator](#org1e85e09)
        2.  [Pantheon terminal](#org93caaf4)
13. [Backup:](#org0c07cf8)
    1.  [Strategy:](#org8eb01ad)
        1.  [deja dup (just called \`Backups\` in ubuntu) backs up ~/home/ (including aptik-settings-backup) to iMac.](#org09239b1)
        2.  [Aptik can be used to back up most of the other config &#x2013; dconf settings, groups, icons, repos, themes&#x2026;](#org8f42f8b)
        3.  [etckeeper puts /etc under version control (but does not push it anywhere else, because it has sekrit stuff).](#org1d259be)
        4.  [Root backups (not clones): rsync](#orgbc464e2)
    2.  [Details:](#org7816707)
        1.  [add aptik call to root crontab](#org88b3c33)
        2.  [There's also dconf-backup (maybe aptik doesn't do dconf? :( )](#orgdf40449)
        3.  [/Volumes/Unused on imac2013 can become my home backup drive](#org7b0a371)
14. [Work stuff (DW):](#orgc4564ac)
    1.  [keybase: https://keybase.io/docs/the\_app/install\_linux](#orgf4a41c6)
    2.  [Set up memcached:](#org126fd4c)
        1.  [Memcached setup:](#orgf348473)
        2.  [Connecting datomic to memcached:](#org974e50a)
15. [Future:](#orgdab4067)
    1.  [Investigate running multiple Linux distros simultaneously](#org9f9c340)
        1.  [Virtualbox, but it went so terribly wrong last time. Probably try this first, but clone FIRST](#org50c1994)
        2.  [Containers are an option (LXC or Docker) but apparently getting GUI apps running in them is hard.](#org3c74105)
        3.  [Doesn't solve that option, but be aware of firejail for sandboxing apps](#orgd0e3d73)
    2.  [Conky - Very nice, themable system info/clock/weather/whatever overlay:](#org706ec0e)
        1.  [https://github.com/brndnmtthws/conky](#org2d03799)
        2.  [How to:](#org721d4ee)
        3.  [Examples:](#org434cf14)
        4.  [LIST: https://www.deviantart.com/whats-hot/?q=conky+themes&offset=0](#org7066230)


<a id="org78589ea"></a>

# Installation:


<a id="orgca54d7f"></a>

## Creating bootable USB stick on mac: <https://linuxnewbieguide.org/how-to-put-a-linux-iso-onto-a-usb-stick-and-make-it-bootable-on-a-mac/>


<a id="orgd88fef6"></a>

## Having some trouble with getting it to boot on the machine. See also linux-on-p51.org


<a id="org7c55c26"></a>

## Outcome: easiest to just burn to DVD and boot from that


<a id="org0e04133"></a>

# Enable repos:


<a id="org4c68fcd"></a>

## sudo -i software-properties-gtk


<a id="org1d4edd3"></a>

### In "other software": add (s/zesty/current-release-nickname/): deb <http://archive.canonical.com/ubuntu> zesty partner


<a id="org13a2938"></a>

### check desired repos in 1st & 2nd tab


<a id="org7a6e1c9"></a>

### in updates tab, check desired updates


<a id="org6e34435"></a>

### Additional Drivers &#x2013; autosearch


<a id="org5248f20"></a>

# Preferences:


<a id="org8035136"></a>

## dvorak


<a id="org2fa8b9e"></a>

## Displays/Night Light


<a id="org56ef613"></a>

# sudo apt install:


<a id="org7fceb1f"></a>

## vim xcape vlc xsel python-pygments openssh-server php-memcached memcached tmux htop make chrome-gnome-shell silversearcher-ag autojump tmuxinator gnome-sushi rename hardinfo jq


<a id="orgf9b6444"></a>

## lm-sensors (so system-monitor can see fan speed)


<a id="org50554f5"></a>

## Windows emulation (maybe):


<a id="org698d9da"></a>

### wine, winetricks, playonlinu


<a id="org3c2e428"></a>

# Gnome-tweak-tool to change various settings


<a id="orgb6f7db4"></a>

## Under keyboard / 'additional layout options'


<a id="org9a7ad68"></a>

### caps-lock / 'swap ESC and caps lock'


<a id="orgfb383eb"></a>

### Under ctrl-key-position I can switch left-alt and left-ctrl


<a id="org1bb09c5"></a>

### Change overview shortcut to (nonexistent) right-super [I use super-space instead]


<a id="org3f1281b"></a>

## Under fonts: can scale fonts


<a id="org527eadc"></a>

# Vim setup:


<a id="org6c365ec"></a>

## vim: pathogen -


<a id="org8ef85b8"></a>

### mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim <https://tpo.pe/pathogen.vim>


<a id="orgf92a7d1"></a>

## mkdir -p ~/tmp/vim<sub>backup</sub>


<a id="orgbe4f26d"></a>

## Necessary? cd ~/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git


<a id="org8190879"></a>

# Download & install:


<a id="org00c5bbf"></a>

## Chrome - although I'm noticing it's a CPU hog, at least in VM, at least w/ lots of tabs


<a id="org17d3b08"></a>

## LastPass


<a id="orgab456f9"></a>

## Dropbox


<a id="org819260f"></a>

### Then clone dotfiles

1.  <https://github.com/eggsyntax/dotfiles>

2.  ln -s dotfiles/[.spacemacs, .vimrc, .bashrc, .clojure, etc]


<a id="org0dd36fa"></a>

## Spacemacs


<a id="orga12ab5f"></a>

### git clone <https://github.com/syl20bnr/spacemacs> ~/.emacs.d


<a id="orge5e8308"></a>

## autojump


<a id="org8e39a57"></a>

### have to manually set up on ubuntu (done in .bashrc)


<a id="orgce2f09e"></a>

## Clipboard Manager:


<a id="orgf40a238"></a>

### CopyQ:

1.  sudo add-apt-repository ppa:hluk/copyq

2.  sudo apt update && sudo apt install copyq


<a id="org8dd830f"></a>

### Or look for a faster one


<a id="org97e865f"></a>

## (Gnome) extensions::


<a id="orgc252daa"></a>

### (unneeded in 18.04+ ?) Show indicators on top bar, not just that little bottom tray.

1.  <https://extensions.gnome.org/extension/615/appindicator-support/>

2.  (discussed at <http://www.omgubuntu.co.uk/2017/03/use-indicator-applets-gnome-shell> )


<a id="org011df2e"></a>

### dash-to-dock. NOTE:

1.  Must ininstall gnome version:

    1.  <https://github.com/micheleg/dash-to-dock/issues/643#issuecomment-345525969>

    2.  sudo apt remove gnome-shell-extension-ubuntu-dock && sudo apt install gnome-shell-extension-dashtodock

2.  (now incorporated in ubuntu, but the original extension is more configurable)


<a id="org93eb390"></a>

### no topleft hot corner


<a id="org0afedd9"></a>

### do not disturb


<a id="orgabb0d86"></a>

### NoAnnoyance (eliminate "..window is created" by auto-raising created windows


<a id="orgc2ac857"></a>

### openweather


<a id="orgd2ffb7f"></a>

### touchpad indicator


<a id="orgd3c8df9"></a>

### DO NOT install Indicator Multiload, breaks 18.04


<a id="org9e5abdd"></a>

### gnome-sushi &#x2013; preview from file browser with space bar


<a id="orgd7efbc2"></a>

### system-monitor (right one): <https://extensions.gnome.org/extension/120/system-monitor/>


<a id="orgbd2f8aa"></a>

### OLD:

1.  System monitor: [wrong one]

    1.  <https://extensions.gnome.org/extension/1064/system-monitor/>

2.  ubuntu appindicators

3.  steal my focus


<a id="org70cdab6"></a>

## cdhist (aka \`cd &#x2013;\`)


<a id="org226a904"></a>

### have to have setuptools beforehand:

sudo apt install python-setuptools


<a id="orgb16da42"></a>

### & then

git clone <http://github.com/bulletmark/cdhist>
cd cdhist
sudo make install


<a id="orgf9c20ab"></a>

## Useful extras: <http://www.omgubuntu.co.uk/2017/04/things-to-do-after-installing-ubuntu-17-04>


<a id="org736959e"></a>

## Virtualbox [NOT NEEDED FOR DOCKER]

1.  sudo apt install virtualbox

2.  May have to do the steps here: <https://askubuntu.com/a/229908/325838>


<a id="org007ce36"></a>

## Aptik to auto-reinstall apps & ppas after upgrade:


<a id="orgcfc2634"></a>

### <https://www.howtogeek.com/206454/how-to-backup-and-restore-your-apps-and-ppas-in-ubuntu-using-aptik/>


<a id="org15ecc81"></a>

### sudo apt-add-repository ppa:teejee2008/ppa


<a id="org073f878"></a>

### sudo apt update


<a id="org7ad59d4"></a>

### sudo apt install aptik


<a id="org569e9b6"></a>

### sudo apt install aptik-gtk (important! for GUI)


<a id="org604e4ae"></a>

## Docker


<a id="orgc06f3d1"></a>

### DO NOT NEED docker-machine or virtualbox!


<a id="orgf82fceb"></a>

### docker installation is kind of a pain in the ass.


<a id="org09d7ce7"></a>

### <https://docs.docker.com/install/linux/docker-ce/ubuntu/>


<a id="org6baedae"></a>

### Be sure to add self to docker group, start docker service. May need to reboot.


<a id="org5b948a3"></a>

### then install docker-compose:

1.  <https://docs.docker.com/compose/install/>


<a id="org4608101"></a>

### Oudated:

1.  docker-machine create default

2.  eval $(docker-machine env)


<a id="orgf1f5c33"></a>

## Firefox? If so,


<a id="org92d8cd5"></a>

### <https://addons.mozilla.org/en-US/firefox/addon/ctrl-number-to-switch-tabs/>


<a id="org674c134"></a>

### <https://addons.mozilla.org/en-US/firefox/addon/lastpass-password-manager/>


<a id="org4acf4c1"></a>

# Customization tweaks:


<a id="org3d2f8ad"></a>

## NOTE: MOST CUSTOMIZATION CAN BE SKIPPED BY COPYING OVER .CONFIG


<a id="org251a326"></a>

## Fonts:


<a id="orgc59b0b6"></a>

### Fira Mono: <https://fonts.google.com/specimen/Fira+Mono>


<a id="orgcfca01e"></a>

### Hack: <https://sourcefoundry.org/hack/>


<a id="org29e984b"></a>

## Window managers:


<a id="orgbfc9d23"></a>

### Openbox &#x2013; super minimal, elegant

1.  With tint2

2.  See <https://www.youtube.com/watch?v=hWmikVpbrtY>


<a id="org308c7a8"></a>

### Pantheon (from Elementary OS)

1.  Installing: <https://www.linuxhelp.com/how-to-install-pantheon-desktop-in-ubuntu/>


<a id="orgda10a03"></a>

## Network:


<a id="org6cfdb07"></a>

### Static IP address:

1.  settings/wifi/hamburger-for-current-network/ipv4: set ipv4 method to manual; assuming 192-based network, add

2.  address 192.168.1.WHATEV / netmask 255.0.0.0 / gateway (typically) 192.168.1.1

3.  details at <https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux>


<a id="org159bebd"></a>

## Icons:


<a id="org9d46c9d"></a>

### Numix

1.  sudo add-apt-repository ppa:numix/ppa

2.  sudo apt update && sudo apt-get install numix-icon-theme-circle numix-icon-theme-square


<a id="org0661198"></a>

### Papirus

1.  sudo add-apt-repository ppa:papirus/papirus

2.  sudo apt update && sudo apt install papirus-icon-theme


<a id="org487ae96"></a>

## Theme:


<a id="orge58eced"></a>

### Plano: <http://www.omgubuntu.co.uk/2017/04/plano-gtk-theme>


<a id="org507b5c5"></a>

## Other:


<a id="org00cce6f"></a>

### Rename file for volume-change bleep so that it'll be silent:

1.  sudo mv /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga.backup

2.  can \`pulseaudio -k\` to kill pulseaudio (should auto-restart, I <span class="underline">think</span>?) to immediately cause it to take effect, but probably better to just live with it until reboot


<a id="org17c99c7"></a>

### X11-forwarding setup

1.  <https://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-to-run-graphics-applications-remotely>


<a id="org4331109"></a>

## Nautilus (file manager):


<a id="org03d675c"></a>

### Remove some of the default Nautilus bookmarks:

1.  vim ~/.config/user-dirs.dirs

2.  sudo vim /etc/xdg/user-dirs.defaults

3.  via <http://www.arj.no/2017/01/03/nautilus-bookmarks/>


<a id="orge46f7cf"></a>

## ~/.ssh/config: add

Host \*
ServerAliveInterval 240


<a id="orgeef297b"></a>

## Add audio eq (may possibly cause problems?):


<a id="org9f42c13"></a>

### sudo apt install pulseaudio-equalizer


<a id="orgb2e5968"></a>

### <https://askubuntu.com/a/982556>


<a id="org151399e"></a>

### but then individual applications may not be using the eq. Install volume control

1.  <https://askubuntu.com/questions/580631/how-to-set-which-output-sound-an-application-should-use>


<a id="org81f82a9"></a>

## Silence MOTD, which is typically Canonical spam:


<a id="org82fee44"></a>

### touch ~/.hushlogin


<a id="org19fd8c5"></a>

# Keyboard layout:


<a id="org717aff9"></a>

## Showing keypresses: \`xev\`


<a id="org1d5cb20"></a>

### Or in terminal, \`showkey\`


<a id="org39eb8e4"></a>

### Although note differences: <https://superuser.com/a/248568>


<a id="org3549d1c"></a>

## Final solution for the P51 (X11):


<a id="org7ab3817"></a>

### 1. Do some switching in tweak-tool/typing:

1.  Typing / CapsLock / 'Swap ESC and CapsLock'

2.  Typing / CtrlKeyPosition / 'Swap left Alt key with left Ctrl key'


<a id="org31da48e"></a>

### 2. config file for xkd, at 'sudo vi /usr/share/X11/xkb/keycodes/evdev'

1.  Note &#x2013; may want to make that file a symbolic link to one in dotfiles

2.  Switch the keycodes for the two keys, eg if former contains

     <RCTL> = 105;
     <RALT> = 108;
    Then we switch it to:
     <RCTL> = 108;
     <RALT> = 105;
     & now we have overridden keycodes at low level.


<a id="org9a32c75"></a>

### 3. And then to set left & rt control to l & r parens:

1.  [Doesn't seem to work, still having to run xcape manually] Link dotfiles/linux-.bash<sub>login</sub> to ~/.bash<sub>login</sub> (so that it runs once on startup):

    1.  xcape -e 'Control<sub>L</sub>=Shift<sub>L</sub>|parenleft;Control<sub>R</sub>=Shift<sub>R</sub>|parenright'

2.  Previous version, in .bashrc (which is bad because it runs on every new terminal window etc)):

    1.  3. And then to set left & rt control to l & r parens, in .bashrc we add:

        1.  Important to use \`killall xcape\` or something first, to ensure that only one xcape process is ever running.

        2.  xcape -e 'Control<sub>L</sub>=Shift<sub>L</sub>|parenleft;Control<sub>R</sub>=Shift<sub>R</sub>|parenright'


<a id="org00053ba"></a>

### 4. Everything below this is showing my work; only the above is necessary (for the P51).

1.  P51: right-alt is 108, right-ctrl is 105.

2.  Some of the basic swaps can be handled via the settings GUI (or tweak-tool)

    1.  But maybe better to handle it all in the same place.

3.  Handled by: xmodmap (basic key customization), xcape (tweak modifier keys), and xkb (?).

4.  Documentation

    1.  Example webpages:

        1.  <http://tiborsimko.org/capslock-escape-control.html>

        2.  <http://www.economyofeffort.com/2014/08/11/beyond-ctrl-remap-make-that-caps-lock-key-useful/>

        3.  <https://flenniken.net/blog/xcape/>

        4.  xcape + xkb: <https://unix.stackexchange.com/questions/326904/make-an-ordinary-key-act-as-modifier-with-xcape-and-xkb>

        5.  <http://emacsredux.com/blog/2013/11/12/a-crazy-productivity-boost-remap-return-to-control/>

        6.  <https://superuser.com/questions/679284/how-do-i-get-a-valid-xmodmap-while-using-xcape>

    2.  Useful web pages:

        1.  Key swapping with xkb config file (workaround for xmodmap bug):

            1.  <https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/524774/comments/12>

            2.  Crap, this ALMOST works for me. But now my paren modificatinos with xcape are messed up --

                1.  ctrl<sub>l</sub> becomes (((((

            3.  SOLVED! I had multiple instances of xcape running.

        2.  Keyboard configuration in Xorg: <https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg>

        3.  "An Unreliable Guide to XKB Configuration": <https://www.charvolant.org/doug/xkb/>

        4.  XKB guide: <https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450>

        5.  <https://unix.stackexchange.com/questions/158765/using-xcape-xmodmap-to-change-some-keys>

    3.  Reference:

        1.  List of keysyms (ie names for keys):

            1.  <https://cgit.freedesktop.org/xorg/proto/x11proto/plain/keysymdef.h>

        2.  List of built-in rules (?):

            1.  <https://github.com/Webconverger/webc/blob/master/usr/share/X11/xkb/rules/base.lst>

    4.  Modifier keys -> parens:

        1.  <https://unix.stackexchange.com/questions/320269/change-behaviour-of-modifier-keys>

        2.  Great explanation of customizing keyboard layout with xmodmap! 1st I've ever seen that clarifies the **process**.

            1.  <https://forum.xfce.org/viewtopic.php?pid=40253#p40253>

        3.  Xcape on github: <https://github.com/alols/xcape>

5.  xcape: <https://flenniken.net/blog/xcape/>

    1.  install:

        1.  sudo apt install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev

        2.  build:

            1.  cd ~/tmp

            2.  git clone <https://github.com/alols/xcape.git>

            3.  cd xcape

            4.  make

            5.  sudo make install

    2.  Approximate xcape command (in startup, or in .bashrc with check to make sure only run once):

        1.  xcape -e 'Super<sub>L</sub>=Shift<sub>L</sub>|parenleft;Super<sub>R</sub>=Shift<sub>R</sub>|parenright;Caps<sub>Lock</sub>=Escape'

        2.  Or maybe&#x2026;

        3.  xcape -e 'Control<sub>L</sub>=Shift<sub>L</sub>|parenleft;Control<sub>R</sub>=Shift<sub>R</sub>|parenright;Caps<sub>Lock</sub>=Escape'

        4.  xcape -e 'Alt<sub>R</sub>=Control<sub>R</sub>;Control<sub>L</sub>=Shift<sub>L</sub>|parenleft;Control<sub>R</sub>=Shift<sub>R</sub>|parenright'

        5.  Until I can figure out how to switch the right-hand ctrl and alt, I've got paren mapped to alt<sub>r</sub>:

            1.  xcape -e 'Control<sub>L</sub>=Shift<sub>L</sub>|parenleft;Alt<sub>R</sub>=Shift<sub>R</sub>|parenright'

        6.  I've seen the paren ones work, but not the caps<->escape.


<a id="org0a5fa9f"></a>

## Wayland keyboard layout:


<a id="orgdacdec8"></a>

### Swapping right alt and right ctrl:

1.  Changed the following in /usr/share/X11/xkb/symbols/ctrl

    1.  From (this is the "swap<sub>rwin</sub><sub>rctl</sub>" section

        replace key <RWIN> { [ Control<sub>R</sub> ] };
        replace key <RCTL> { [ Super<sub>R</sub> ] };
        modifier<sub>map</sub> Mod4    { <RCTL> };
        modifier<sub>map</sub> Control { <RWIN> };

    2.  To (broader context)

        */ TODO NOTE! I've coopted this one to swap right-Alt and right-Ctl
        /*   instead (because adding a new section in here doesn't add it
        */   to tweaks)
        /* Swap the functions of the right Win key and the right Ctrl key.
        partial modifier<sub>keys</sub>
        xkb<sub>symbols</sub> "swap<sub>rwin</sub><sub>rctl</sub>" {
            replace key <RALT> { [ Control<sub>R</sub>, Control<sub>R</sub> ] };
            replace key <RCTL> { [ Alt<sub>R</sub>, Meta<sub>R</sub> ] };
            modifier<sub>map</sub> Mod1    { <RCTL> };
            modifier<sub>map</sub> Control { <RALT> };
        };

2.  And then choose "Swap Right Win with Right Ctrl" in tweaks/keyboard/additional-layout-options/Ctrl-position

3.  Why replace instead of adding?

    1.  Because then the new one would have to be added to some subset of the files in rules/, and it's not clear which

        1.  That's /usr/share/X11/xkb/rules


<a id="org9857bf7"></a>

### Ctrl-alone as paren:

1.  Download evcape - <https://github.com/wbolster/evcape>

2.  Copy evcape.py to *home/egg/bin*

3.  Create the file ~/.config/systemd/user/evcape.service, contents as follows:

    [Unit]
    Description=evcape

    [Service]
    ExecStart=/home/egg/bin/evcape.py
        press:rightalt,release:rightalt=press:kprightparen,release:kprightparen
        press:leftalt,release:leftalt=press:kpleftparen,release:kpleftparen
    Restart=always

    [Install]
    WantedBy=default.target


<a id="org59edd68"></a>

### CopyQ keyboard shortcut doesn't work in all apps, so instead

1.  Disable it in CopyQ

2.  Add a system shortcut (typically WIN-SHIFT-c) (from settings/keyboard) that runs: copyq -e "menu()"


<a id="org22120ce"></a>

# Keyboard shortcuts:


<a id="org980e26c"></a>

## settings/devices/keyboard:


<a id="org083ff8f"></a>

## Set win/space to open overview


<a id="org3841fcd"></a>

## Close: super-q


<a id="orgb2b208c"></a>

# Clojure:


<a id="org4e7cace"></a>

## 2019: \`sudo apt install clojure\` is enough; no need to manually install Java (but what version does that install? I'm not sure)


<a id="org167db98"></a>

## Installing OpenJDK 11: <https://linuxize.com/post/install-java-on-ubuntu-18-04/#installing-the-default-openjdk-java-11>


<a id="org5bd2ac0"></a>

## Java:


<a id="org17064c4"></a>

### NOTE: probably time to not use the oracle jdk shown below; use Open JDK instead.


<a id="org5f77ab0"></a>

### Add repo for oracle jdk: (note: webupd8team is not as sketchy as they sound ;P )

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update


<a id="orga9f3d58"></a>

### install:

sudo apt-get install oracle-java8-installer
oracle-java8-installer


<a id="orgebde43f"></a>

### Discussion of the above at

1.  <https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get>


<a id="org2aab134"></a>

## Leiningen (don't install through apt, too old):


<a id="org1bfc321"></a>

### <https://github.com/technomancy/leiningen>


<a id="orga4939be"></a>

## I like to use lein-drip and drip:


<a id="orga9e9d0c"></a>

### drip: <https://github.com/flatland/drip>

curl -L <http://drip.flatland.org> > ~/bin/drip
chmod 755 ~/bin/drip


<a id="org2cc2698"></a>

### lein-drip: <https://github.com/josteink/lein-drip>

1.  just require in ~/.lein/profiles.clj


<a id="orga6bc601"></a>

## must follow installation directions for clojure-lint


<a id="org17ed611"></a>

### <https://github.com/n2o/clojure-lint-spacemacs-layer#installation>


<a id="orgf3fbdd0"></a>

# Terminal:


<a id="org0c79612"></a>

## Favorites so far:


<a id="org1e85e09"></a>

### Default Gnome terminal + tmux & tmuxinator


<a id="org93caaf4"></a>

### Pantheon terminal

1.  Installation: <https://askubuntu.com/a/631201/325838>

    1.  sudo add-apt-repository ppa:elementary-os/stable

    2.  Have to then tweak it to point to (xenial as of 2017) instead of most current

    3.  sudo apt-get update

    4.  sudo apt-get install pantheon-terminal

2.  gsettings set org.pantheon.terminal.settings tab-bar-behavior "Hide When Single Tab"

3.  Ctrl-c copies if text is selected; otherwise sends interrupt as usual. Ctrl-v pastes.

4.  Decent search


<a id="org0c07cf8"></a>

# Backup:


<a id="org8eb01ad"></a>

## Strategy:


<a id="org09239b1"></a>

### deja dup (just called \`Backups\` in ubuntu) backs up ~/home/ (including aptik-settings-backup) to iMac.


<a id="org8f42f8b"></a>

### Aptik can be used to back up most of the other config &#x2013; dconf settings, groups, icons, repos, themes&#x2026;

1.  Install aptik (probably) 19.07

2.  mkdir ~/Documents/aptik (ONLY if doesn't exist, which it should if I've restored home dir)

3.  sudo aptik &#x2013;backup-all &#x2013;comp lz4 &#x2013;basepath '/home/egg/Documents/aptik' &#x2013;skip-flatpaks &#x2013;skip-cache &#x2013;skip-packages &#x2013;skip-snaps &#x2013;skip-users &#x2013;skip-mounts &#x2013;skip-home &#x2013;yes

4.  TODO root crontab calls aptik, which backs up all settings not in ~/home/ to ~/aptik-settings-backup


<a id="org1d259be"></a>

### TODO etckeeper puts /etc under version control (but does not push it anywhere else, because it has sekrit stuff).

1.  Will automatically commit changes daily.

2.  <https://opensource.com/article/17/3/etckeeper-version-control>

3.  <https://help.ubuntu.com/lts/serverguide/etckeeper.html>


<a id="orgbc464e2"></a>

### Root backups (not clones): rsync

1.  run from root, this works given enough tries:

    1.  rsync -axqHAW &#x2013;progress &#x2013;ignore-existing &#x2013;numeric-ids &#x2013;delete-excluded &#x2013;exclude=36GiB.swap &#x2013;exclude={"*dev","/proc","/sys","/tmp","/run","/mnt","/media","/lost+found"} &#x2013;info=progress2 / egg@192.168.1.222:/Volumes/LaptopBackup/x1full* | tee /tmp/rsync-errors

2.  Note! Important not to use -X option if copying to mac.


<a id="org7816707"></a>

## Details:


<a id="org88b3c33"></a>

### TODO add aptik call to root crontab

1.  One person's take on the crontab command:

    1.  \`cd /home/egg/aptik-settings-backup && aptik &#x2013;backup-all &#x2013;user <myusername> &#x2013;password <mypassword> &#x2013;yes >> ./aptik<sub>cron.log</sub> 2>&1\`

2.  The options I need for an aptik CLI call:

    1.  &#x2013;user egg &#x2013;password SOMETHING &#x2013;backup-dir /home/egg/aptik-settings-backup &#x2013;yes

    2.  &#x2013;backup-ppa &#x2013;backup-packages &#x2013;backup-users &#x2013;backup-configs &#x2013;backup-themes &#x2013;backup-crontab


<a id="orgdf40449"></a>

### There's also dconf-backup (maybe aptik doesn't do dconf? :( )

1.  <https://github.com/pixelastic/dconf-export>


<a id="org7b0a371"></a>

### /Volumes/Unused on imac2013 can become my home backup drive


<a id="orgc4564ac"></a>

# Work stuff (DW):


<a id="orgf4a41c6"></a>

## keybase: <https://keybase.io/docs/the_app/install_linux>

curl -O <https://prerelease.keybase.io/keybase_amd64.deb>
sudo dpkg -i keybase<sub>amd64.deb</sub>
sudo apt-get install -f
run<sub>keybase</sub>


<a id="org126fd4c"></a>

## Set up memcached:


<a id="orgf348473"></a>

### Memcached setup:

1.  make sure memcached is installed, running as a service, and starting at system boot (see <https://github.com/memcached/memcached/wiki/Install>):

    1.  sudo apt-get install memcached

    2.  systemctl enable memcached

    3.  systemctl start memcached (if you need it now)

2.  in your config file (linux: \`/etc/memcached.conf\`, memory is set by default to 64MB (via \`-m 64\`) &#x2013; set that to as much (max) memory as you're comfortable devoting to memcached (I'm giving it 3072MB).


<a id="org974e50a"></a>

### Connecting datomic to memcached:

1.  In your ~/.lein/profiles.clj, add \`{:user {:jvm-opts ["-Ddatomic.memcachedServers=127.0.0.1:11211"]}}\` (\`{:user {}}\` probably already exists, so just add the jvm-opts key/val)

2.  Restart memcached (linux: \`service memcached restart\`; mac: maybe launchctl unload and then load?)

3.  Start your local REPLs. On repeated runs, some datomic stuff should be faster (until you reboot your computer; then the cache has to build back up).


<a id="orgdab4067"></a>

# Future:


<a id="org9f9c340"></a>

## Investigate running multiple Linux distros simultaneously


<a id="org50c1994"></a>

### Virtualbox, but it went so terribly wrong last time. Probably try this first, but clone FIRST


<a id="org3c74105"></a>

### Containers are an option (LXC or Docker) but apparently getting GUI apps running in them is hard.

1.  <https://beebom.com/how-run-multiple-distros-using-linux-containers/>


<a id="orgd0e3d73"></a>

### Doesn't solve that option, but be aware of firejail for sandboxing apps

1.  <https://beebom.com/how-sandbox-non-trusted-apps-linux-systems/>


<a id="org706ec0e"></a>

## TODO Conky - Very nice, themable system info/clock/weather/whatever overlay:


<a id="org2d03799"></a>

### <https://github.com/brndnmtthws/conky>


<a id="org721d4ee"></a>

### How to:

1.  <https://www.lifewire.com/beginners-guide-to-conky-4043352>

2.  <https://itsfoss.com/conky-gui-ubuntu-1304/>


<a id="org434cf14"></a>

### Examples:

1.  <https://yesthisisme.deviantart.com/art/Conky-Conky-Conky-174343321>

2.  <https://devuno.deviantart.com/art/Dirty-Conky-179991956>

3.  <https://aaika.deviantart.com/art/Gobilum-Conky-1-0-303327080>


<a id="org7066230"></a>

### LIST: <https://www.deviantart.com/whats-hot/?q=conky+themes&offset=0>
