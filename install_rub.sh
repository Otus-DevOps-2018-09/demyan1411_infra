#!/bin/bash
# our comment is here
# echo "The current directory is:"
# pwd
#
# echo "The user logged in is:"
# whoami

# display user home
# echo "Home for the current user is: $HOME"

# testing variables
# grade=5
# person="Adam"
# echo "$person is a good boy, he is in grade $grade"
#
# mydir=$(pwd)
# echo $mydir

# user=likegeeks
# if grep $user /etc/passwd
# then
# echo "The user $user Exists"
# fi

# if pwd
# then
# echo "It works"
# fi

# val1=text
# val2="another text"
# if [ $val1 \> $val2 ]
# then
# echo "$val1 is greater than $val2"
# else
# echo "$val1 is less than $val2"
# fi

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

ruby -v
bundle -v
