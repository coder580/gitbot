read -p "what do you want your README.md to be: " readme
echo $readme >> README.md
git init
git add *
read -p "what is your github username: " user
read -p "what is the repo name:" repo
read -p "what do you want to name your first commit:" commit
git commit -m "$commit"
echo "please confirm your username is " $user "your readme is " $readme "your repo is " $repo "your commit is " $commit
git remote add origin git@github.com:$user/$repo.git
git push -u origin master
