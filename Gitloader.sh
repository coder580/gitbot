file="~/.gitload/repos.txt"
commit=""
conf=""
repo=""
vim README.md
git init
git add *
if [ ! -f ~/.gitload/user.txt ]; then
read -p "what is your github username: " usern
mkdir ~/.gitload
echo " " >> ~/.gitload/repos.txt
echo $usern > ~/.gitload/user.txt
fi
user="$(cat ~/.gitload/user.txt)"
if [ ! -f .git/name.txt ]; then
read -p "what is the repo name: " repo
echo $repo > ~/.gitload/repos.txt
echo $repo >> .git/name.txt
fi
read -p "what do you want to name the commit: " commit
git commit -m "$commit" 
n='n'
read -p "please confirm this information is accurate type y to accept type n to cancel: " conf
if [ "$conf" != "$n" ]; then
  git remote add origin git@github.com:$user/$repo.git > /dev/null
  git push -u origin master
else
  echo "you canceled"
fi
