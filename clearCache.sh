#!/usr/bin/env bash
#useage: ./bin/clearCache.sh --css --sessions --logs

echo "Start clearing cache"


while [ "$1" != '' ]
  do
    [ "$1" == "--css" ] && CSS="yes" &&  shift
    [ "$1" == "--sessions" ] && SESSIONS="yes" && shift
    [ "$1" == "--logs" ] && LOGS="yes"  && shift
    shift #unknown
done



dir=$(cd -P -- "$(dirname -- "$0")/.." && pwd -P)

echo "Clear View Cache"

rm -rf $dir/cache/*.php
rm -rf $dir/cache/*.pdc
rm -rf $dir/cache/execute_post_installation_admin_extenders



if [ "$CSS" == "yes" ]
    then
        echo "Clear CSS cache"

        rm -f $dir/cache/*.css
        rm -f $dir/cache/*.css.*
        rm -f $dir/templates/Honeygrid/assets/javascript/init-de.min.js
fi

if [ "$SESSIONS" == "yes" ]
    then
        echo "Clear SESSIONS cache"

        rm -f $dir/cache/sess_*
fi

if [ "$LOGS" == "yes" ]
    then
        echo "Clear LOGS"

        rm -f $dir/logfiles/errors-*.html
        rm -f $dir/logfiles/errors-*.log
fi


echo "Clear TEMPLATE Cache"

rm -rf $dir/templates_c/*


echo "Refresh RIGHTS"
chmod -R 777 $dir/cache
chmod -R 777 $dir/templates_c
chmod -R 777 $dir/templates/Honeygrid/styles/custom
chmod -R 777 $dir/templates/Honeygrid/assets/images/custom
chmod 444 $dir/admin/includes/configure.php
chmod 444 $dir/admin/includes/configure.org.php
chmod 444 $dir/includes/configure.php
chmod 444 $dir/includes/configure.org.php


echo "End clearing cache"
