#!/bin/bash


s=0;
for repository in $(ls -a)
do
if [ $repository = .initdev ]
then s=1; echo "Erreur , le  répertoire existe déjà" ; echo 1 ;
fi
done
if [ $s = 0 ] 
then mkdir .initdev ; cp -r Uni-project/initdev/bin .initdev ;
                      cp -r Uni-project/initdev/gitignores .initdev ;
                      cp -r Uni-project/initdev/licenses .initdev ;
                      cp -r Uni-project/initdev/makefiles .initdev ;
                      cp -r Uni-project/initdev/sources .initdev ;
                      cp -r Uni-project/initdev/main.sh .initdev ;
                      cp -r Uni-project/initdev/help .initdev ;
fi
