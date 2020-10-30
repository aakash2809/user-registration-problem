#! /bin/bash 

echo "              Welcome to User Registration Program"
echo "---------------------------------------------------------------------"

#TO VALIDATE PATTERN
validate(){
    local input=$1
    local pattern=$2

    if [[ $input =~ $pattern ]]
    then
        echo "Valid"
    else
        echo "Invalid"
    fi   
}

#PATTERN CHECK FOR FIRST NAME
read -p "Enter the first name : " firstName
firstNamePattern='^[A-Z]{1}[a-zA-Z]{2,}$'
result=$(validate $firstName $firstNamePattern)
echo  $result

#PATTERN CHECK FOR LAST NAME
read -p "Enter the last name : " lastName
lastNamePattern='^[A-Z]{1}[a-zA-Z]{3,}$'
result=$(validate $lastName $lastNamePattern)
echo  $result

#TO PATTERN CHECK FOR EMAIL ID
read -p "Enter the Email Id : " email
emailPattern='^([A-Za-z\d-_\+]+)(\.[A-Za-z\d-_]+)?@([a-zA-Z\d]+)\.([a-zA-Z]{2,4})(\.[A-Za-z]{2,4})?$'
result=$(validate $email $emailPattern)
echo  $result
