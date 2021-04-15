#!/bin/bash

setting_key()
{
echo "Setting your GPG key with id $keyid for git"
git config --global user.signingkey $keyid
git config --global commit.gpgsign true
echo "Setup completed"
}

echo "Press (1) if you already have a GPG key or (2) to generate a new GPG key"
read val
echo

if [ $val -eq '1' ];
then
	gpg --list-secret-keys --keyid-format LONG
	echo "Enter your key ID"
	read keyid
elif [ $val -eq '2' ];
then
	gpg --default-new-key-algo rsa4096 --gen-key
	gpg --list-secret-keys --keyid-format LONG
	echo "Enter your key ID"
	read keyid
fi

echo
gpg --armor --export $keyid
echo
echo "Paste this in Github-->Settings-->SSH and GPG keys-->GPG keys"
echo
setting_key
