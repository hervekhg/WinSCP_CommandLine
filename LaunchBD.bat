@echo off

set folderwamp=C:\wamp\
set foldermysql=C:\wamp\bin\mysql\mysql5.6.12\bin\

set resource=C:\Users\A577522\Desktop\CCO_dev\Powershell\SFTP\resource\

set fichierdump=DumpForFo.sql
set schemabd=BdForFo.sql

set database=ccotest
set user=root
set mdp=


echo demarrage de wamp
start %folderwamp%wampmanager.exe

echo purge and create database
%foldermysql%mysql.exe --user=%user% --password=%mdp% < %resource%%schemabd%

echo import dump
%foldermysql%mysql.exe --user=%user% --password=%mdp% %database% < %resource%%fichierdump%


echo suppression du dump
del %resource%%fichierdump%