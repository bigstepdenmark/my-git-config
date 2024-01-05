#!/bin/bash

gitconfig=".gitconfig"
gitconfig_path="$HOME/$gitconfig"

# Ask for Git username and email
echo "----------------------------------------"
echo "Enter your Git username:"
read git_username

echo ""

echo "Enter your Git email address:"
read git_useremail
echo "----------------------------------------"

# Backup .gitconfig if exists
if [ -e "$gitconfig_path" ]; then
    timestamp=$(date +%Y%m%d%H%M%S)
    backup_name="$gitconfig_path-$timestamp.bak"

    # Change current .gitconfig name to .gitconfig + timestamp + .bak
    mv "$gitconfig_path" "$backup_name"
fi

# Copy .gitconfig from my-git-config to home directory
cp "$gitconfig" "$HOME/"

# Update Git username and user email address
sed -i -e "s/__NAME__/$git_username/g" $gitconfig_path
sed -i -e "s/__EMAIL__/$git_useremail/g" $gitconfig_path

chmod -R +x $HOME/my-git-config/hooks
chmod -R +x $HOME/my-git-config/scripts

echo ""
echo "Successfully done  ✅"