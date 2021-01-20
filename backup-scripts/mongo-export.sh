#!/usr/bin/env bash

##shell script to export dump json from mongo collection

echo "Enter DB Name"
read dbName
echo "Enter collection Name"
read collectionName
echo "Enter output path"
read outputPath

sudo mongoexport --db $dbName --collection $collectionName --out $outputPath