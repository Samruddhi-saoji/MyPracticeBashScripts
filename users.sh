#!  /usr/bin/bash



echo "Enter name of the new user"

read username



echo "Enter name of the group"

read grp



#checking if grp doesnt exist

if [ -z $(grep $grp /etc/group) ]

then

	echo "Enter grp id"

	read id

	#create new grp

	sudo groupadd -g $id $grp

fi



#creating the new user

sudo useradd -g $grp $username



#setting the password

echo "Set the password"

sudo passwd $username 

#read pw

#echo "$pw" | passwd --stdin $username





#set limit for file size

#max file size is 500mb



#echo "Enter the set password"

#su $username

#ulimit -f 500000

#su samruddhi



limitinfo="$username hard fsize 500000"

sudo echo $limitinfo >> /etc/security/limits.conf