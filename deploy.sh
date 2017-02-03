#!/bin/bash

DOMAIN="www.datachomp.com"
SERVER="wren"

ssh $SERVER "mkdir -p ~/www/${DOMAIN} && exit"

# rsync -r -e ssh ./ $SERVER:~/www/${DOMAIN}
rsync -vzcrSLhp --exclude="deploy.sh" --exclude="nginx.conf" ./ $SERVER:~/www/${DOMAIN}

## ssh $SERVER "rm ~/www/${DOMAIN}/deploy.sh ~/www/${DOMAIN}/nginx.conf && exit"

scp nginx.conf $SERVER:/tmp/$DOMAIN
ssh -t $SERVER "sudo mv /tmp/${DOMAIN} /etc/nginx/sites-enabled/  && sudo service nginx reload && exit"
