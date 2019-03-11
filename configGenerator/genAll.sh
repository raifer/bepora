#!/bin/sh -x
VERSION=0.1

mkdir -p results
./configGenerator.pl $VERSION x_xkb_root > "results/layout-bepora.xkb"
./configGenerator.pl $VERSION x_xkb_user > "results/layout-bepora-user.xkb"
./configGenerator.pl $VERSION x_xmodmap  > "results/layout-bepora.xmodmap"
./configGenerator.pl $VERSION x_compose  > "results/layout-bepora.XCompose"
./configGenerator.pl $VERSION win_msklc_azerty | iconv -f utf-8 -t utf-16le > "results/beporaA-kbd.klc"
./configGenerator.pl $VERSION win_msklc_bepo   | iconv -f utf-8 -t utf-16le > "results/beporaB-kbd.klc"
./configGenerator.pl $VERSION win_msklc_qwertz | iconv -f utf-8 -t utf-16le > "results/beporaC-kbd.klc"
./configGenerator.pl $VERSION win_msklc_azerty | iconv -f utf-8 -t utf-16 > "results/beporaA.klc"
./configGenerator.pl $VERSION win_msklc_bepo   | iconv -f utf-8 -t utf-16 > "results/beporaB.klc"
./configGenerator.pl $VERSION win_msklc_qwertz | iconv -f utf-8 -t utf-16 > "results/beporaC.klc"

./configGenerator.pl $VERSION description > "results/layout-bepora-desc.html"

./map.py         "results/layout-bepora.xkb" "results/layout-bepora.txt"
./svg.py         "results/layout-bepora.xkb" "results/bepora"
./klavaro.py     "results/layout-bepora.xkb" "results/layout-bepora.kbd"
./ktouch.py      "results/layout-bepora.xkb" "results/layout-bepora.keyboard"
./typefaster.py  "results/layout-bepora.xkb" "results/layout-bepora.xml"
./keymaps.py     "results/layout-bepora.xkb" "results/layout-bepora.map"
./keymaps.py -u  "results/layout-bepora.xkb" "results/layout-bepora.utf8.map"
#./kbdmap.py      "results/layout-bepora.xkb" "results/layout-bepora.kbdmap"
./wscons.py      "results/layout-bepora.xkb" "results/layout-bepora.wscons"
./macosx.py      "results/layout-bepora.xkb" "results/layout-bepora.keylayout"
#./keytables.py   "results/layout-bepora.xkb" "results/layout-bepora.keytables"

perl -p -e 's#\tinclude "pc\(pc105\)"#\tinclude "pc/pc(pc105)"#g' "results/layout-bepora-user.xkb" > "results/layout-bepora-user-legacy.xkb"
perl klc2ini.pl results/beporaB.klc
