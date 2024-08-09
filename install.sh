#!/bin/bash
#date 			:	220
#author			:	batan
#description	:	the script creates 4 files, 2 executable bin files,	one lc-cd file
#					consisting of a list of directories and one a execute and cleanup script. 
#					Just run <code> sudo -u $USER bash install_lc-cd.sh</code> and the scripts, yeah the scripts.
#					modiefies permissions and moves then 2x to /usr/bin/, the list
#					lives for now in $HOME/
#---------------------------------------------------------------------------------------#
clear

###   CREATE LC-CD-CUT-LIST   ############################################
lc-cd-list=$(mktemp /tmp/tmp_file.XXXXXX)
$lc-cd-list << EOL > cut
#!/bin/bash
cat $1 | sed 's/#.*//g' | sed '/^\s*$/d'
EOL
echo $lc-cd-list >> lc-cd-cuts-list
sudo chmod a+x lc-cd-cuts-list
sudo mv lc-cd-cuts-list /usr/bin/

###   CREATE LC-CD-CUTS-GLOBAL-ECHO   ####################################
lc-cd-cuts-global=$(mktemp /tmp/lc-cd-cuts-global.XXXXXX)
$lc-cd-cuts-global << EOL > cut
#!/bin/bash
system_wide_filelist=''
user_filelist=''
if [ -r /etc/cdg_paths ]; then
   system_wide_filelist=$(cdscuts_list_echo /etc/cdg_paths)
fi
if [ -r ~/.lc-cd ]; then
   user_filelist=$(/usr/bin/lc-cd-cuts-list ~/.lc-cd)
fi
echo -e "$system_wide_filelist\n$user_filelist" | sed '/^\s*$/d'
EOL
echo $lc-cd-cuts-global >> lc-cd-cuts-global-echo
sudo chmod a+x lc-cd-cuts-global-echo
sudo mv lc-cd-cuts-global-echo /usr/bin/

###   CREATE LC_CD LIST OF DIRECTORIES   ############################################
lc-cd=$(mktemp /tmp/lc-cd.XXXXXX)
$lc-cd << EOL > cut
/home/batan/1/
/home/batan/10/
/home/batan/100/
/home/batan/Books/
/home/batan/check/
/home/batan/Desktop/
/home/batan/Documents/
/home/batan/dot/
/home/batan/Downloads/
/home/batan/etc/
/home/batan/FILES/
/home/batan/lc-deb/
/home/batan/linux-tool-configs/
/home/batan/Music/
/home/batan/MX/
/home/batan/mx-gpg-keys/
/home/batan/Pictures/
/home/batan/Public/
/home/batan/tasknote/
/home/batan/taskwarrior/
/home/batan/Templates/
/home/batan/train/
/home/batan/Videos/
/media/batan/100/1.tar.xz
/media/batan/100/ALPINE_Installed.WIKI
/media/batan/100/AMIGA
/media/batan/100/bash_history
/media/batan/100/Books
/media/batan/100/etc
/media/batan/100/EXTENTION
/media/batan/100/firewall
/media/batan/100/fstab
/media/batan/100/github
/media/batan/100/HTML
/media/batan/100/ISO
/media/batan/100/kali-linux-complete-training-program-from-scratch
/media/batan/100/key-bind_mx.wiki
/media/batan/100/lc-commands.tar.gz
/media/batan/100/live.install.wiki
/media/batan/100/mashpodder
/media/batan/100/MD
/media/batan/100/Music
/media/batan/100/MX
/media/batan/100/New
/media/batan/100/PCSX2
/media/batan/100/Q4OS
/media/batan/100/RETRO-GAMING
/media/batan/100/SH120
/media/batan/100/software
/media/batan/100/TTC
/media/batan/100/USB
/media/batan/100/Videos
/media/batan/100/wiki.bash-hackers.org
/home/batan/10/html/
/home/batan/10/menu/
/home/batan/10/notes/
/home/batan/10/postinstall/
/home/batan/10/tasks/
/home/batan/10/vimwiki/
/home/batan/10/vimwiki_html/
/home/batan/10/X-REVISION/
/home/batan/100/100/
/home/batan/100/138/
/home/batan/100/awesome-cheatsheets/
/home/batan/100/CACHEFIRE/
/home/batan/100/chromium.mx.ungoogled/
/home/batan/100/firefox/
/home/batan/100/icons/
/home/batan/100/lc-block/
/home/batan/100/linux-tool-configs/
/home/batan/100/markdown/
/home/batan/100/SH120/
/home/batan/100/sounds/
/home/batan/100/Top-5-Bootloader-Themes/
/home/batan/100/UNGOOGLED/
/home/batan/10/html/homepage/1/
/home/batan/10/html/homepage/ag-html-editor/
/home/batan/10/html/homepage/bookmarks/
/home/batan/10/html/homepage/bookmarks.140/
/home/batan/10/html/homepage/books/
/home/batan/10/html/homepage/color/
/home/batan/10/html/homepage/curtain/
/home/batan/10/html/homepage/ext/
/home/batan/10/html/homepage/GPT/
/home/batan/10/html/homepage/media-player/
/home/batan/10/html/homepage/movie-library/
/home/batan/10/html/homepage/services/
/home/batan/10/html/homepage/ventoy-1.0.97/
/home/batan/10/html/homepage/videoplayer/
/usr/share/fonts
/usr/share/themes
/usr/share/backgrounds
/usr/share/doc
/media/batan/
/media/batan/roms
/media/batan/100
/media/batan/
/media/batan/
/media/batan/roms
/media/batan/35_GB_EXT
/media/batan/rootMX23
/media/batan/9f7d0480-32ad-453e-babd-7871d309edce
/media/batan/sdb9
/media/batan/100
/media/batan/Ventoy
/media/batan/e888cd45-a071-450e-be01-619792c81fb8
/media/batan/100/$RECYCLE.BIN/
/media/batan/100/AMIGA/
/media/batan/100/Books/
/media/batan/100/etc/
/media/batan/100/EXTENTION/
/media/batan/100/firewall/
/media/batan/100/github/
/media/batan/100/HTML/
/media/batan/100/ISO/
/media/batan/100/kali-linux-complete-training-program-from-scratch/
/media/batan/100/mashpodder/
/media/batan/100/MD/
/media/batan/100/Music/
/media/batan/100/MX/
/media/batan/100/New/
/media/batan/100/PCSX2/
/media/batan/100/Q4OS/
/media/batan/100/RETRO-GAMING/
/media/batan/100/SH120/
/media/batan/100/software/
/media/batan/100/TTC/
/media/batan/100/USB/
/media/batan/100/Videos/
/media/batan/100/wiki.bash-hackers.org/
/home/batan/10/vimwiki/diary/
/home/batan/10/vimwiki/templates/
/home/batan/10/vimwiki/vimwiki/
/home/batan/10/vimwiki/vimwiki10/
/home/batan/10/vimwiki/vimwiki10_html/
/home/batan/10/vimwiki/vimwiki2/
/home/batan/10/vimwiki/vimwiki2_html/
/home/batan/10/vimwiki/vimwiki3/
/home/batan/10/vimwiki/vimwiki3_html/
/home/batan/10/vimwiki/vimwiki4/
/home/batan/10/vimwiki/vimwiki4_html/
/home/batan/10/vimwiki/vimwiki5/
/home/batan/10/vimwiki/vimwiki5_html/
/home/batan/10/vimwiki/vimwiki6/
/home/batan/10/vimwiki/vimwiki6_html/
/home/batan/10/vimwiki/vimwiki7/
/home/batan/10/vimwiki/vimwiki7_html/
/home/batan/10/vimwiki/vimwiki8/
/home/batan/10/vimwiki/vimwiki8_html/
/home/batan/10/vimwiki/vimwiki9/
/home/batan/10/vimwiki/vimwiki9_html/
/home/batan/10/vimwiki/vimwiki_html/
/home/batan/.config/autostart/
/home/batan/.config/autostart-scripts/
/home/batan/.config/cheat/
/home/batan/.config/chromium/
/home/batan/.config/dconf/
/home/batan/.config/falkon/
/home/batan/.config/fontconfig/
/home/batan/.config/gtk-2.0/
/home/batan/.config/gtk-3.0/
/home/batan/.config/gtk-4.0/
/home/batan/.config/i3/
/home/batan/.config/kdeconnect/
/home/batan/.config/kitty/
/home/batan/.config/lazpaint/
/home/batan/.config/lxqt/
/home/batan/.config/menus/
/home/batan/.config/mpv/
/home/batan/.config/musikcube/
/home/batan/.config/MX-Linux/
/home/batan/.config/nvim/
/home/batan/.config/openbox/
/home/batan/.config/pcmanfm-qt/
/home/batan/.config/PCSX2/
/home/batan/.config/pulse/
/home/batan/.config/qtcurve/
/home/batan/.config/ranger/
/home/batan/.config/rofi/
/home/batan/.config/Thunar/
/home/batan/.config/transmission/
/home/batan/.config/vlc/
/home/batan/.config/volumeicon/
/home/batan/.config/xarchiver/
/home/batan/.config/xfce4/
/home/batan/.config/xfce-superkey/
/home/batan/.vim/pack.plugins/start/ale/
/home/batan/.vim/pack.plugins/start/awsome-vim-colorschemes/
/home/batan/.vim/pack.plugins/start/calendar-vim/
/home/batan/.vim/pack.plugins/start/deoplete/
/home/batan/.vim/pack.plugins/start/emmet-vim/
/home/batan/.vim/pack.plugins/start/html5.vim/
/home/batan/.vim/pack.plugins/start/surround-vim/
/home/batan/.vim/pack.plugins/start/tabular/
/home/batan/.vim/pack.plugins/start/tagbar/
/home/batan/.vim/pack.plugins/start/tokyonight.nvim/
/home/batan/.vim/pack.plugins/start/vim-plugin-AnsiEsc/
/home/batan/.vim/pack.plugins/start/vim-taskwarrior/
/home/batan/.vim/pack.plugins/start/vimwiki/
/home/batan/.config/nvim/pack/plugins/start/awsome-vim-colorschemes/
/home/batan/.config/nvim/pack/plugins/start/emmet-vim/
/home/batan/.config/nvim/pack/plugins/start/html5.vim/
/home/batan/.config/nvim/pack/plugins/start/lazy.nvim/
/home/batan/.config/nvim/pack/plugins/start/nvim-fzf/
/home/batan/.config/nvim/pack/plugins/start/surround-vim/
/home/batan/.config/nvim/pack/plugins/start/telescope-fzf-native.nvim/
/home/batan/.config/nvim/pack/plugins/start/tokyonight.nvim/
/home/batan/.config/nvim/pack/plugins/start/vim-startify/
/home/batan/.config/nvim/pack/plugins/start/vim-taskwarrior/
/home/batan/.config/nvim/pack/plugins/start/vimwiki/
/media/batan/100/github/
/media/batan/100/github/advert-block-antix
/media/batan/100/github/bash-menu
/media/batan/100/github/nvim-fzf
/media/batan/100/github/Top-5-Bootloader-Themes
/media/batan/100/github/task
/media/batan/100/github/todo.txt-cli
/media/batan/100/github/strider
/media/batan/100/github/mashpodder
/media/batan/100/github/mutt-wizard
/media/batan/100/github/liquidprompt
/media/batan/100/github/suckless
/media/batan/100/github/tasknote
/media/batan/100/github/bashpodder
/media/batan/100/github/buku
/media/batan/100/github/oolite-saves
/media/batan/100/github/to-do-notifications
/media/batan/100/github/speedread
/media/batan/100/github/toggle-decorations
/media/batan/100/github/taskwarrior-notifications
/media/batan/100/github/surround-vim
/media/batan/100/github/unite.vim
/media/batan/100/github/vim-lsp.git
/media/batan/100/github/awsome-vim-colorschemes
/media/batan/100/github/vimwiki
/media/batan/100/github/html5.vim
/media/batan/100/github/tabular
/media/batan/100/github/tagbar
/media/batan/100/github/vim-taskwarrior
/media/batan/100/github/vim-lsp-ale.git
/media/batan/100/github/emmet-vim
/media/batan/100/github/calendar-vim
/media/batan/100/github/vim-plugin-AnsiEsc
/media/batan/100/github/deoplete
/media/batan/100/github/table-mode
/media/batan/100/github/kickstart.nvim
/media/batan/100/github/vim-startify
/media/batan/100/github/LunarVim
/media/batan/100/github/telescope-fzf-native.nvim
/media/batan/100/github/lazy.nvim
/media/batan/100/github/fzf.vim
/media/batan/100/github/cheat.sh
/media/batan/100/github/telescope.nvim
/media/batan/100/github/AstroNvim
/media/batan/100/github/LazyVim
/media/batan/100/github/mailatex
/media/batan/100/github/firewallsetup
/media/batan/100/github/debian-yoru
/media/batan/100/github/secure-linux
/media/batan/100/github/awesome
/media/batan/100/github/~
/media/batan/100/github/WIN10-Activation
/media/batan/100/github/firefox-user.js-tool
/media/batan/100/github/foxmarks
/media/batan/100/github/my-kitty-config
/media/batan/100/github/yellow_dog_linux
/media/batan/100/github/gtasks-md
/media/batan/100/github/nautilus-scripts
/media/batan/100/github/tasknotes
/media/batan/100/github/TEST
/media/batan/100/github/titusgit
/media/batan/100/github/vim_plugins_I
/media/batan/100/github/vim_plugins_II
/media/batan/100/github/YT-DLP-SCRIPTS
/media/batan/100/github/awesome-cheatsheets
/media/batan/100/github/awesome-compose
/media/batan/100/github/recipe_book
/media/batan/100/github/awesome-courses
/media/batan/100/github/indicator-sysmonitor
/media/batan/100/github/neovim-config_READ_MAC
/media/batan/100/github/surf
/media/batan/100/github/tokyonight.nvim
/media/batan/100/github/sites
/media/batan/100/github/script-server
/media/batan/100/github/RSSFinder
/media/batan/100/github/alfred-wikipedia-suggest
/media/batan/100/github/vim-style-newsboat
/media/batan/100/github/newsbeuter-colors-neonwolf
/media/batan/100/github/NvChad
/media/batan/100/github/taskwarrior-time-tracking-hook
/media/batan/100/Music
/media/batan/100/Music/Mettalica
/media/batan/100/Music/Galija
/media/batan/100/Music/RH
/media/batan/100/Music/ZP
/media/batan/100/Music/deephouse
/media/batan/100/Music/MusicBee
/media/batan/100/Music/Slipknot
/media/batan/100/Music/PaulKarlbrenner
/media/batan/100/Music/Motoerhead
/media/batan/100/Music/Meute
/media/batan/100/Music/JimmySax
/media/batan/100/Music/BlackPumas
/media/batan/100/Music/ACDC
/media/batan/100/Music/ALBUM
/media/batan/100/Music/Cassic
/media/batan/100/Music/TexPerkins
/media/batan/100/Music/Japanese_Jazz_Funk
/media/batan/100/Music/Django
/media/batan/100/Music/DalekaObala
/media/batan/100/Music/MK
/media/batan/100/Music/RobbieWilliams
/media/batan/100/Music/Smokie
/media/batan/100/Music/DivljeJagode
/media/batan/100/Music/Singles
/media/batan/100/Music/GogleBordelo
/media/batan/100/Music/Hooverphonic
/media/batan/100/Music/Jevremovic
/media/batan/100/Music/jon_batiste
/media/batan/100/Music/Judas_Priest
/media/batan/100/Music/Matoma
/media/batan/100/Music/Notorious BIG
/media/batan/100/Music/m4a
/media/batan/100/Music/downloaded
/media/batan/100/Music/KillBill
/media/batan/100/Music/Hladno_Pivo
/media/batan/100/Music/Ludovico
/media/batan/100/Music/mash
/media/batan/100/Music/IceCube
/media/batan/100/Music/Beatles
/media/batan/100/Music/Bukovski
/media/batan/100/Music/CigarettesAfterSex
/media/batan/100/Music/Clash
/media/batan/100/Music/DireStraits
/media/batan/100/Music/Elton_John
/media/batan/100/Music/E-play
/media/batan/100/Music/Fugees
/media/batan/100/Music/IronMaiden
/media/batan/100/Music/Janis_Joplin
/media/batan/100/Music/jet2
/media/batan/100/Music/Metalica
/media/batan/100/Music/XavierNaido
/media/batan/100/mashpodder/podcasts
/media/batan/100/mashpodder/podcasts/critical_thinking
/media/batan/100/mashpodder/podcasts/critical-reasoning-video
/media/batan/100/mashpodder/podcasts/best_of_the_left
/media/batan/100/mashpodder/podcasts/lse
/media/batan/100/mashpodder/podcasts/lse_public
/media/batan/100/mashpodder/podcasts/philosophy_of_our_times
/media/batan/100/mashpodder/podcasts/aristotelian_society
/media/batan/100/mashpodder/podcasts/partially_examined_life
/media/batan/100/mashpodder/podcasts/weld-spiegel
EOL
echo $lc-cd >> .lc-cd





###   ADD TO BASHRC   ###########################################################

ccc=$(cat $HOME/.bashrc)
if [[ "$ccc" -eq "# THIISATEST #" ]]; then
	clear
	echo -e "\033[47mThe  \033[44m.bashrc  \033[47malready contains neccecery code\033[0m"
	read -n1 -p "Enter [ANY] to continue " lol
else

bashrc=$(mktemp /tmp/tmp.file.XXXXXX)
$bashrc << EOL > cat

### THISISATEST ###
###   Setup lc function   #######################################################
unalias lc 2> /dev/null
lc(){
	local dest_dir=$(lc-cd-cuts-global-echo | fzf )
	if [[ $dest_dir != '' ]];then
		cd "$dest_dir"
	fi
}
export -f lc > /dev/null
EOL
echo $bashrc >> .bashrc
fi
clear
echo -e "DONE!!!"
echo -e "===================================================================="
echo -e "Executable lc-cd-cuts-list was created and moved to /usr/bin/"
echo -e "Executable lc-cd-cuts-global-echo was created and moved to /usr/bin/"
echo -e "A list with commonly accessed directories .lc-cd is in $HOME"
echo -e "Content waas added to .bashrc"
echo -e "===================================================================="
echo -e "          >>>> Enter [ANY] to continue and cleanup ...       "
tput cup 7 60
read -n1 lol
echo "sudo trash $HOME/lc-cd"|xclip -selection c
clear
exit


