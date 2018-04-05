#!/bin/bash

if [ -z $1 ]                                #gestion de cas : exécute le programme sans donner le nom du projet
then echo "Expected arguments, please check the help : initdev –help" ; echo 1 ;
elif [ "$1" = "-help" ]
    then nano help

#Fonctionnalités de base

else s=0; for i in $2 $3 $4 $5
       do
        if [ -n $i ] 
          then s=`expr $s + 1`
        fi
        done
     if [ $s = 0 ]
       then   mkdir $1 ; touch $1/main ; touch $1/LICENSE ; touch $1/Makefile ; echo 0 ;

#Fonctionnalités avancées

     else k=0 ;
             for i in $2 $3 $4 $5            #gestion de cas :type d'argument incomnnu
              do 
               if [ "$i" != "-C" ] && [ "$i" != "-CPP" ] && [ "$i" != "-Py" ] && [ "$i" != "-Latex" ] && [ "$i" != "-BEAMER" ] && [ "$i" != "-GPL" ] && [ "$i" != "-MIT" ] && [ "$i" != "-git" ]
                 then k=`expr $k + 1`
                 fi 
              done

            if [ $k != 0 ]
                then echo "Expected arguments, please check the help : initdev –help" ;echo 1;
            else l=1;n=0;N=0; 

                for i in $2 $3 $4 $5 
                  do
                    if [ "$i" = "-git" ]      #gestion de cas :demande de création d’un dépôt git sans préciser le langage du projet
                      then n=$l; g=1 ; 
                                 for i in $2 $3 $4 $5
                                  do 
                                      if [ "$i" = "-C" ] || [ "$i" = "-CPP" ] || [ "$i" = "-Py" ] || [ "$i" = "-Latex" ] || [ "$i" = "-BEAMER" ]
                                        then N=$g  
                                      fi
                                       g=`expr $g + 1`
                                  done
                      
                      fi 
                       l=`expr $l + 1` 
                   done

                if [ $n != 0 ] && [ $N = 0 ]
                    then echo "You must set project type, please check the help : initdev –help " ;echo 1;
                else mkdir $1 ;touch $1/LICENSE ; touch $1/Makefile ;
                
                          for i in $2 $3 $4 $5   #gestion des arguments
                          do 

                            if [ "$i" = "-C" ] 
                               then cp sources/main.c $1 ; echo 0 ;
                                 for j in $2 $3 $4 $5
                                 do
                                   if [ "$j" = "-git" ]  
                                    then cp gitignores/c $1 ; mv $1/c $1/.gitignore ;git init ;echo 0 ;        
                                   fi
                                 done
                             fi
         
                              if [ "$i" = "-CPP" ]   
                             then cp sources/main.cpp $1 ; echo 0 ;
                                 for j in $2 $3 $4 $5
                                 do
                                   if [ "$j" = "-git" ]  
                                    then cp gitignores/cpp $1 ;mv $1/cpp $1/.gitignore ;git init ; echo 0 ;
                                   fi
                                 done
                             fi
        
                            if [ "$i" = "-Py" ]
                              then  cp sources/main.py $1 ; echo 0 ;        
                                 for j in $2 $3 $4 $5
                                 do
                                   if [ "$j" = "-git" ]  
                                    then cp gitignores/python $1 ;mv $1/python $1/.gitignore ;git init ;echo 0 ;        
                                   fi
                                 done
                            fi

                            if [ "$i" = "-Latex" ]
                               then cp sources/latexMin.tex $1 ; echo 0 ;
                                 for j in $2 $3 $4 $5
                                 do
                                   if [ "$j" = "-git" ]  
                                    then cp gitignores/tex $1 ; mv $1/tex $1/.gitignore ;git init ; echo 0 ;
                                   fi
                                 done
                            fi
        
                            if [ "$i" = "-BEAMER" ]
                               then cp sources/beamer.tex $1 ; echo 0 ;
                                 for j in $2 $3 $4 $5
                                 do
                                   if [ "$j" = "-git" ]  
                                    then cp gitignores/tex $1 ; mv $1/tex $1/.gitignore ;git init ; echo 0 ;
                                   fi
                                 done
                            fi
                             
                            if [ "$i" = "-GPL" ]
                               then  cat licenses/GPL > $1/LICENSE
                            fi

                            if [ "$i" = "-MIT" ]
                               then  cat licenses/MIT > $1/LICENSE
                            fi

                          done
                    fi
               fi
        fi
fi

#les variables s,k,l,et N pour faire des testes logique   
