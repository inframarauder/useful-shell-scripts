#!/usr/bin/env bash

##shell script to export all collections of a db as json 

dbName=$1

if [ -z "$dbName" ];
then
    echo "Please enter db name"
else
    collections=$(mongo $dbName --quiet --eval "db.getCollectionNames()") ##returns a string (not array) [c1,c2,c3..so on]

    for col in $collections;
    do
        if [[ "$col" == "[" || "$col" == "]" ]];then
            continue
        fi
        col=${col:1}
        col=${col::-2}
        mongoexport --db=$dbName --collection=$col --out="mongoexports/"$col"."json
    done
fi
