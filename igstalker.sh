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
ngcari=$(curl -Gs "https://insta-stalker.com/search/?q=$az" --location-trusted \
-H 'authority: insta-stalker.com' \
-H 'upgrade-insecure-requests: 1' \
-H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86' | 
grep "</span>" | cut -d ">" -f2 | cut -d "<" -f1  | cut -d "&" -f3)
ngjuml=$(curl -Gs "https://insta-stalker.com/search/?q=$az" --location-trusted -H \
'authority: insta-stalker.com' \
-H 'upgrade-insecure-requests: 1' \
-H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86' | 
grep "</span>" | cut -d ">" -f2 | cut -d "<" -f1 | grep -n "" | grep -o "2:.*" | tr -d "2:" | gawk '{ print $1,$2 }'
)
}
ngclear
getdata() {
ngcur=$(curl -Gs "https://insta-stalker.com/profile/$us/" --location-trusted | 
grep 'document.write' | grep ";</script><span>" |
cut -d "." -f2 | grep ";</" |
awk '/abbreviateNumber/{print $1}' | cut -d "b" -f4 | grep ";</script><span>Followers</span>" | grep -o "er(.*)" | tr -d "er())")
ngcurl=$(curl -Gs "https://insta-stalker.com/profile/$us/" -L | 
grep 'document.write' | grep ";</script><span>" |
cut -d "." -f2 | grep ";</" |
awk '/abbreviateNumber/{print $1}' | cut -d "b" -f4 | grep ";</script><span>Following</span>" | grep -o "er(.*)" | tr -d "er())")
ngcurls=$(curl -Gs "https://insta-stalker.com/profile/$us/" -L | 
grep 'document.write' | grep ";</script><span>" |
cut -d "." -f2 | grep ";</" |
awk '/abbreviateNumber/{print $1}' | cut -d "b" -f4 | grep ";</script><span>Posts</span>" | grep -o "er(.*)" | tr -d "er())")
printf "[+] Followers: $ngcur\n"
printf "[+] Following: $ngcurl\n"
printf "[+] Posts: $ngcurls\n"
}
ngbanner
search;printf "$ngcari";printf "found : $ngjuml\n"
read -p "username:" us
getdata $us