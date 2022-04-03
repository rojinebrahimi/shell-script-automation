#! bin/bash
server=$(uname -n)
cd /home/user/test_git/nginx
git pull origin master
cp /etc/nginx/sites-enabled/* /home/user/test_git/nginx/nginx/$server
git add -A
git commit -m "Update confs"
git push origin master
