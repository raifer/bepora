REM Batch à lancer dans %msklc install dir%\bin\i386\ avec les 6 fichiers .klc
REM Sinon, il est possible d'ajouter %msklc install dir%/bin/i386/ dans le PATH de windows
REM Ce script génère les fichiers dlls avec kbdutool.exe
REM Penser à modifier le numéro de version (set ver=...)
REM Le nom de la dll est en dos 8.3 donc le nom de version est abrégé en rc2x
REM Il faut ensuite faire les fichiers d'installation avec msklc
REM (Attention a bien garder le même nom de dll.)

REM Création des dossiers
md bepora-azerty
md bepora
md bepora-qwerty
cd bepora-azerty
md amd64
md i386
md ia64
md sources
md wow64
cd..
cd bepora
md amd64
md i386
md ia64
md sources
md wow64
cd..
cd bepora-qwerty
md amd64
md i386
md ia64
md sources
md wow64
cd..

REM Version azerty
copy beporaA.klc bepora-azerty.klc
move /y bepora-azerty.klc bepora-azerty/sources/
kbdutool.exe -u -s beporaA-kbd.klc
move /y bepora.* bepora-azerty/sources/
kbdutool.exe -u -x beporaA-kbd.klc
move /y bepora.dll bepora-azerty/i386/
kbdutool.exe -u -i beporaA-kbd.klc
move /y bepora.dll bepora-azerty/ia64/
kbdutool.exe -u -m beporaA-kbd.klc
move /y bepora.dll bepora-azerty/amd64/
kbdutool.exe -u -o beporaA-kbd.klc
move /y bepora.dll bepora-azerty/wow64/

REM Version bépo simple
copy beporab.klc bepora.klc
move /y bepora.klc bepora/sources
kbdutool.exe -u -s beporaB-kbd.klc
move /y bepora.* bepora/sources/
kbdutool.exe -u -x beporaB-kbd.klc
move /y bepora.dll bepora/i386/
kbdutool.exe -u -i beporaB-kbd.klc
move /y bepora.dll bepora/ia64/
kbdutool.exe -u -m beporaB-kbd.klc
move /y bepora.dll bepora/amd64/
kbdutool.exe -u -o beporaB-kbd.klc
move /y bepora.dll bepora/wow64/


REM Version qwerty
copy beporaC.klc bepora-qwerty.klc
move /y bepora-qwerty.klc bepora-qwerty/sources/
kbdutool.exe -u -s beporaC-kbd.klc
move /y bepora.* bepora-qwerty/sources/
kbdutool.exe -u -x beporaC-kbd.klc
move /y bepora.dll bepora-qwerty/i386/
kbdutool.exe -u -i beporaC-kbd.klc
move /y bepora.dll bepora-qwerty/ia64/
kbdutool.exe -u -m beporaC-kbd.klc
move /y bepora.dll bepora-qwerty/amd64/
kbdutool.exe -u -o beporaC-kbd.klc
move /y bepora.dll bepora-qwerty/wow64/
