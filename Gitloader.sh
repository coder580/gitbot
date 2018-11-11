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
echo $usern > ~/.gitload/user.txt
fi
user="$(cat ~/.gitload/user.txt)"
read -p "what is the repo name: " repo
grep -qF -- "$repo" "$file" || echo "$repo" >> "$file"
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
