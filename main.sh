#!/bin/bash

if [ -z $1 ]
then echo "Expected arguments, please check the help : initdev –help" ; echo 1 ;
elif [ "$1" = "help" ]
    then nano help

elif [ s=0 ]
then s=0; for i in $2 $3 $4
       do
        if [ -n $i ] 
          then s=`expr $s + 1`
        fi
        done
     if [ $s = 0 ]
       then   mkdir $1 ; touch $1/main ; touch $1/LICENSE ; touch $1/Makefile ; echo 0 ;


    elif [ k=0 ] 
        then k=0 ;for i in  $2 $3 $4
               do 
               if [ "$i" != "C" ] && [ "$i" != "CPP" ] && [ "$i" != "Py" ] && [ "$i" != "Latex" ] &&[ "$i" != "BEAMER" ] && [ "$i" != "GPL" ] && [ "$i" != "MIT" ] && [ "$i" != "git" ]
                 then k=`expr $k + 1`
                 fi 
               done 
            if [ $k != 0 ]
             then echo "Expected arguments, please check the help : initdev –help" ;echo 1;

            else   l=0;  

                for i in $2 $3 $4 
                  do
                   if [ "$i" = "git" ] 
                    then s=$l;
                         g=0 ;  for i in $2 $3 $4
                                  do 
                                     if [ "$i" = "C" ] || [ "$i" = "CPP" ] || [ "$i" = "Py" ] || [ "$i" = "Latex" ]
                                      then S=$g ;
                                     fi 
                                     g=`expr $g + 1`
                                  done
                   fi
                   l=`expr $l + 1`
                  done

                   if [ $s -lt $S ]
                     then echo "You must set project type, please check the help : initdev –help " ;echo 1;

                     else mkdir $1 ;touch $1/LICENSE ; touch $1/Makefile ;
                
                          for i in $2 $3 $4 
                          do 

                            if [ "$i" = "C" ] 
                               then cp initdev1/sources/main.c $1 ; echo 0 ;
                                 for j in $2 $3 $4  
                                 do
                                   if [ "$j" = "git" ]  
                                    then cp initdev1/gitignores/c $1 ; git init ;echo 0 ;        
                                   fi
                                 done
                             fi
         
                              if [ "$i" = "CPP" ]   
                             then cp initdev1/sources/main.cpp $1 ; echo 0 ;
                                 for j in $2 $3 $4 
                                 do
                                   if [ "$j" = "git" ]  
                                    then cp initdev1/gitignores/cpp $1 ;git init ; echo 0 ;
                                   fi
                                 done
                             fi
        
                            if [ "$i" = "Py" ]
                              then  cp initdev1/sources/main.py $1 ; echo 0 ;        
                                 for j in $2 $3 $4 
                                 do
                                   if [ "$j" = "git" ]  
                                    then cp initdev1/gitignores/python $1 ;git init ;echo 0 ;        
                                   fi
                                 done
                            fi

                            if [ "$i" = "Latex" ]
                               then cp initdev1/sources/latexMin.tex $1 ; echo 0 ;
                                 for j in $2 $3 $4 
                                 do
                                   if [ "$j" = "git" ]  
                                    then cp initdev1/gitignores/tex $1 ; git init ; echo 0 ;
                                   fi
                                 git init ;
                                 done
                            fi
        
                            if [ "$i" = "BEAMER" ]
                               then cp initdev1/sources/beamer.tex $1 ; echo 0 ;
                            fi
                             
                            if [ "$i" = "GPL" ]
                               then  cat initdev1/licenses/GPL > $1/LICENSE
                            fi

                            if [ "$i" = "MIT" ]
                               then  cat initdev1/licenses/MIT > $1/LICENSE
                            fi

                          done 
              
                    fi
                  fi
               
              fi
fi



