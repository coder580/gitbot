commit=""
conf=""
repo=""
vim README.md
git init
git add *
read -p "what is your github username: " user
read -p "what is the repo name: " repo
read -p "what do you want to name the commit: " commit
git commit -m "$commit"
n='n'
read -p "please confirm this information is accurate type y to accept type n to cancel: " conf
if [ "$conf" != "$n" ]; then
  git remote add origin git@github.com:$user/$repo.git
  git push -u origin master
else
  echo "you canceled"
fi
