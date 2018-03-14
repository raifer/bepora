REM Batch à lancer dans %msklc install dir%\bin\i386\ avec les 6 fichiers .klc
REM Sinon, il est possible d'ajouter %msklc install dir%/bin/i386/ dans le PATH de windows
REM Ce script génère les fichiers dlls avec kbdutool.exe
REM Penser à modifier le numéro de version (set ver=...)
REM Le nom de la dll est en dos 8.3 donc le nom de version est abrégé en rc2x
REM Il faut ensuite faire les fichiers d'installation avec msklc
REM (Attention a bien garder le même nom de dll.)
set ver=01

REM Création des dossiers
md bepora-%ver%-azerty
md bepora-%ver%
md bepora-%ver%-qwerty
cd bepora-%ver%-azerty
md amd64
md i386
md ia64
md sources
md wow64
cd..
cd bepora-%ver%
md amd64
md i386
md ia64
md sources
md wow64
cd..
cd bepora-%ver%-qwerty
md amd64
md i386
md ia64
md sources
md wow64
cd..

REM Version azerty
copy bepora-%ver%A.klc bepora%ver%-azerty.klc
move /y bepora%ver%-azerty.klc bepora-%ver%-azerty/sources/
kbdutool.exe -u -s bepora-%ver%A-kbd.klc
move /y bepora%ver%.* bepora-%ver%-azerty/sources/
kbdutool.exe -u -x bepora-%ver%A-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-azerty/i386/
kbdutool.exe -u -i bepora-%ver%A-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-azerty/ia64/
kbdutool.exe -u -m bepora-%ver%A-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-azerty/amd64/
kbdutool.exe -u -o bepora-%ver%A-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-azerty/wow64/

REM Version bépo simple
copy bepora-%ver%b.klc bepora%ver%.klc
move /y bepora%ver%.klc bepora-%ver%/sources
kbdutool.exe -u -s bepora-%ver%B-kbd.klc
move /y bepora%ver%.* bepora-%ver%/sources/
kbdutool.exe -u -x bepora-%ver%B-kbd.klc
move /y bepora%ver%.dll bepora-%ver%/i386/
kbdutool.exe -u -i bepora-%ver%B-kbd.klc
move /y bepora%ver%.dll bepora-%ver%/ia64/
kbdutool.exe -u -m bepora-%ver%B-kbd.klc
move /y bepora%ver%.dll bepora-%ver%/amd64/
kbdutool.exe -u -o bepora-%ver%B-kbd.klc
move /y bepora%ver%.dll bepora-%ver%/wow64/


REM Version qwerty
copy bepora-%ver%C.klc bepora%ver%-qwerty.klc
move /y bepora%ver%-qwerty.klc bepora-%ver%-qwerty/sources/
kbdutool.exe -u -s bepora-%ver%C-kbd.klc
move /y bepora%ver%.* bepora-%ver%-qwerty/sources/
kbdutool.exe -u -x bepora-%ver%C-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-qwerty/i386/
kbdutool.exe -u -i bepora-%ver%C-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-qwerty/ia64/
kbdutool.exe -u -m bepora-%ver%C-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-qwerty/amd64/
kbdutool.exe -u -o bepora-%ver%C-kbd.klc
move /y bepora%ver%.dll bepora-%ver%-qwerty/wow64/
