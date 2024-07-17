#!/bin/bash

GITCONFIG=".gitconfig"
GITCONFIG_OLD=""
GITCONFIG_PATH="$HOME/$GITCONFIG"
GIT_USER_NAME=""
GIT_USER_EMAIL=""


############################################################
# Get GIT username and email-adress
############################################################
# Check if .gitconfig exists
if [ -e "$GITCONFIG_PATH" ]; then
   # Get username and email from current .gitconfig
   GIT_USER_NAME=$(grep -m 1 '^\s*name\s*=' "$GITCONFIG_PATH" | sed 's/.*=\s*//')
   GIT_USER_EMAIL=$(grep -m 1 '^\s*email\s*=' "$GITCONFIG_PATH" | sed 's/.*=\s*//')

   # Username and email found
   if [ -n "$GIT_USER_NAME" ] && [ -n "$GIT_USER_EMAIL" ]; then
       echo ""
       echo "--------------------------------------------------"
       echo "GIT username and email-address found"
       echo "Username: $GIT_USER_NAME"
       echo "Email: $GIT_USER_EMAIL"
       echo "--------------------------------------------------"
       echo ""
   else
       if [ -z "$GIT_USER_NAME" ]; then
          # Ask for Git username
          echo ""
          echo "Username not found! Enter your Git username:"
          read GIT_USER_NAME
       fi
       if [ -z "$GIT_USER_EMAIL" ]; then
          # Ask for Git email
          echo ""
          echo "Email not found! Enter your Git email address:"
          read GIT_USER_EMAIL
       fi
   fi
fi

############################################################
# Backup current .gitconfig
############################################################
if [ -e "$GITCONFIG_PATH" ]; then
    TIMESTAMP=$(date +%Y%m%d%H%M%S)
    GITCONFIG_OLD="$GITCONFIG_PATH-$TIMESTAMP.bak"

    # Change current .gitconfig name to .gitconfig + timestamp + .bak
    mv "$GITCONFIG_PATH" "$GITCONFIG_OLD"
fi

############################################################
# Copy .gitconfig from my-git-config to home directory
############################################################
cp "$GITCONFIG" "$HOME/"

############################################################
# Update Git username and user email address
############################################################
sed -i -e "s/__NAME__/$GIT_USER_NAME/g" $GITCONFIG_PATH
sed -i -e "s/__EMAIL__/$GIT_USER_EMAIL/g" $GITCONFIG_PATH

############################################################
# Update permissions for hooks and scripts
############################################################
chmod -R +x $HOME/my-git-config/hooks
chmod -R +x $HOME/my-git-config/scripts

############################################################
# Done
############################################################
echo ""
echo "Successfully done  ✅"
echo ""
