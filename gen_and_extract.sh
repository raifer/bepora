#!/bin/sh
VERSION=0.1

cd configGenerator
sh genAll.sh
cd ..
mkdir -p results
mv configGenerator/results/layout.ini results/
mv configGenerator/results/beporaB.klc results/
mv configGenerator/results/layout-bepora-desc.html results/bepora.html
