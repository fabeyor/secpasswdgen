#!/bin/bash

# Secure Random Password Generator (SRPG)
# Author: Samuel Fabeyo
# Website: https://fabeyor.medium.com
# GitHub: https://github.com/fabeyor

echo "Welcome to the Secure Random Password Generator (SRPG)"
echo "______________________________________________________"

function secure_password() {
    # Generates random passwords in the length of choice of the user.

    read -p "Please enter the desired password length: " password_length

    # Define minimum password length.
    minimum_password_length=16

    # Checks if the password length is at least 16 characters and generates a password.
    if [ -z "${password_length}" ] || [ "${password_length}" -lt "${minimum_password_length}" ]; then
        echo "_________________________________________________________________"
        echo "Please, the minimum password length is ${minimum_password_length}"
        echo "_________________________________________________________________"
        exit 1 
    else
        # Generate the password.
        for character in $(seq 1); do
            PASSWORD=$(head /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&\x27()*+,-./:;<=>?@[\\]^_`{|}~' | head -c"${password_length}" ; echo '')

            # Print the password securely.
            echo "_____________________"
            echo "Your new password is:"
            echo "_____________________"
            printf '%s\n' "$PASSWORD"
        done
    fi           
}

secure_password
