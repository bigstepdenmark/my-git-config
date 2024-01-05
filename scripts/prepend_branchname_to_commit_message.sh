BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
COMMIT_MESSAGE=$1

git commit -m "[$BRANCH_NAME] $COMMIT_MESSAGE"
