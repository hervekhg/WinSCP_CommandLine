@echo off 


set resource=C:\Users\A577522\Desktop\CCO_dev\Powershell\SFTP\resource\
set folderwinscp=C:\Program Files (x86)\WinSCP

set proto=sftp
set login=avtom02
:: set mdp=laposte09 à changer dans resource/getdump.txt ligne 9
set host=CILVW050
set source=/wav02/absyss/vtom55/dumpbdd/
set dest=%resource%

set output=%resource%

set sevenzip="C:\Program Files\7-Zip\7z.exe"
set dumpzip=DumpForFo.7z.*

echo go to winscp directory
pushd %folderwinscp%

echo Execute file
winscp.com /console /script=%resource%getdump.txt /log=%output%getdump.log /parameter %proto% %login% %host% %source% %resource% %dumpzip%

echo decompression du dump
%sevenzip% e %resource%%dumpzip% -o%resource%

echo suppression du zip 
del %resource%%dumpzip%