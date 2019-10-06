# Watch how is everything
# stack exec site watch

# Temporarily store uncommited changes
# git stash

# Verify correct branch
# git checkout develop

# Build new files
# stack exec site clean
# stack exec site build
stack exec site rebuild

# Get previous files
git fetch --all
git checkout -b master --track origin/master

# Overwrite existing files with new files
rsync -a --filter='P _site/'      \
         --filter='P _cache/'     \
         --filter='P .git/'       \
         --filter='P .gitignore'  \
         --filter='P .stack-work' \
         --delete-excluded        \
         _site/ .

# Commit
git add -A
git commit -m ""

# Push
git push origin master:master

# Restoration
git checkout develop
git branch -D master
#git stash pop

