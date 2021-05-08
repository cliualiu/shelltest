#!/usr/bin/env bash
#这是一个变量替换的例子
read -p "请输入MySQL版本号，默认为5.7.24" lv
level=${lv:='5.7.24'}
package_lv=${level:0:3}
echo "即将下载MySQL $lv"
wget https://dev.mysql.com/get/Downloads/MySQL-${package_lv}/mysql-boost-${level}.tar.gz
