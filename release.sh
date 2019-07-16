#!/usr/bin/env bash
# https://github.com/vuejs/vue/blob/dev/build/release.sh
set -e
echo "Enter commit message: "
read msg
read -p "Are you sure to commit (y/n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]] 
then
  
  echo
  echo

  hexo clean
  hexo g
  npm run css
  
  # commit master
  clear
  echo "master sync starts..."
  git init
  git add .
  git commit -m "$msg"
  git push
  echo "master pushed succeeded..."

  # commit gh-pages
  clear
  echo "gh-pages sync starts..."
  cd ./public
  git init
  git add .
  git commit -m "$msg"
  git push --force git@github.com:AngusFu/blog.git master:gh-pages
  echo "gh-pages sync succeeded..."

  # commit blog-https
  # 这里仅仅 PUSH 到一个未绑定域名的 repo
  # 如果不需要请删除
  clear
  echo "https repo sync starts..."
  rm ./CNAME
  rm -rf .git
  git init
  git add .
  git commit -m "$msg"
  git push  --force git@github.com:yyzl/yyzl.github.io.git master:master
  echo "https repo sync succeeded..."

  rm -rf ./public
  echo "done..."

else
  echo
  echo "Operation is abandoned"
fi


