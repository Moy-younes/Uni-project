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
               if [ "$i" != "C" ] && [ "$i" != "CPP" ] && [ "$i" != "Py" ] && [ "$i" != "Latex" ] &&[ "$i" != "BEAMER" ] && [ "$i" != "GPL" ] && [ "$i" != "MIT" ]
                 then k=`expr $k + 1`
                 fi 
               done 
            if [ $k != 0 ]
             then echo "Expected arguments, please check the help : initdev –help" ;echo 1;

            else for i in $2 $3 $4 
                  do
                    if [ "$i" = "C" ]
                       then mkdir $1 ; touch $1/LICENSE ; touch $1/Makefile ; 
                       cp initdev1/sources/main.c $1 ; echo 0 ;
                     fi
 
                     if [ "$i" = "CPP" ]
                       then mkdir $1 ; touch $1/LICENSE ; touch $1/Makefile ; 
                       cp initdev1/sources/main.cpp $1 ; echo 0 ;
                     fi

                    if [ "$i" = "Py" ]
                      then mkdir $1 ; touch $1/LICENSE ; touch $1/Makefile ; 
                      cp initdev1/sources/main.py $1 ; echo 0 ;
                    fi

                    if [ "$i" = "Latex" ]
                       then mkdir $1 ; touch $1/LICENSE ; touch $1/Makefile ;
                       cp initdev1/sources/latexMin.tex $1 ; echo 0 ;
                    fi

                    if [ "$i" = "BEAMER" ]
                       then mkdir $1 ; touch $1/LICENSE ; touch $1/Makefile ; 
                       cp initdev1/sources/beamer.tex $1 ; echo 0 ;
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


