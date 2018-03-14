#!/bin/sh -x
VERSION=01

mkdir -p results
./configGenerator.pl $VERSION x_xkb_root > "results/layout-${VERSION}.xkb"
./configGenerator.pl $VERSION x_xkb_user > "results/layout-${VERSION}-user.xkb"
./configGenerator.pl $VERSION x_xmodmap  > "results/layout-${VERSION}.xmodmap"
./configGenerator.pl $VERSION x_compose  > "results/layout-${VERSION}.XCompose"
./configGenerator.pl $VERSION win_msklc_azerty | iconv -f utf-8 -t utf-16le > "results/bepora-${VERSION}A-kbd.klc"
./configGenerator.pl $VERSION win_msklc_bepo   | iconv -f utf-8 -t utf-16le > "results/bepora-${VERSION}B-kbd.klc"
./configGenerator.pl $VERSION win_msklc_qwertz | iconv -f utf-8 -t utf-16le > "results/bepora-${VERSION}C-kbd.klc"
./configGenerator.pl $VERSION win_msklc_azerty | iconv -f utf-8 -t utf-16 > "results/bepora-${VERSION}A.klc"
./configGenerator.pl $VERSION win_msklc_bepo   | iconv -f utf-8 -t utf-16 > "results/bepora-${VERSION}B.klc"
./configGenerator.pl $VERSION win_msklc_qwertz | iconv -f utf-8 -t utf-16 > "results/bepora-${VERSION}C.klc"

./configGenerator.pl $VERSION description > "results/layout-${VERSION}-desc.html"

./map.py         "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.txt"
./svg.py         "results/layout-${VERSION}.xkb" "results/bepora-${VERSION}"
./klavaro.py     "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.kbd"
./ktouch.py      "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.keyboard"
./typefaster.py  "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.xml"
./keymaps.py     "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.map"
./keymaps.py -u  "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.utf8.map"
./kbdmap.py      "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.kbdmap"
./wscons.py      "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.wscons"
./macosx.py      "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.keylayout"
./keytables.py   "results/layout-${VERSION}.xkb" "results/layout-${VERSION}.keytables"

perl -p -e 's#\tinclude "pc\(pc105\)"#\tinclude "pc/pc(pc105)"#g' "results/layout-${VERSION}-user.xkb" > "results/layout-${VERSION}-user-legacy.xkb"
