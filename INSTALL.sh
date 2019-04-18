#!/bin/bash

if [ ! -d ~/.local/share/gnome-shell/extensions ]
then
	echo "~/.local/share/gnome-shell/extensions     directory does not exist."
	echo "Would you like to create the directory  (y/n) ? "
	read response
	if [ $response == "y" ]
        then
		mkdir -p ~/.local/share/gnome-shell/extensions
		if [ $? -eq 0 ]
		then
			echo " Directory Created "
		else
			echo " Error ! "
			exit
		fi
	else
		echo "Exiting ... ! "
		exit
	fi
fi

echo ""
echo "Removing any Older Version"
rm -rf ~/.local/share/gnome-shell/extensions/notification-center@Selenium-H
echo "Done"

echo "Copying New Version"
cp -rf notification-center@Selenium-H ~/.local/share/gnome-shell/extensions/
echo "Done"

cd ~/.local/share/gnome-shell/extensions/notification-center@Selenium-H
echo "Compiling Schemas"
glib-compile-schemas schemas
echo "Done"

cd locale

echo "Creating Translations"

mkdir it/LC_MESSAGES
msgfmt it/notification-center.po -o it/LC_MESSAGES/notification-center.mo

echo "All Done !"

