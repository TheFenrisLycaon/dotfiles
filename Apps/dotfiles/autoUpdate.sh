#! /bin/bash

cd /home/fenris
/usr/bin/git --git-dir=/home/fenris/.cfg/ --work-tree=/home/fenris add -u
/usr/bin/git --git-dir=/home/fenris/.cfg/ --work-tree=/home/fenris commit -m "Auto-Update" -m "This commit was made automatically"
/usr/bin/git --git-dir=/home/fenris/.cfg/ --work-tree=/home/fenris push
