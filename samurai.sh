#!/bin/bash
#############################
#######################
# colors
PURPLE=$(tput setaf 125)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
WHITE=$(tput setaf 7)
CYAN=$(tput setaf 5)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
####################################################
function ascii_start()
{
	clear
	echo
	echo -e "oo1oo oo1oo oo1oo ${RED}oo1oo oo1oo oo1oo oo1oo${RESET} oo1oo oo1oo oo1oo\n"
	cat<<"EDT"
                                 /)                          
                                //                           
              __*_             //                            
           /-(____)           //                             
          ////- -|\          //      
       ,____o% -,_          //                               
      /  \\   |||  ;       //        
     /____\....::./\      //                                 
    _/__/#\_ _,,_/--\    //          Samurai Email Discovery    
    /___/######## \/""-(\</          Version: 1.0                        
   _/__/ '#######  ""^(/</           <3 Xecurity & Pyr0     
 __/ /   ,)))=:=(,    //.       	                     
|,--\   /Q...... /.  (/    
/       .Q....../..\            
       /.Q ..../...\                                         
      /......./.....\                                        
      /...../  \.....\                                       
      /_.._./   \..._\                                       
       (` )      (` )                                        
       | /        \ |                                        
       '(          )'                                        
      /+|          |+\                                       
      |,/          \,/  
EDT
echo -e "${RED}S${RESET}amurai ${RED}E${RESET}mail ${RED}D${RESET}iscovery${RESET} - ${RED}@AnonyInfo${RESET} productions.\t"
echo -e "oo1oo oo1oo oo1oo ${RED}oo1oo oo1oo oo1oo oo1oo${RESET} oo1oo oo1oo oo1oo\n"
main_menu
}
####################################################
function pages()
{
	touch pges.txt
	file="pges.txt"

	if [ -e ${file} ]; then
    	count=$(cat ${file})
	else
    	count=0
	fi
}
######################################################
function grabEm()
{
	touch pges.txt
	file="pges.txt"
	apikey="39e6888da2eca168a64925c44cdd72dff00866ad"
	###########Start###############
	who="${1}"
	what="${2}"
	###############################
	if [ $what == "googledork" ]; then
    echo -e "${RED}samurai@osint${RESET}:~# Hehe${RED},${RESET} ok one sec - Scanning ${RED}teh interwebz${RESET} for ${RED}emails${RESET}"
    count=0
    while [ $count=0 ]; do
    	( lynx -dump "https://www.bing.com/search?q=s$who&qs=n&form=QBRE&sp=-1&pq=$who&first=$count&FORM=PERE" |  grep -oE --color '[[:alnum:]_.]+@[[:alnum:]_]+[.][[:alnum:]]+' | sort -u )
    	count=$((count+1))
    if [ $count="4" ]; then
      count=0
    fi
  done
	elif [ $what == "corp" ]; then
    echo -e "${RED}samurai@osint${RESET}:~# Hehe${RED},${RESET} ok one sec - Scanning ${RED}teh interwebz${RESET} for ${RED}emails${RESET}"
		( lynx "https://api.hunter.io/v2/domain-search?company=${1}&api_key=$apikey" -dump | grep -oE --color '[[:alnum:]_.]+@[[:alnum:]_]+[.][[:alnum:]]+' )
	elif [ $what == "domainname" ]; then
    echo -e "${RED}samurai@osint${RESET}:~# Hehe${RED},${RESET} ok one sec - Scanning ${RED}teh interwebz${RESET} for ${RED}emails${RESET}"
		( lynx "https://api.hunter.io/v2/domain-search?domain=$who&api_key=$apikey" -dump | grep -oE --color '[[:alnum:]_.]+@[[:alnum:]_]+[.][[:alnum:]]+' )
	fi
}
###################################################

##################################################
function main_menu()
{
	select mainmnu in "Google Dork" "Domain" "Company"
	do
		case $mainmnu in 
			"Google Dork")
					echo -e "${RED}samurai@osint${RESET}:~# Roulette it is boss, what's the dork?\t"
					read dorks
					grabEm "${dorks}" "googledork"
			;;
			
			"Domain")
					echo -e "${RED}samurai@osint${RESET}:~# So..what's the domain?\t"
					read tlds
					grabEm "${tlds}" "domainname"
			;;
			
			"Company")
					echo -e "${RED}samurai@osint${RESET}:~# Ah, corporations - fuck em'. Who is it?\t"
					read corps
					grabEm "${corps}" "corp"
			;;

				*)
					echo -e "${RED}Let's try again${RESET}, lol."
					echo
					main_menu			
		   ;;
		esac
	done
}
#################################################################
ascii_start
