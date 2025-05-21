

git config --global user.name "zone"
git config --global user.email zonecnh@gmail.com

current_date=$(date "+%Y-%m-%d %H:%M:%S")


git init
git add .
current_date=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "$current_date" --date="$current_date"
git branch -M main
git remote add origin git@github.com:RustFlux/wireguard.git
git push -u origin main


