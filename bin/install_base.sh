#!/bin/bash 
# author : Arnaud Crampet 
# Date : 28/06/2024
# generic azure ressource group managment from CAST
#|# force default sourcing as null vars
ConfigState=""

printf "\n" 
printf  "Sourcing base configuration file :" 
if [[ -f ../conf/config.cnf  ]]
   then 
       . ../conf/config.cnf 2> /dev/null  
       if [[  ${?} -ge 1 ]] && [[ ! ${ConfigState} = "OK" ]]
          then 
              printf " ERROR \n" 
              exit 1
          else
              printf " SUCCESS \n" 
      fi 
    else 
      printf " ERROR FILE NOT FOUND \n"
fi 

function main () 
{
############ STACK_TRACE_BUILDER #####################
Function_Name="${FUNCNAME[0]}"
Function_PATH="${Function_Name}"
######################################################
#|# mandatory ini call 
set_paths    
#init_all

#|# main execution
 

############### Stack_TRACE_BUILDER ################
Function_PATH="$( dirname ${Function_PATH} )"
####################################################
}
              

main 