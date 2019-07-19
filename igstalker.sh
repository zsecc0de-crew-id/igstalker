#!/usr/bin/bash
# @plase not recode script me ;) *\\
# @toolsname  : igstalker
# @create on  : 10-04-2019
# @powered by : zsecc0de-crew.id *\\
#                        ____     _                                         _
# _______  ___  ___ ___ / _ \  __| | ___        ___ _ __ _____      _(_) __| |
#|_  / __|/ _ \/ __/ __| | | |/ _` |/ _ \_____ / __| '__/ _ \ \ /\ / / |/ _` |
# / /\__ \  __/ (_| (__| |_| | (_| |  __/_____| (__| | |  __/\ V  V /| | (_| |
#/___|___/\___|\___\___|\___/ \__,_|\___|      \___|_|  \___| \_/\_(_)_|\__,_|
ngbanner() {
echo -e "
\t[-] INSTAGRAM STALKER [-]
"
}
ngclear() {
clear;	
}
search() {
echo -n "cari :"; read az
ngcari=$(curl -Gs "https://insta-stalkerr.com/search/?q=$az" --location-trusted \
-H 'authority: insta-stalker.com' \
-H 'upgrade-insecure-requests: 1' \
-A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86' | 
grep -Po '(?<=alt=").*?(?=")' | head | grep -Po "@(.*)" | grep -n ""
)
#printf "$ngcari \n" >> kamu
printf "$ngcari \n"
ngjuml=$(curl -Gs "https://insta-stalkerr.com/search/?q=$az" --location-trusted \
-H 'authority: insta-stalkerr.com' \
-H 'upgrade-insecure-requests: 1' \
-A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86' | 
grep -Po '(?<=span).*?(?>")' | head -2 | tail -1 | gawk -F ">" '{print $2}' | gawk '{ print $1 }'
)
}
ngclear
getdata() {
#echo -n "pilih:"; read yuser
#ok=$(echo "$(cat kamu)"| grep -o "$yuser:.*" | cut -d ":" -f2)
ngcur=$(curl -Gs "https://insta-stalkerr.com/profile/${you}/" --location-trusted | 
grep -Po '(?<=div).*?(?>")' | grep "Followers" | cut -d ">" -f2 | grep -o ".*<" | tr -d "<")
ngcurl=$(curl -Gs "https://insta-stalkerr.com/profile/${you}/" -L | 
grep -Po '(?<=div).*?(?>")' | grep "Following" | cut -d ">" -f2 | grep -o ".*<" | tr -d "<")
ngcurls=$(curl -Gs "https://insta-stalkerr.com/profile/${you}/" -L | 
grep -Po '(?<=div).*?(?>")' | grep "Following" | cut -d ">" -f2 | grep -o ".*<" | tr -d "<")
printf "[+] Followers: $ngcur\n"
printf "[+] Following: $ngcurl\n"
printf "[+] Posts: $ngcurls\n"
}
ngbanner
search;
echo -e "-----------------------------"
printf "found : $ngjuml\n";
echo -en "[*] cari :"; read you
getdata $you