#!/bin/sh

clear && echo "
       __________________________
 _____| CONVERTISSEUR: RAW > JPEG
|_____|____________________________________________________________
| Q?  | Quel est le chemin du dossier de photos en Raw à convertir? 
| Exp | /home/user/Images/MonDossierAConvertir
"
read -r dossier
cat $dossier
cd $dossier
pwd

clear && echo "
       __________________________
 _____| CONVERTISSEUR: RAW > JPEG
|_____|_______________________________________
| Q?  | Quel est l'extension des fichiers RAW?
| Exp | cr3, crw, ... 
| /!\ | Attention à la casse !
"
read -r extension

#Variables
liste=`ls *.$extension`
nombrePhoto=`ls -l *.$extension | wc -l`
compteur=0

#Executions
clear && echo "
       __________________________
 _____| CONVERTISSEUR: RAW > JPEG
|_____|___________________
|     | Patientez ... .. .
| >>> | $compteur / $nombrePhoto
"
for photo in $liste
do
	nomFichier=`basename -s .$extension $photo` #arg -s > sans extension .XXX
	convert $photo $nomFichier.jpeg &>/dev/null
	((compteur=compteur+1))
	clear && echo "
       __________________________
 _____| CONVERTISSEUR: RAW > JPEG
|_____|___________________
|     | Patientez ... .. .
| >>> | $compteur / $nombrePhoto
"
done


mkdir CR3 JPEG
mv *.CR3 CR3/
mv *.jpeg JPEG /

clear && echo "
       __________________________
 _____| CONVERTISSEUR: RAW > JPEG
|_____|________
|     | terminé
| >>> | $compteur / $nombrePhoto
"


