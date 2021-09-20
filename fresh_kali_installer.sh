#!/bin/bash

# VARIABLES

## INDICATORS
greenplus='\e[1;32m[+]\e[0m'
greenminus='\e[1;32m[-]\e[0m'
redminus='\e[1;31m[-]\e[0m'
redexclaim='\e[1;31m[!]\e[0m'
greenexclaim='\e[1;31m[!]\e[0m'
redstar='\e[1;32m[*]\e[0m'
note='echo "$(tput bold)$(tput setaf 1)$(tput setab 7)NOTE:$(tput sgr 0)"'
banner=$(base64 -d <<< "H4sIAAAAAAAAA2VQWw4DIQj89xT87TZp6gX2KCbTg8zhCwy6ttVEkHkINjPksn3hjoUga79M3Mle
bkZxuRVpnLFbV3biYUxj/vEy2QzClIiH4kC2BpWCe7hnAJShtMmdvAn7xvSpTl0OuN5Gr5uNsLAr
XN+rFcVj8VJUcMrDh03sEjlnICDWfnl+gguP3pQXj1+wP0GNH5+Ux4iJfHD0KQYHvPoEoXv+vhCo
gxsehblp+wBoHCzsAAIAAA==" | gunzip)
signature=$(base64 -d <<<"H4sIAAAAAAAAA2WMQQqAMAwE731FnuoDPFTYoIgFQSgIHn3RvsQmpRXxkGSz2QwxElGIy0uo2ds7
QY3U+SvyzzERiI24C5BAwRGLQSZv1LVlk6+HuGWPHurm7mYKDhkMUqBikLNeiqi/qSNSF9KvLSrh
ARqpKbTmAAAA" | gunzip)

# Check if is root

function isroot(){

    if [ $(id -u) -eq 0 ]; then
        echo -e "$greenexclaim YOU ARE ROOT, lets proceed..."
    else
        echo "You must be root to run this script!!"
        exit 1 
    fi    
}
# BANNER
function banner_up(){
    echo -n -e "\e[1;34m$banner\e[0m \e[1;35m1.0\e[0m\n\n"
    echo -e "\e[1;36m$signature\e[0m \e[1;35m$(date +%x)\e[0m\n"
}

# ADD USER and ADD TO SUDO GROUP
function adduser_new(){
	read -p "Enter username : " username
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo -e "\n$redexclaim $username exists!"
		exit 1
	else
		adduser $username --shell '/usr/bin/zsh' --gecos --quiet
		adduser $username sudo
	fi  
}

# Function to update and upgrade
function update(){
        echo -e "$greenminus Updating and Upgrading..."
        apt update 
        apt upgrade -y 
        apt autoremove -y 
        echo -e "$greenplus All updated!"
}

# Install Graphics Drivers NVIDIA
function nvidia(){
    echo -e "$greenminus Instaling Nvidia Drivers..."
    apt install -y ocl-icd-libopencl1 nvidia-driver nvidia-cuda-toolkit
    echo -e "$greenplus Success in instaling Nvidia Drivers!"
}

# Install Media Codecs

function media(){
    echo -e "$greenminus Installing Media Codecs..."
    apt install libdvdnav4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg -y
    dpkg-reconfigure libdvd-pkg
    echo -e "$greenplus Installed Media Codecs with success!"
}

# Install PWNCAT

function pwncat(){
    echo -e "$greenminus Installing pwncat..."
    if [ -d "/opt/envs" ]; then
        mkdir /opt/envs/pwncat
    else
        mkdir -p /opt/envs/pwncat
    fi
    echo -e "$greenminus Creating Python environment in /opt/envs/pwncat..."
    apt install python3.9-venv -y
    cd /opt/envs/pwncat
    python3 -m venv pwncat-env
    source pwncat-env/bin/activate
    apt install python3-pip -y
    pip install git+https://github.com/calebstewart/pwncat.git
    deactivate
    echo -e "$greenplus Environment Created in /opt/envs/pwncat!"
}

# Install Terminator
function terminator(){
    echo -e "$greenminus Installing terminator..."
    apt install terminator -y
    echo -e "$greenplus Terminator Installed with success!"
}

# Download PSPY64
function pspy64(){
    echo -e "$greenminus Downloading pspy64..."
    if [ -d "/opt/privesc" ]; then
        mkdir /opt/privesc/pspy64
    else
        mkdir -p /opt/privesc/pspy64
    fi
    cd /opt/privesc/pspy64
    wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
    chmod +x pspy64
    echo -e "$greenplus pspy64 is in /opt/privesc/pspy64!!"
}

#Install gedit
function gedit(){
    echo -e "$greenminus Installing gedit..."
    apt install gedit -y
    echo -e "$greenplus Gedit installed with success!"
}

# Install Auto-recon
function autorecon(){
    echo -e "$greenminus Installing autorecon in a Python environment..."
    if [ -d "/opt/envs" ]; then
        mkdir /opt/envs/autorecon
    else
        mkdir -p /opt/envs/autorecon
    fi
    echo -e "$greenminus Creating Python environment in /opt/envs/autorecon..."
    apt install python3.9-venv -y
    cd /opt/envs/autorecon
    python3 -m venv autorecon-env
    source autorecon-env/bin/activate
    apt install python3-pip -y
    apt install seclists curl enum4linux feroxbuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf -y 
    pip install git+https://github.com/Tib3rius/AutoRecon.git
    deactivate
    echo -e "$greenplus Python environment created in /opt/envs/autorecon!"
}

# Install SSHuttle
function sshuttle(){
    echo -e "$greenminus Installing sshuttle..."
    apt-get install sshuttle -y
    echo -e "$greenplus sshuttle installed with success!"
}

# Install Chisel
function chisel(){
    echo -e "$greenminus Installing chisel..."
    apt install chisel -y
    echo -e "$greenplus Chisel Installed with success!"
}

# Install LinPEAS & WinPEAS
function peass(){
    echo -e "$greenminus Cloning PEASS repository to /opt/privesc/PEASS..."
    if [ -d "/opt/privesc" ]; then
        mkdir /opt/privesc/PEASS
    else
        mkdir -p /opt/privesc/PEASS
    fi
    cd /opt/privesc/PEASS
    wget https://github.com/carlospolop/PEASS-ng.git
    echo -e "$greenplus PEAS repository cloned with success!"
}

# Install rlwrap
function rlwrap(){
    echo -e "$greenminus Installing rlwrap..."
    apt install rlwrap -y
    echo -e "$greenplus Rlwrap installed with success!" 
}

# Install Evil-Winrm
function evil-winrm(){
    echo -e "$greenminus Installing evil-winrm..."
    gem install evil-winrm -y
    echo -e "$greenplus Evil-winrm installed with success!"
}

# Install Visual Studio Code
function code(){
    echo -e "$greenminus Installing Visual Studio Code..."
    echo -e "$greenminus Installing dependencies..."
    apt install curl gpg software-properties-common apt-transport-https -y 
    echo -e "$greenminus Adding key..."
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    echo -e "$greenminus Adding vscode microsoft repo to sources list..."
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    apt update
    apt install code -y
    echo -e "$greenplus Visual Studio Code installed with success!"
}

# Install Bloodhound
function bloodhound(){
    echo -e "$greenminus Installing Bloodhound..."
    apt install bloodhound -y 
    # Download the Ingestors
    echo -e "$greenminus Downloading the ingestor to /opt/AD..."
    if [ -d "/opt/AD" ]; then
        mkdir /opt/AD/bloodhound
    else
        mkdir -p /opt/AD/bloodhound
    fi
    cd /opt/AD/bloodhound
    wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/AzureHound.ps1
    wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe
    wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.ps1
    echo -e "$greenplus Bloodhound installed and Ingestors downloaded with success!"
}

# Install Ansible
function ansible(){
    echo -e "$greenminus Installing Ansible..."
    echo -e "$greenminus Adding repo to sources list..."
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee /etc/apt/sources.list.d/ansible.list
    echo -e "$greenminus Adding Key..."
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    apt update
    apt install ansible -y
    echo -e "$greenplus Ansible installed with success!"
}

# Install OpenVAS
function openvas(){
    echo -e "$greenminus Installing OpenVAS..."
    apt install gvm -y 
    echo -e "$greenminus Setting and Configuring OpenVAS, it will take a long time..."
    gvm-setup
    apt install greenbone-security-assistant
    echo -e "$greenplus OpenVAS installed with success!"
}

# GunZip Rockyou
function rockyou(){
    echo -e "$greenminus Gunziping Rockyou..."
    cd /usr/share/wordlists
    gzip -dq /usr/share/wordlists/rockyou.txt.gz
    echo -e "$greenplus You can find rockyou.txt in /usr/share/wordlists/rockyou.txt!"
}

# Install sublime
function sublime(){
    echo -e "$greenminus Installing sublime..."
    echo -e "$greenminus Adding key..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
    echo -e "$greenminus Installing dependencies..."
    apt install apt-transport-https -y
    echo -e "$greenminus Adding repo to sources list..."
    echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list
    update
    apt -y install sublime-text
    echo -e "$greenplus Sublime installed with success!"
}

# Install kali MetaPackages
function kali_meta(){
    echo -e "$greenminus Installing all kali metapackages..."
    apt install kali-linux-everything
    echo -e "$greenplus All kali metapackages installed with success!"
}

# # Install TorGhost
# function torghost(){
#     echo -e "$greenminus Cloning torghost repository..."
#     cd /opt
#     git clone https://github.com/susmithHCK/torghost.git
#     cd torghost
#     apt install python3.9-dev
#     chmod +x build.sh
#     /opt/torghost/build.sh
#     echo -e "$greenplus Torghost installed with success!"
# }

# Show Firefox PlugIns in Browser (open tabs)
function plugins(){
    echo ""
    echo -e "$greenplus List of plugins/extensions:"
    echo -e "\n"
    echo -e "$redstar FOXYPROXY        https://addons.mozilla.org/pt-PT/firefox/addon/foxyproxy-standard/"
    echo -e "$redstar WAPPALYZER       https://addons.mozilla.org/pt-PT/firefox/addon/wappalyzer/"
    echo -e "$redstar HACK-TOOLS       https://addons.mozilla.org/pt-PT/firefox/addon/hacktools/"
    echo -e "$redstar COOKIE EDITOR    https://addons.mozilla.org/pt-PT/firefox/addon/cookie-editor/"
    echo -e "\n"
}


# RUN ALL
function all(){
    update
    media
    pwncat
    terminator
    pspy64
    gedit
    autorecon
    sshuttle
    chisel
    peass
    rlwrap
    evil-winrm
    code
    bloodhound
    ansible
    rockyou
    sublime
    #torghost
    plugins
    banner_up
}

# MENU
function menu(){
    clear
    banner_up
    echo -e " \e[1;33m------------------------------------------\e[0m"
    echo -e "\n $(tput bold)$(tput setaf 4)SELECT AN OPTION FROM THE MENU:  $(tput sgr 0)"
    echo -e " \033[1;32mKEY\e[0m   |   \033[1;32mOPTION\e[0m            |       \033[1;32mDESCRIPTION\e[0m"
    echo -e ""
    echo -e "  1    |   UPDATE & UPGRADE  | Update and upgrade (auto-remove also)"
    echo -e "  2    |   MEDIA DRIVERS     | Install the media drivers"
    echo -e "  3    |   PWNCAT            | Install pwncat in an $(tput bold)$(tput setaf 1)$(tput setab 0)Python Environment$(tput sgr 0)"
    echo -e "  4    |   TERMINATOR        | Install Terminator"
    echo -e "  5    |   PSPY64            | Download pspy64 to /opt/privesc"
    echo -e "  6    |   GEDIT             | Install gedit"
    echo -e "  7    |   AUTORECON         | Install autorecon in an $(tput bold)$(tput setaf 1)$(tput setab 0)Python Environment$(tput sgr 0)"
    echo -e "  8    |   SSHUTTLE          | Install sshuttle"
    echo -e "  9    |   CHISEL            | Install chisel"
    echo -e " 10    |   PEASS             | Clone the PEASS repository to /opt/privesc"
    echo -e " 11    |   RLWRAP            | Install rlwrap"
    echo -e " 12    |   EVIL-WINRM        | Install evil-winrm"
    echo -e " 13    |   STUDIO CODE       | Install visual studio code"
    echo -e " 14    |   BLOODHOUND        | Install bloodhound and download the ingestors to /opt/AD/bloodhound"
    echo -e " 15    |   ANSIBLE           | Install ansible"
    echo -e " 16    |   ROCKYOU           | Gunzip the rockyou wordlist"
    echo -e " 17    |   SUBLIME           | Install sublime"
    echo -e " 18    |   PLUGINS           | Shows links for the extensions pages to install"
    echo -e " 99    |   $(tput bold)$(tput setaf 1)$(tput setab 0)ALL$(tput sgr 0)               | $(tput bold)$(tput setaf 1)$(tput setab 0)Install ALL THE ABOVE$(tput sgr 0)"
    #echo -e " \n"
    echo -e " $(tput bold)$(tput setaf 0)$(tput setab 6)ONLY STANDALONE FUNCTIONS$(tput sgr 0)"
    echo -e " 51    |   ADD A NEW USER    | Permits to add a new user and add the user in SUDO group"
    echo -e " 52    |   METAPACKAGES      | Install all KALI metapackages"
    echo -e " 53    |   OPENVAS           | Install openVAS $(tput bold)$(tput setaf 1)$(tput setab 0)(Takes about 1-2 hours to complete instalation)$(tput sgr 0)"
    echo -e " 54    |   NVIDIA DRIVERS    | Install Nvidia Drivers"
    # USER INPUT
    echo " "
    echo -e " \e[1;33m------------------------------------------\e[0m"
    read -p "$(tput bold)$(tput setaf 5)Choose key for menu item selection or press X to exit: $(tput sgr 0)" key_selected
    echo " "

    case $key_selected in
        51) adduser_new;;
        1) update;;
        54) nvidia;;
        2) media;;
        3) pwncat;;
        4) terminator;;
        5) pspy64;;
        6) gedit ;;
        7) autorecon;;
        8) sshuttle;;
        9) chisel;;
        10) peass;;
        11) rlwrap;;
        12) evil-winrm;;
        13) code;;
        14) bloodhound;;
        15) ansible;;
        53) openvas;;
        16) rockyou ;;
        17) sublime;;
        52) kali_meta;;
        18) plugins;;
        99) all;;
        x|X) banner_up;;
    esac
}

isroot
menu

