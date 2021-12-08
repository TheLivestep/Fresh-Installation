#!/bin/bash

############################################
#               Version 2.0                #
#                                          #
#           Added Help function            #
#           Added Command Arguments        #
#           Added List of Programs         #
############################################ 


# VARIABLES

list="
\n
\e[1;32mThe list of programs you can install:\e[0m
\n
use '-m <program>' to see more information.
\n
\n
update\n
nvidia\n
media\n
pwncat\n
terminator\n
pspy64\n
gedit\n
autorecon\n
sshuttle\n
chisel\n
peass\n
rlwrap\n
evilwinrm\n
studio_code\n
bloodhound\n
ansible\n
openvas\n
rockyou\n
sublime\n
kalimetapackages\n
firefox_plugins\n
add_user
"
update="
\n
Update the Repos,\n
Upgrade and Auto Remove\n
\n
\e[1;32mCommands Used:\e[0m\n
\n
apt update && apt upgrade -y && apt auto-remove -y
"
nvidia="
\n
https://www.kali.org/docs/general-use/install-nvidia-drivers-on-kali-linux/
\n
\n
\e[1;32mSTANDALONE INSTALLATION\e[0m
\n
Do not attempt this in a VM. It is possible in theory, however this likely will not work and we do not recommend that users attempt this.
\n
Once the system has rebooted from doing an OS upgrade, we will proceed to install the Drivers, and the CUDA toolkit (allowing for tool to take advantage of the GPU).
\n
During installation of the drivers the system created new kernel modules, so a reboot is required
"
media="
\n
https://linuxhint.com/install_multimedia_codecs_debian_10/
\n\n
Some codecs are free while others are proprietary in nature. So, most of them are not included on open source operating systems like Debian. As these codecs are not included, you can’t play every type of audio and video files once you install a fresh copy of Debian.
"
pwncat="
\n
https://github.com/calebstewart/pwncat
\n\n
pwncat is a post-exploitation platform. It started out as a wrapper around basic bind and reverse shells and has grown from there. It streamlines common red team operations while staging code from your attacker machine, not the target.
\n
The installation is done using a Python Environment in /opt/envs/pwncat.
\n
Need to activate using this command in the directory:
\n
source pwncat-env/bin/activate
"
terminator="
\n
https://www.geeksforgeeks.org/terminator-a-linux-terminal-emulator/
\n
As the name suggests, ‘Terminator’ is a pretty badass emulator which provides you with functionalities like split horizontally, split vertically, etc, as one wants in a single window. Not only does it provide split horizontally or vertically, but, also one can give a custom title to each and every terminal and several other features such as multigrid-like structure, layouts savings, etc.
"
pspy64="
\n
https://github.com/DominicBreuker/pspy
\n\n
pspy is a command line tool designed to snoop on processes without need for root permissions. It allows you to see commands run by other users, cron jobs, etc. as they execute. Great for enumeration of Linux systems in CTFs.
"
gedit="
\n
https://geek-university.com/linux/gedit-text-editor/
\n\n
gedit is a powerful general purpose text editor in Linux. It is the default text editor of the GNOME desktop environment. One of the neatest features of this program is that it supports tabs, so you can edit multiple files.
"
autorecon="
\n
https://github.com/Tib3rius/AutoRecon
\n\n
AutoRecon is a multi-threaded network reconnaissance tool which performs automated enumeration of services. It is intended as a time-saving tool for use in CTFs and other penetration testing environments (e.g. OSCP). It may also be useful in real-world engagements.
\n\n
\e[1;32mSupporting packages:\e[0m
\n
seclists\n
curl\n
enum4linux\n
feroxbuster\n
impacket-scripts\n
nbtscan\n
nikto\n
nmap\n
onesixtyone\n
oscanner\n
redis-tools\n
smbclient\n
smbmap\n
snmpwalk\n
sslscan\n
svwar\n
tnscmd10g\n
whatweb\n
wkhtmltopdf
"
sshuttle="
\n
https://github.com/sshuttle/sshuttle
\n\n
sshuttle: where transparent proxy meets VPN meets ssh
"
chisel="
\n
https://github.com/jpillora/chisel
\n\n
Chisel is a fast TCP/UDP tunnel, transported over HTTP, secured via SSH. Single executable including both client and server. Written in Go (golang). Chisel is mainly useful for passing through firewalls, though it can also be used to provide a secure endpoint into your network.
"
peass="
\n
https://github.com/carlospolop/PEASS-ng
\n\n
PEASS-ng - Privilege Escalation Awesome Scripts SUITE new generation
"
rlwrap="
\n
https://linux.die.net/man/1/rlwrap
\n\n
rlwrap runs the specified command, intercepting user input in order to provide readline's line editing, persistent history and completion.
"
evilwinrm="
\n
https://github.com/Hackplayers/evil-winrm
\n\n
WinRM (Windows Remote Management) is the Microsoft implementation of WS-Management Protocol. A standard SOAP based protocol that allows hardware and operating systems from different vendors to interoperate. Microsoft included it in their Operating Systems in order to make life easier to system administrators.
"
studio_code="
\n
https://code.visualstudio.com/
\n\n
Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux. It comes with built-in support for JavaScript, TypeScript and Node.js and has a rich ecosystem of extensions for other languages (such as C++, C#, Java, Python, PHP, Go) and runtimes (such as .NET and Unity).
"
bloodhound="
\n
https://github.com/BloodHoundAD/BloodHound
\n\n
BloodHound uses graph theory to reveal the hidden and often unintended relationships within an Active Directory environment. Attackers can use BloodHound to easily identify highly complex attack paths that would otherwise be impossible to quickly identify. Defenders can use BloodHound to identify and eliminate those same attack paths. Both blue and red teams can use BloodHound to easily gain a deeper understanding of privilege relationships in an Active Directory environment.
\n
The Ingestors will be stored in /opt/AD/bloodhound
"
ansible="
\n
https://www.ansible.com/
\n\n
Ansible delivers simple IT automation that ends repetitive tasks and frees up DevOps teams for more strategic work.
"
openvas="
\n
https://www.openvas.org/
\n\n
\e[1;32mSTANDALONE INSTALLATION\e[0m
\n
OpenVAS is a full-featured vulnerability scanner. Its capabilities include unauthenticated and authenticated testing, various high-level and low-level internet and industrial protocols, performance tuning for large-scale scans and a powerful internal programming language to implement any type of vulnerability test.
"
rockyou="
\n
rockyou. txt contains the most frequently used passwords sorted by frequency. It is not really effective against targets with good password policies.
\n\n
It will unzip the rockyou.txt to /usr/share/wordlists
"
sublime="
\n
https://www.sublimetext.com/
\n\n
The sophisticated text editor for code, markup and prose.
"
kalimetapackages="
\n
https://www.kali.org/docs/general-use/metapackages/
\n\n
\e[1;32mSTANDALONE INSTALLATION\e[0m
\n
Metapackages are used to install many packages at one time, created as a list of dependencies on other packages. Kali Linux uses these in a few ways. One way is allowing users to decide how many packages out of the total Kali list they would like to install.
"
firefox_plugins="
\n
\e[1;32mFirefox Plugins:\e[0m
\n\n
FOXYPROXY\t       https://addons.mozilla.org/pt-PT/firefox/addon/foxyproxy-standard/
\n
WAPPALYZER\t       https://addons.mozilla.org/pt-PT/firefox/addon/wappalyzer/
\n
HACK-TOOLS\t       https://addons.mozilla.org/pt-PT/firefox/addon/hacktools/
\n
COOKIE EDITOR\t    https://addons.mozilla.org/pt-PT/firefox/addon/cookie-editor/
"
add_user="
\n\n
Add a new user and add the user to Sudo Group
"


## INDICATORS / BANNERS
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



##FUNCTIONS##

# Check if is root

function isroot(){

    if [ $(id -u) -eq 0 ]; then
        echo -e "$greenexclaim Lets Proceed!"
    else
        echo -e "$redexclaim You must be root to run this script!!"
        exit 1 
    fi    
}
# BANNER
function banner_up(){
    echo -n -e "\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n\n"
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
function full_update(){
        echo -e "$greenminus Updating and Upgrading..."
        apt update 
        apt upgrade -y 
        apt autoremove -y 
        echo -e "$greenplus All updated!"
}

# Install Graphics Drivers NVIDIA
function nvidia_drivers(){
    echo -e "$greenminus Instaling Nvidia Drivers..."
    apt install -y ocl-icd-libopencl1 nvidia-driver nvidia-cuda-toolkit
    echo -e "$greenplus Success in instaling Nvidia Drivers!"
}

# Install Media Codecs

function media_codecs(){
    echo -e "$greenminus Installing Media Codecs..."
    apt install libdvdnav4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg -y
    dpkg-reconfigure libdvd-pkg
    echo -e "$greenplus Installed Media Codecs with success!"
}

# Install PWNCAT

function pwncat_env(){
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
function terminator_t(){
    echo -e "$greenminus Installing terminator..."
    apt install terminator -y
    echo -e "$greenplus Terminator Installed with success!"
}

# Download PSPY64
function pspy(){
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
function gedit_t(){
    echo -e "$greenminus Installing gedit..."
    apt install gedit -y
    echo -e "$greenplus Gedit installed with success!"
}

# Install Auto-recon
function autorecon_env(){
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
function sshuttle_p(){
    echo -e "$greenminus Installing sshuttle..."
    apt-get install sshuttle -y
    echo -e "$greenplus sshuttle installed with success!"
}

# Install Chisel
function chisel_p(){
    echo -e "$greenminus Installing chisel..."
    apt install chisel -y
    echo -e "$greenplus Chisel Installed with success!"
}

# Install LinPEAS & WinPEAS
function peass_pe(){
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
function rlwrap_s(){
    echo -e "$greenminus Installing rlwrap..."
    apt install rlwrap -y
    echo -e "$greenplus Rlwrap installed with success!" 
}

# Install Evil-Winrm
function evil-winrm_l(){
    echo -e "$greenminus Installing evil-winrm..."
    gem install evil-winrm 
    echo -e "$greenplus Evil-winrm installed with success!"
}

# Install Visual Studio Code
function code_v(){
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
function bloodhound_pe(){
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
function ansible_at(){
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
function openvas_v(){
    echo -e "$greenminus Installing OpenVAS..."
    apt install gvm -y 
    echo -e "$greenminus Setting and Configuring OpenVAS, it will take a long time..."
    gvm-setup
    apt install greenbone-security-assistant
    echo -e "$greenplus OpenVAS installed with success!"
}

# GunZip Rockyou
function rockyou_t(){
    echo -e "$greenminus Gunziping Rockyou..."
    cd /usr/share/wordlists
    gzip -dq /usr/share/wordlists/rockyou.txt.gz
    echo -e "$greenplus You can find rockyou.txt in /usr/share/wordlists/rockyou.txt!"
}

# Install sublime
function sublime_t(){
    echo -e "$greenminus Installing sublime..."
    echo -e "$greenminus Adding key..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
    echo -e "$greenminus Installing dependencies..."
    apt install apt-transport-https -y
    echo -e "$greenminus Adding repo to sources list..."
    echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list
    apt update
    apt -y install sublime-text
    echo -e "$greenplus Sublime installed with success!"
}

# Install kali MetaPackages
function kali_meta_k(){
    echo -e "$greenminus Installing all kali metapackages..."
    apt install kali-linux-everything
    echo -e "$greenplus All kali metapackages installed with success!"
}

# Show Firefox PlugIns in Browser (open tabs)
function plugins_f(){
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
    full_update
    media_codecs
    pwncat_env
    terminator_t
    pspy
    gedit_t
    autorecon_env
    sshuttle_p
    chisel_p
    peass_pe
    rlwrap_s
    evil-winrm_l
    code_v
    bloodhound_pe
    ansible_at
    rockyou_t
    sublime_t
    plugins_f
    banner_up
}

# FUNCTION HELP
function help() {
    clear
    banner_up
    echo -e "
\e[1;33m------------------------------------------\e[0m

 \033[1;32mUsage:\e[0m

 sudo ./fresh_kali_installer.sh
 Choose the option you want from the Menu.

 \033[1;32mOptional Command Arguments:\e[0m

 -h               :Show Help
 -l               :List all programs
 -m <program>     :Show more information about the program
 -A               :Install All (minus the StandAlone)    
"
}

# MENU
function menu(){
    clear
    banner_up
    echo -e " \e[1;33m------------------------------------------\e[0m"
    echo -e "\n $(tput bold)$(tput setaf 4)SELECT AN OPTION FROM THE MENU:  $(tput sgr 0)"
    echo -e " \033[1;32mKEY\e[0m   |   \033[1;32mOPTION\e[0m            |       \033[1;32mDESCRIPTION\e[0m"
    echo -e ""
    echo -e "  0    |   SHOW HELP         | Show instructions and command options"
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
        0) help;;
        51) adduser_new;;
        1) full_update;;
        54) nvidia_drivers;;
        2) media_codecs;;
        3) pwncat_env;;
        4) terminator_t;;
        5) pspy;;
        6) gedit_t ;;
        7) autorecon_env;;
        8) sshuttle_p;;
        9) chisel_p;;
        10) peass_pe;;
        11) rlwrap_s;;
        12) evil-winrm_l;;
        13) code_v;;
        14) bloodhound_pe;;
        15) ansible_at;;
        53) openvas_v;;
        16) rockyou_t ;;
        17) sublime_t;;
        52) kali_meta_k;;
        18) plugins_f;;
        99) all;;
        x|X) banner_up;;
    esac
}

# START

is root
clear

if [ $# -eq 0 ] ; then
    menu
else
    while getopts 'hlAm:' option; do
        case "$option" in
            h) 
                clear
                help
                ;;
            l) 
                clear
                echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"
                echo -e $list
                ;;
            A)
                all
                ;;
            m)  
                case $OPTARG in
                    update)
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"
                        echo -e $update 
                        ;;
                    nvidia)
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n" 
                        echo -e $nvidia 
                        ;;
                    media)
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"  
                        echo -e $media 
                        ;;
                    pwncat) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"
                        echo -e $pwncat 
                        ;;
                    terminator) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"
                        echo -e $terminator 
                        ;;
                    pspy64) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"
                        echo -e $pspy 
                        ;;
                    gedit) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n" 
                        echo -e $gedit 
                        ;;
                    autorecon)
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n" 
                        echo -e $autorecon 
                        ;;
                    sshuttle) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"  
                        echo -e $sshuttle 
                        ;;
                    chisel) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"    
                        echo -e $chisel 
                        ;;
                    peass) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"     
                        echo -e $peass 
                        ;;
                    rlwrap) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"    
                        echo -e $rlwrap 
                        ;;     
                    evil-winrm) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"
                        echo -e $evilwinrm 
                        ;;
                    studio_code)  
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"  
                        echo -e $studio_code 
                        ;;
                    bloodhound) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"    
                        echo -e $bloodhound 
                        ;;
                    ansible) 
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"       
                        echo -e $ansible 
                        ;;
                    openvas)  
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"      
                        echo -e $openvas 
                        ;;
                    rockyou)
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"        
                        echo -e $rockyou 
                        ;;
                    sublime)
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"        
                        echo -e $sublime 
                        ;;
                    kalimetapackages)
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"   
                        echo -e $kalimetapackages 
                        ;;
                    firefox_plugins)  
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"  
                        echo -e $firefox_plugins 
                        ;;
                    add_user)   
                        echo -e "\n\e[1;34m$banner\e[0m \e[1;35m2.0\e[0m\n"        
                        echo -e $add_user 
                        ;;
                    *)                        
                        help
                        echo -e "\n\n$redexclaim Need to choose a program!"
                        ;;
                esac
                ;;
            *)  
                echo -e "$redexclaim Invalid Command\n"
                sleep 1
                menu 
                ;;
        esac
    done   
fi      

