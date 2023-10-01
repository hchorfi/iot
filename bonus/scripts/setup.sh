#!/bin/bash

sudo apt-get update
curl --silent "https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh" | sudo bash
sudo EXTERNAL_URL="http://gitlab.local" apt-get install gitlab-ee
echo "gitlab Username: root"
sudo cat /etc/gitlab/initial_root_password | grep "Password:"
