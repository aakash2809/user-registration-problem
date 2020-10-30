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


read -p "Enter the first name : " firstName
firstNamePattern='^[A-Z]{1}[a-zA-Z]{2,}$'
result=$(validate $firstName $firstNamePattern)
echo  $result
