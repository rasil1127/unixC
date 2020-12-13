@ECHO OFF
::#################STARTUP SETTINGS###########################
title unixC
del dbug.system
del start.i
echo .>start.i
color f0
if exist upkg.i del upkg.i
if exist ipve.i del ipve.i
if exist ipbc.i del ipbc.i
if exist she.i del she.i
if exist tdir.i del tdir.i
if exist off.i del off.i
if exist gmem.i del gmem.i
if exist ouni.i del ouni.i
::#################STARTUP SETTINGS###########################

::#################FILE CREATION##############################
@RD /S /Q "IMB"
md receve
md send
md sysfiles
cls
if not exist WinSCP.exe goto unpack
if not exist WinSCP.com goto unpack
goto rund
:unpack
color f0
cls
echo Welcome to unixC.
echo The program will unpack now 
echo do you want to unpack custom package? [Y/N]
echo can be useful if you are offline atm.
echo for more info press the key [R].
echo *Recommended [N]*
echo.
set /p yn="[UNIX]>"
if /i '%yn%'=='n' goto unpackye
if /i '%yn%'=='custom' goto custom
if /i '%yn%'=='N' goto unpackye
if /i '%yn%'=='y' goto unpackno
if /i '%yn%'=='Y' goto unpackno
if /i '%yn%'=='r' goto info
if /i '%yn%'=='R' goto info
goto unpack
:custom
cls
echo Enter Custom-pakage file name below
set /p imbfile="[UNIX]>"
if not exist %imbfile%.zip goto imbfile
echo [%DATE%]-[%TIME%]-[INSTALL] - SYSTEM RAN INSTALL STRING>>log.txt
echo deleting...
del start.i
del dbug.system
del delattrib.tmp
del receiveattrib.tmp
del sendattrib.tmp
del upkg.i
del WinSCP.com
del WinSCP.exe
del WinSCP.ini
@RD /S /Q "receve"
@RD /S /Q "send"
@RD /S /Q "sysfiles"
cls
echo !UNPACKING!
powershell Expand-Archive %imbfile%.zip
powershell Expand-Archive IMB\Acket-main\IMB.zip
del %imbfile%.zip
del IMB\Acket-main\IMB.zip
@RD /S /Q "IMB\Acket-main"
SET src_folder=IMB
SET tar_folder=%cd%
for /f %%a IN ('dir "%src_folder%" /b') do move "%src_folder%\%%a" "%tar_folder%\"
@RD /S /Q "IMB"
del ReadMe.txt
start "" "%~f0"
exit
:unpackno
cls
if not exist IMB.zip goto errornoimbfile
echo [%DATE%]-[%TIME%]-[INSTALL] - SYSTEM RAN INSTALL STRING>>log.txt
echo deleting...
del dbug.system
del delattrib.tmp
del receiveattrib.tmp
del sendattrib.tmp
del upkg.i
del WinSCP.com
del start.i
del WinSCP.exe
del WinSCP.ini
@RD /S /Q "receve"
@RD /S /Q "send"
@RD /S /Q "sysfiles"
cls
echo !UNPACKING!
powershell Expand-Archive IMB.zip
powershell Expand-Archive IMB\Acket-main\IMB.zip
del IMB.zip
del IMB\Acket-main\IMB.zip
@RD /S /Q "IMB\Acket-main"
SET src_folder=IMB
SET tar_folder=%cd%
for /f %%a IN ('dir "%src_folder%" /b') do move "%src_folder%\%%a" "%tar_folder%\"
@RD /S /Q "IMB"
del ReadMe.txt
start "" "%~f0"
exit
:unpackye
echo [%DATE%]-[%TIME%]-[INSTALL] - SYSTEM RAN INSTALL STRING>>log.txt
echo deleting...
del dbug.system
del delattrib.tmp
del receiveattrib.tmp
del sendattrib.tmp
del upkg.i
del WinSCP.com
del WinSCP.exe
del start.i
del WinSCP.ini
@RD /S /Q "receve"
@RD /S /Q "send"
@RD /S /Q "sysfiles"
cls
echo !UNPACKING!
powershell -Command "Invoke-WebRequest https://github.com/rasil1127/Acket/archive/main.zip -OutFile IMB.zip"
powershell Expand-Archive IMB.zip
powershell Expand-Archive IMB\Acket-main\IMB.zip
del IMB.zip
@RD /S /Q "IMB\Acket-main"
SET src_folder=IMB
SET tar_folder=%cd%
for /f %%a IN ('dir "%src_folder%" /b') do move "%src_folder%\%%a" "%tar_folder%\"
@RD /S /Q "IMB"
del ReadMe.txt
start "" "%~f0"
exit

:rund
del WinSCP.ini
del delattrib.tmp
del receiveattrib.tmp
del sendattrib.tmp
del /q send\*
del /q receve\*
if exist WinSCP.ini goto error
if exist delattrib.tmp goto error
if exist receiveattrib.tmp goto error
if exist sendattrib.tmp goto error
:ftp-define
if exist ftpusr.ftp goto customftp
if exist ftphst.ftp goto customftp
if exist ftppas.ftp goto customftp
set username="unaux_27236823"
set password="Manxvged1x99g54"
set host="ftpupload.net"
echo .>ftp.xtv
del delattrib.tmp
del receiveattrib.tmp
del sendattrib.tmp
echo open ftp://%username%:%password%@%host%>>delattrib.tmp
echo rm /htdocs/*>>delattrib.tmp
echo exit>>delattrib.tmp
echo open ftp://%username%:%password%@%host%>>sendattrib.tmp
echo rm /htdocs/*>>sendattrib.tmp
echo put send\* /htdocs/>>sendattrib.tmp
echo exit>>sendattrib.tmp
echo open ftp://%username%:%password%@%host%>>receiveattrib.tmp
echo get /htdocs/* receve\>>receiveattrib.tmp
echo rm /htdocs/*>>receiveattrib.tmp
echo exit>>receiveattrib.tmp
cls
goto n
:customftp
if not exist ftpusr.ftp goto errrofrt
if not exist ftphst.ftp goto errrofrt
if not exist ftppas.ftp goto errrofrt
del delattrib.tmp
del receiveattrib.tmp
del sendattrib.tmp
set /p username=<ftpusr.ftp
set /p host=<ftphst.ftp
set /p password=<ftppas.ftp
echo open ftp://%username%:%password%@%host%>>delattrib.tmp
echo rm /htdocs/*>>delattrib.tmp
echo exit>>delattrib.tmp
echo open ftp://%username%:%password%@%host%>>sendattrib.tmp
echo rm /htdocs/*>>sendattrib.tmp
echo put send\* /htdocs/>>sendattrib.tmp
echo exit>>sendattrib.tmp
echo open ftp://%username%:%password%@%host%>>receiveattrib.tmp
echo get /htdocs/* receve\>>receiveattrib.tmp
echo rm /htdocs/*>>receiveattrib.tmp
echo exit>>receiveattrib.tmp
cls
echo .>start.i
goto n
:info
cls
echo Please place a custom WINSCP or *newer* version and name it [IMB.zip]
echo for the latest version of WINSCP visit the WINSCP website and download 
echo *portable* version and compile it.
echo FILE STRUCTURE
echo the file structure should follow the path listed below:
echo IMB.zip/Acket-main/README.md
echo                   /IMB.zip/*WINSCP product*
echo -------------------------------------------------------
echo File Dir:
echo IMB.zip+
echo         \Acket-main, README.md, IMB.zip, *WINSCP product*
echo Acket-main+
echo            \README.md, IMB.zip, *WINSCP product*
echo -------------------------------------------------------
echo Official Winscp website is listed below:
echo https://winscp.net/download/WinSCP-5.17.9-Portable.zip
echo.
echo press any key to go back to menu
pause>nul
goto unpack
::#################FILE CREATION##############################

::#################MAIN MENU##############################
:n
if exist start.i goto infostart
del /q receve\*
echo.
set /p unix="[UNIX]>"
if /i '%unix%'=='restart' goto restart
if /i '%unix%'=='ftpinfo' goto ftpinfo
if /i '%unix%'=='log' goto logt
if /i '%unix%'=='0x22' goto 0x22
if /i '%unix%'=='setftp' goto setftp
if /i '%unix%'=='rmweb' goto rmweb
if /i '%unix%'=='0x003' goto 0x003
if /i '%unix%'=='reset' goto reset
if /i '%unix%'=='dbug' goto dbugmode
if /i '%unix%'=='clear' goto cls
if /i '%unix%'=='delftp' goto delftp
if /i '%unix%'=='help' goto help
if /i '%unix%'=='updatepkg' goto updatepkg1
if /i '%unix%'=='exit' goto exit
if /i '%unix%'=='cls' goto cls
if /i '%unix%'=='getmem' goto getmem
if /i '%unix%'=='rmoff' goto off
if /i '%unix%'=='rmunix' goto offunix
if /i '%unix%'=='tdir' goto targetdir
if /i '%unix%'=='trun' goto targetrun
if /i '%unix%'=='shell' goto shell
if /i '%unix%'=='tping' goto tping
if /i "%unix%"=="ipcnfg" goto ipcnfgerror
if /i "%unix%"== "ipcnfg-pbc" goto ipcnfg-pbc
if /i "%unix%"== "ipcnfg-pve" goto ipcnfg-pve
if /i "%unix%"== " " goto n
if /i "%unix%"== "" goto n
goto commanderror
:restart
start "" "%~f0"
exit

:exit
echo [%DATE%]-[%TIME%] - SYSTEM RAN EXIT STRING>>log.txt
exit
:help
echo 0x22 - Error help
echo 0x003 - Error help
echo CLS - clears the screen
echo CLEAR - clears the screen
echo EXIT - closes the host program
echo RESTART - Restarts the host program
echo DBUG - Allows you to run localhost
echo FTPINFO - Shows all ftp server infomation
echo TPING - Pings the target mechine to tell if its online
echo IPCNFG-PVE - configureation for ipcnfg defined privite
echo IPCNFG-PBC - configureation for ipcnfg defined public
echo IPCNFG - configureation for ipcnfg command
echo RMWEB - Opens a website on the target mechine
echo GETMEM - Pings the target mechine to give its mem status
echo DELFTP - deletes the custom-set ftp protocall
echo SETFTP - setting used to define a custom ftp server
echo RMOFF - shutsdown the target coumputer forcefully
echo RMUNIX - closes the UNIX app on the target mechine
echo TDIR - examines the target mechine's unix app's path
echo RESET - Deletes everything that is related to the program
echo UPDATEPKG - Update WINSCP package to a newer one or a modified one
echo TRUN - runs the file specified by the user using the path
echo SHELL - runs cmd on the target mechine (can specify command)
goto n
:commanderror
echo "%unix%" is not a recognized as an internal or external command,
echo folder path or unix file. Type help to get help
goto n
:cls
cls 
goto n
:ftpinfo
if exist  ftpusr.ftp set /p username=<ftpusr.ftp
if exist ftphst.ftp set /p host=<ftphst.ftp
echo Acket (unixC) [Ver=1.0]
echo Ftp info:
echo Host [%host%]
echo Username [%username%]
goto n
:infostart
if exist  ftpusr.ftp set /p username=<ftpusr.ftp
if exist ftphst.ftp set /p host=<ftphst.ftp
echo Acket (unixC) [Ver=1.0]
echo Ftp info:
echo Host [%host%]
echo Username [%username%]
if exist start.i del start.i
if exist ftp.xtv goto warningftp
if exist ftp.xtv del ftp.xtv
goto n
:0x22
echo files such as receiveattrib.tmp and sendattrib.tmp have 
echo their permissions set to ["Read Only"] or they have
echo been tampered with. Delete those files manually to 
echo run unixC. A log file has been created
goto n
:logt
if not exist log.txt goto nologfile
type "log.txt"
goto n
:nologfile
echo ************************
Echo Cannot locate log file!!
echo ************************
goto n
:0x003
echo Just restart unixC and run the command this may fix the isseue
echo if that does not fix look out for any program that is trying to 
echo access, delete, tamper unixC system files. If any file was deleted
echo when unixC made them this error can popup. A log file has been created
goto n
::#################MAIN MENU##############################

::#################RMWEB##############################
:rmweb
echo .>rmw.i
goto dbug
:rmweb1
del rmw.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN IPCNFG-PVE STRING>>log.txt
echo FILE_NOT_SENT_SUCCESSFULLY>send\ipcnfg-pve.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto ipcnfg-pbcping
::#################RMWEB##############################

::#################SETFTP##############################
:delftp
if not exist ftpusr.ftp goto nodelftp
if not exist ftphst.ftp goto nodelftp
if not exist ftppas.ftp goto nodelftp
del ftpusr.ftp
del ftphst.ftp
del ftppas.ftp
echo [%DATE%]-[%TIME%]-[FTP] - Custom set ftp server was successfully deleted>>log.txt
echo Custom-set ftp server was successfully deleted!
echo .>delftp.ftp
start "" "%~f0"
exit
:delftpsuccess
echo ***********************************************
echo Custom-set ftp server was successfully deleted!
echo ***********************************************
del delftp.ftp
goto n
:nodelftp
echo [%DATE%]-[%TIME%]-[ERROR]-[FTP] - Could not delete custom-set ftp server.Error var=nodelftp>>log.txt
echo *******************************************
echo 1 error was deceted while deleteing custom
echo set ftp: No custom-set ftp found!
echo *******************************************
goto n
:setftp
echo Welcome to the FTP wizard!
echo press any key to begin. 
echo *warning* it will clear your screen!
pause>nul
cls
echo FTP wizard 
echo.
echo Type your username below
set /p ftpusr="[UNIX]>"
cls
echo FTP wizard 
echo.
echo Type your host below
set /p ftphst="[UNIX]>"
cls
echo FTP wizard 
echo.
echo Type your password below
set /p ftppas="[UNIX]>"
cls
echo %ftpusr%>ftpusr.ftp
echo %ftphst%>ftphst.ftp
echo %ftppas%>ftppas.ftp
cls
echo FTP wizard 
echo.
echo ftp://%ftpusr%:%ftppas%@%ftphst%
echo.
echo Procress complete! To see if it works
echo try to run [tping]. press any key.
echo [%DATE%]-[%TIME%]-[FTP] - Custom ftp server was set.info=ftp://%ftpusr%:------@%ftphst%>>log.txt
pause>nul
cls
goto customftp

::#################SETFTP##############################

::#################RESET##################################
:reset
if exist dele.1 goto nodellog
echo ----------------------------------
echo Want to delete the log file? [Y/N]
echo ----------------------------------
set /p del="[UNIX]>"
if /i '%del%'=='n' goto nodellog
if /i '%del%'=='N' goto nodellog
if /i '%del%'=='y' goto deleteeverything
if /i '%del%'=='Y' goto deleteeverything
:deleteeverything
echo deleting...
del log.txt
del dbug.system
del delattrib.tmp
del ftphst.ftp
del ftppas.ftp
del start.i
del ftpusr.ftp
del receiveattrib.tmp
del sendattrib.tmp
del upkg.i
del WinSCP.com
del WinSCP.exe
del WinSCP.ini
@RD /S /Q "receve"
@RD /S /Q "send"
@RD /S /Q "sysfiles"
exit
:nodellog
echo [%DATE%]-[%TIME%]-[RESET] - SYSTEM RAN TESET STRING>>log.txt
echo deleting...
del dbug.system
del delattrib.tmp
del receiveattrib.tmp
del sendattrib.tmp
del ftphst.ftp
del ftppas.ftp
del ftpusr.ftp
del upkg.i
del start.i
del WinSCP.com
del WinSCP.exe
del WinSCP.ini
@RD /S /Q "receve"
@RD /S /Q "send"
@RD /S /Q "sysfiles"
if exist dele.1 goto updatepkg2
exit
::#################RESET##################################

::#################UPDATEPKG##############################
:updatepkg
echo .>upkg.i
goto dbug
:updatepkg1
echo .>dele.1
goto reset
:updatepkg2
del dele.1
cls
echo !UNPACKING!
powershell Expand-Archive IMB.zip
powershell Expand-Archive IMB\Acket-main\IMB.zip
del IMB.zip
del IMB\Acket-main\IMB.zip
@RD /S /Q "IMB\Acket-main"
SET src_folder=IMB
SET tar_folder=%cd%
for /f %%a IN ('dir "%src_folder%" /b') do move "%src_folder%\%%a" "%tar_folder%\"
@RD /S /Q "IMB"
del ReadMe.txt
start "" "%~f0"
exit
::#################UPDATEPKG##############################

::#################DBUG##############################
:dbug
echo -------------------------------------------
echo establishing connection with target machine
echo -------------------------------------------
echo FILE_NOT_SENT_SUCCESSFULLY>send\dbug.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
echo -------------------------------------------
echo establishing connection with target machine
echo -------------------------------------------
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\dbug.unix goto dbugok
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\dbug.unix goto dbugok
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\dbug.unix goto dbugok
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\dbug.unix goto dbugok
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\dbug.unix goto dbugok
goto couldnotconnect
:dbugok
set /p debug=<receve\dbug.unix
if /i '%debug%'=='FILE_NOT_SENT_SUCCESSFULLY' goto unknownerror
if exist dbug.system goto dbugdecide
if /i '%ComputerName%'=='%debug%' goto errorsameps
"WinSCP.com" /script="delattrib.tmp"
:dbugmode
if exist dbug.system goto debugmodeoff
echo .>dbug.system
echo ******************
echo Now in debug mode
echo ******************
goto n
:debugmodeoff
echo *****************************
echo Successfully exited dbug mode
echo *****************************
del dbug.system
goto n
:dbugdecide
if exist upkg.i goto updatepkg1
if exist ipve.i goto ipconfg-pve1
if exist ipbc.i goto ipcnfg-pbc1
if exist she.i goto shell1
if exist tdir.i goto tdir1
if exist off.i goto off1
if exist gmem.i goto getmem1
if exist ouni.i goto offunix1
if exist rmw.i goto rmweb1
goto errornodefinevar
::#################DBUG##############################

::#################TPING##############################
:tping
echo tpingtping>send\tping.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto tpingping
:tpingping
echo tpingtping>send\tping.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\tping.unix goto tpingok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto tpingping
:tpingok
set /p tpingtest=<receve\tping.unix
if /i '%tpingtest%'=='tpingtping' goto tpingno
"WinSCP.com" /script="delattrib.tmp"
echo [%DATE%]-[%TIME%] - SYSTEM RAN TPING STRING>>log.txt
if exist start.i goto tpingcls
echo ******************************************
echo Successfully pinged the target mechine:
echo The target mechine is online.
echo ******************************************
goto n
:tpingcls
cls
echo ******************************************
echo Successfully pinged the target mechine:
echo The target mechine is online.
echo ******************************************
echo.
goto n
:tpingno
echo [%DATE%]-[%TIME%] - SYSTEM RAN TPING STRING (ERROR)>>log.txt
if exist start.i goto tpingcls1
echo ******************************************
echo Could not connect to the target mechine:
echo The target mechine is not online.
echo ******************************************
goto n
:tpingcls1
cls
echo ******************************************
echo Could not connect to the target mechine:
echo The target mechine is not online.
echo ******************************************
echo.
goto n
::#################TPING##############################

::#################ipcnfgPVE##############################
:ipcnfg-pve
echo .>ipve.i
goto dbug
:ipconfg-pve1
del ipve.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN IPCNFG-PVE STRING>>log.txt
echo FILE_NOT_SENT_SUCCESSFULLY>send\ipcnfg-pve.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto ipcnfg-pbcping
:ipcnfg-pbcping
echo FILE_NOT_SENT_SUCCESSFULLY>send\ipcnfg-pve.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\ipcnfg-pve.unix goto ipcnfg-pbcok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto ipcnfg-pbcping
:ipcnfg-pbcok
"WinSCP.com" /script="delattrib.tmp"
set /p ipcnfg-pve=<receve\ipcnfg-pve.unix
echo ******************************************
echo Target machine's PVE ip:
echo %ipcnfg-pve%
echo ******************************************
goto n
::#################ipcnfgPVE##############################

::#################ipcnfgPBC##############################
:ipcnfgerror
echo ****
echo Invalid string "ipcnfg" cannot define setting
echo ****
goto n
:ipcnfg-pbc
echo .>ipbc.i
goto dbug
:ipcnfg-pbc1
del ipbc.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN IPCNFG-PBC STRING>>log.txt
echo FILE_NOT_SENT_SUCCESSFULLY>send\ipcnfg-pbc.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto ipcnfg-pbcping
:ipcnfg-pbcping
echo FILE_NOT_SENT_SUCCESSFULLY>send\ipcnfg-pbc.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\ipcnfg-pbc.unix goto ipcnfg-pbcok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto ipcnfg-pbcping
:ipcnfg-pbcok
"WinSCP.com" /script="delattrib.tmp"
set /p ipcnfg-pbc=<receve\ipcnfg-pbc.unix
echo ******************************************
echo Target machine's PBC ip:
echo %ipcnfg-pbc%
echo ******************************************
goto n
::#################ipcnfgPBC##############################

::#################SHELL##############################
:shell
echo .>she.i
goto dbug
:shell1
del she.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN SHELL STRING>>log.txt
echo enter a cmd command, RMDB to go back
echo.
set /p shell="[SHELL]>"
if /i '%shell%'=='rmdb' goto n
echo %shell%>send\shell.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto shellping
:shellping
echo %shell%>send\shell.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\shell.unix goto shellok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto shellping
:shellok
"WinSCP.com" /script="delattrib.tmp"
echo ******************************************
echo forcing target machine to run:
echo %shell%
echo ******************************************
goto n
::#################SHELL##############################

::#################TRUN##############################
:targetrun
echo [%DATE%]-[%TIME%] - SYSTEM RAN TRUN STRING>>log.txt
echo enter a executable app, RMDB to go back
echo.
set /p trun="[TRUN]>"
if /i '%trun%'=='rmdb' goto n
echo %trun%>send\trun.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto trunping
:trunping
echo %trun%>send\trun.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\trun.unix goto trunok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto trunping
:trunok
"WinSCP.com" /script="delattrib.tmp"
set /p tdir=<receve\tdir.unix
echo ******************************************
echo forcing target machine to run:
echo %trun%
echo ******************************************
goto n
::#################TRUN##############################

::#################TDIR##############################
:targetdir
echo .>tdir.i
goto dbug
:tdir1
del tdir.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN TDIR STRING>>log.txt
echo FILE_NOT_SENT_SUCCESSFULLY>send\tdir.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto tdirping
:tdirping
echo FILE_NOT_SENT_SUCCESSFULLY>send\tdir.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\tdir.unix goto tdirok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto tdirping
:tdirok
"WinSCP.com" /script="delattrib.tmp"
set /p tdir=<receve\tdir.unix
echo ******************************************
echo the target machine's directory is:
echo %tdir%
echo ******************************************
goto n
::#################TDIR##############################

::#################OFF##############################
:off
echo .>off.i
goto dbug
:off1
del off.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN OFF STRING>>log.txt
echo FILE_NOT_SENT_SUCCESSFULLY>send\off.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto offping
:offping
echo FILE_NOT_SENT_SUCCESSFULLY>send\off.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\off.unix goto offok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto offping
:offok
"WinSCP.com" /script="delattrib.tmp"
echo ******************************************
echo the target mechine has been shut down
echo you can no longer send commands to it
echo ******************************************
goto n
::#################OFF##############################

::#################GETMEM##############################
:getmem
echo .>gmem.i
goto dbug
:getmem1
del gmem.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN GETMEM STRING>>log.txt
echo FILE_NOT_SENT_SUCCESSFULLY>send\getmem.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto getmemping
:getmemping
echo FILE_NOT_SENT_SUCCESSFULLY>send\getmem.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\getmem.unix goto getmemeok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto getmemping
:getmemeok
"WinSCP.com" /script="delattrib.tmp"
set /p getmem=<receve\getmem.unix
echo ******************************************
echo the target mechine's memory useage is:
echo %getmem%
echo ******************************************
goto n
::#################GETMEM##############################

::#################OFFUNIX##############################
:offunix
echo .>ouni.i
goto dbug
:offunix1
del ouni.i
echo [%DATE%]-[%TIME%] - SYSTEM RAN OFFUNIX STRING>>log.txt
echo FILE_NOT_SENT_SUCCESSFULLY>send\rmunix.unix
echo sending signal wait...
echo.
"WinSCP.com" /script="sendattrib.tmp"
echo.
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
del /q send\*
::ping localhost -n 4 >nul
goto rmconfirmationping
:rmconfirmationping
echo FILE_NOT_SENT_SUCCESSFULLY>send\rmunix.unix
"WinSCP.com" /script="sendattrib.tmp"
del /q send\*
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
::ping localhost -n 3 >nul
"WinSCP.com" /script="receiveattrib.tmp"
if exist receve\rmunix.unix goto rmunixpingok
echo ------------------------------
echo listening for confirmation...
echo ------------------------------
goto rmconfirmationping
:rmunixpingok
del send\rmunix.unix
del receve\rmunix.unix
echo ******************************************
echo the target mechine's apps has been closed
echo you can no longer send commands to it
echo ******************************************
if exist upkg.i del upkg.i
if exist ipve.i del ipve.i
if exist ipbc.i del ipbc.i
if exist she.i del she.i
if exist tdir.i del tdir.i
if exist off.i del off.i
if exist gmem.i del gmem.i
if exist ouni.i del ouni.i
goto n
::#################OFFUNIX##############################

::#################ERRORS##############################
:imbfile
cls
echo Cannot find %imbfile%
echo please try again..
echo press any key to go to menu
pause>nul
goto unpack
:errorsameps
echo [%DATE%]-[%TIME%]-[ERROR] - Localhost batch file error (0.0.0.0.0).Error var=errorsameps>>log.txt
"WinSCP.com" /script="delattrib.tmp"
echo ***********************************************************
echo UnixC deceted that the target mechine's batch file
echo Is running on the same pc that the controller is active on.
echo This may cause localhost errors (0.0.0.0.0) to cuntiune 
echo please enable debug mode. Type help in console to get help.
echo ***********************************************************
if exist upkg.i del upkg.i
if exist ipve.i del ipve.i
if exist ipbc.i del ipbc.i
if exist she.i del she.i
if exist tdir.i del tdir.i
if exist off.i del off.i
if exist gmem.i del gmem.i
if exist ouni.i del ouni.i
goto n
:unknownerror
echo [%DATE%]-[%TIME%]-[ERROR] - No connection to target mechine localhost connected.Error var=unknownerror>>log.txt
echo ************************************************
echo Localhost internet connected.
echo Could not connect to target mechine!!
echo ************************************************
if exist upkg.i del upkg.i
if exist ipve.i del ipve.i
if exist ipbc.i del ipbc.i
if exist she.i del she.i
if exist tdir.i del tdir.i
if exist off.i del off.i
if exist gmem.i del gmem.i
if exist ouni.i del ouni.i
goto n
:couldnotconnect
echo [%DATE%]-[%TIME%]-[ERROR] - No connection to target mechine after 5 tries.Error var=couldnotconnect>>log.txt
echo ********************************
echo Could not connect after 5 tries.
echo ********************************
if exist upkg.i del upkg.i
if exist ipve.i del ipve.i
if exist ipbc.i del ipbc.i
if exist she.i del she.i
if exist tdir.i del tdir.i
if exist off.i del off.i
if exist gmem.i del gmem.i
if exist ouni.i del ouni.i
goto n
:errornoimbfilepkg
echo [%DATE%]-[%TIME%]-[ERROR] - No IMB.zip file was found.Error var=errornoimbfilepkg>>log.txt
echo ***************************
echo cannot find IMB.zip
echo ***************************
goto n
:errornoimbfile
cls
echo cannot find IMB.zip
echo If you have a custom-named package type
echo "custom" in the menu for [Y/N]
echo press any key to go to menu
pause>nul
goto unpack
:errornodefinevar
echo [%DATE%]-[%TIME%]-[ERROR] - Reached the end of syntax no further connection.Error var=errornodefinevar>>log.txt
echo ************************************************
echo Fatal error trying to run command 0x003
echo Reached the end of syntax no further connection!
echo ************************************************
if exist upkg.i del upkg.i
if exist ipve.i del ipve.i
if exist ipbc.i del ipbc.i
if exist she.i del she.i
if exist tdir.i del tdir.i
if exist off.i del off.i
if exist gmem.i del gmem.i
if exist ouni.i del ouni.i
goto n
:errrofrt
cls
echo [%DATE%]-[%TIME%]-[ERROR]-[FTP] - Incomplete ftp infomation /deleted/.Error var=errrofrt>>log.txt
echo ************************************************
echo Error cannot find full ftp infomation!
echo Incomplete ftp infomation please configure again.
echo Now using default ftp run the [setftp] command
echo again.. press any key to exit.
echo ************************************************
pause>nul
del ftpusr.ftp
del ftphst.ftp
del ftppas.ftp
exit
:error
echo [%DATE%]-[%TIME%]-[ERROR] - Access denied to program files.Error var=error>>log.txt
cls
echo ***************************************************
echo cannot launch program 0x22
echo Permissions to system files is denied (ACCT DENIED)
echo press any key to exit!
echo ***************************************************
pause>nul
exit
:warningftp
echo.
echo ------------------------------------------
echo WARNING!
echo Using default ftp change it to pervent errors
echo and hangups between protocalls! type [setftp]
echo ------------------------------------------
del ftp.xtv
if exist delftp.ftp goto delftpsuccess
goto n
::#################ERRORS##############################