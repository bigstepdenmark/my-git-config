BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
COMMIT_MESSAGE=$1
NO_VERIFY=$2

# Check if the variable is empty using -z
if [ -z "$NO_VERIFY" ]; then
  git commit -m "[$BRANCH_NAME] $COMMIT_MESSAGE"
fi

# Check if string1 is equal to string2
if [ "$NO_VERIFY" = "-nv" ]; then
  git commit --no-verify -m "[$BRANCH_NAME] $COMMIT_MESSAGE"
fi
