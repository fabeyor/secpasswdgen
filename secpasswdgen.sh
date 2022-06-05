#!/bin/bash

#Secure Random Password Generator (SRPG)
#Author: Samuel fabeyo
#Website: https://fabeyor.medium.com


echo "Welcome to the Secure Random Password Generator (SRPG)"


function secure_password(){
    #Generates random passwords in the lenght of choice of the user.

    echo "Please, how many password characters do you want to generate? "

    MINI="12"
    read -r PASSWD_LENGHT

    #Checks if the password lenght is atleast 12 Characters.

    if  [ -z $PASSWD_LENGHT ] &&  [ "${#PASSWD_LENGHT}" -ge "$MINI" ];
    then
        for CHARACTER in $(seq 1); do
            openssl rand -hex && openssl rand -base64 48 | cut -c1-"$PASSWD_LENGHT" | shuf
    #else
        #echo "Please, the minimum password lenght is $MINI"
        done 
    fi           
}


function random_pass (){
    #Generates a random pass using openssl
    #read PASSWD_LENGHT
    for CHARACTER in $(seq 1); 
    do
    openssl rand -hex && openssl rand -base64 48 | cut -c1-"$PASSWD_LENGHT" | shuf
    done
}
random_pass
secure_password
