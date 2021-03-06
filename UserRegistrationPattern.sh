#! /bin/bash -x

#DECLARATION OF ARRAY FOR SAMPLE EMAILS
declare -a validEmailSample
declare -a invalidEmailSample

#ASSIGING SOME VALID SAMPLES
validEmailSample=('abc@yahoo.com' 'abc-100@yahoo.com'
            'abc.100@yahoo.com' 'abc111@abc.com'
            'abc-100@abc.net' 'abc.100@abc.com.au'
            'abc@1.com' 'abc@gmail.com.com' 'abc+100@gmail.com')

#ASSIGING SOME VALID SAMPLES
invalidEmailSample=('abc' 'abc@.com.my' 'abc123@gmail.a' 'abc123@.com'
                  'abc123@.com.com' '.abc@abc.com' 'abc()*@gmail.com'
                   'abc@%*.com' 'abc..2002@gmail.com' 'abc.@gmail.com'
                   'abc@abc@gmail.com' 'abc@gmail.com.1a' 'abc@gmail.com.aa.au')


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

#TO PATTERN CHECK FOR MOBILE NUMBER
read -p "Enter the Mobile No :" mobile
mobilePattern='^(\+?\d{1,3})[ ]([0-9]{10})$'
result=$(validate $mobile $mobilePattern)
echo  $result

#TO PATTERN CHECK FOR PASSWORD
read -p "Enter the password :" password
passwordPattern='^(?=.*[0-9])(?=.*[A-Z])(?=.*[~!.+?_><!@#$%^&*])[a-zA-Z0-9!?.+-~!@#$%^&*_]{8,}$'
result=$(validate $password $passwordPattern)
echo  $result


#VALIDATION BY ITERATING SAMPPLE EMAIL
length1=${#validEmailSample[@]}
index=0
while [ $index -lt $length1 ]
do
   result=$(validate ${validEmailSample[$index]} $emailPattern)
   echo $result
	((index++))
done

length2=${#invalidEmailSample[@]}
index=0
while [ $index -lt $length2 ]
do
   result=$(validate ${invalidEmailSample[$index]} $emailPattern)
   echo $result
	((index++))
done
