#!/bin/bash 
#############
# Author  :  Arnaud Crampet 
# Date    :  25/06/2024
# Subject :  generate  git structuregit@${GIT_SSH_URL}:v3/${GIT_GLB_ORGANISATION}/${GIT_GLB_PROJECT}/lib
runned="0"
runned="0"
Runned_config="0"
Runned_git="0"
actualpath="$(pwd)"
 

function update_ressources () 
{
############ STACK_TRACE_BUILDER #####################
Function_Name="${FUNCNAME[0]}"
Function_PATH="${Function_PATH}/${Function_Name}"
######################################################
MSG_DISPLAY "debug" "0" "current function path : [ ${Function_PATH} ]  | function Name [ ${Function_Name} ]  "
  if [[ -d ./lib  ]]
    then 
       if [[ -d ./lib/.git ]]
          then 
              MSG_DISPLAY "info" "0"  "updating generics lib files " 
              cd ./lib
              git pull 
              cd .. 
          else 
             MSG_DISPLAY "info" "0"  "warning lib not implemented from git removing" 
             rm -rf ./lib 
             git clone git@${GIT_SSH_URL}:v3/${GIT_GLB_ORGANISATION}/${GIT_GLB_PROJECT}/lib
      fi 
    else 
       echo "cloning generic CAST libs" 
       git clone git@${GIT_SSH_URL}:v3/${GIT_GLB_ORGANISATION}/${GIT_GLB_PROJECT}/lib
fi
MSG_DISPLAY "info" "0"  "Nom généré : ${nom_objet}"
if [[ -d ./RGRoot/${nom_objet} ]]
   then 
       MSG_DISPLAY "info" "0"  "existing object"
   else 
       MSG_DISPLAY "info" "0"  "Creating object"
       mkdir  ./RGRoot/${nom_objet} 
fi
############### Stack_TRACE_BUILDER ################
Function_PATH="$( dirname ${Function_PATH} )"
####################################################
}



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

echo " test main : ${!ENVIRONMENTS_AZ[@]} " 

# Poser des questions pour obtenir les informations nécessaires
ask_questions

# Générer le nom de l'objet
nom_objet="${BIGRAMME}-${CODE_APPLI}-${ENV}-${CATEGORIE}-${LOCALISATION}-${INDEX}"
echo "object name : ${nom_objet}"


############### Stack_TRACE_BUILDER ################
Function_PATH="$( dirname ${Function_PATH} )"
####################################################
}
              
 
main 