ECHO OFF

REM コマンドがあるかチェック

SET CMDNAME=curl
curl --version
IF not %errorlevel%==0 goto ERROR

SET CMDNAME=unzip
unzip -h
IF not %errorlevel%==0 goto ERROR

SET CMDNAME=lha
lha --version
IF not %errorlevel%==0 goto ERROR

SET CMDNAME=tartool
tartool
IF not %errorlevel%==0 goto ERROR

SET TOOLPATH=%~dp0tools\
mkdir tools

mkdir temp68dev
cd temp68dev

REM NDCをダウンロード
curl https://euee.web.fc2.com/tool/NDC0A07.LZH -fsLO
lha xf NDC0A07.LZH
copy NDC.exe %TOOLPATH%

REM Human68k 3.02をダウンロード
curl http://www.retropc.net/x68000/software/sharp/human302/HUMN302I.LZH -fsLO
lha xf HUMN302I.LZH

REM HUMAN302の中から開発環境に不必要なものを削除
%TOOLPATH%ndc D human302.xdf 0 CONFIG.SYS
%TOOLPATH%ndc D human302.xdf 0 AUTOEXEC.BAT

REM BINフォルダ
%TOOLPATH%ndc D human302.xdf 0 BIN\ED.HLP
%TOOLPATH%ndc D human302.xdf 0 BIN\ATTRIB.X
%TOOLPATH%ndc D human302.xdf 0 BIN\BACKUP.X
%TOOLPATH%ndc D human302.xdf 0 BIN\BIND.X
%TOOLPATH%ndc D human302.xdf 0 BIN\CACHE.X
%TOOLPATH%ndc D human302.xdf 0 BIN\CHKDSK.X
%TOOLPATH%ndc D human302.xdf 0 BIN\COPY2.X
%TOOLPATH%ndc D human302.xdf 0 BIN\COPYALL.X
%TOOLPATH%ndc D human302.xdf 0 BIN\DISKCOPY.X
%TOOLPATH%ndc D human302.xdf 0 BIN\ED.X
%TOOLPATH%ndc D human302.xdf 0 BIN\FC.X
%TOOLPATH%ndc D human302.xdf 0 BIN\FIND.X
REM %TOOLPATH%ndc D human302.xdf 0 BIN\FORMAT.X
%TOOLPATH%ndc D human302.xdf 0 BIN\HDID.X
REM %TOOLPATH%ndc D human302.xdf 0 BIN\KEY.X
%TOOLPATH%ndc D human302.xdf 0 BIN\MORE.X
%TOOLPATH%ndc D human302.xdf 0 BIN\MOVE.X
%TOOLPATH%ndc D human302.xdf 0 BIN\PR.X
%TOOLPATH%ndc D human302.xdf 0 BIN\PROCESS.X
%TOOLPATH%ndc D human302.xdf 0 BIN\RECOVER.X
%TOOLPATH%ndc D human302.xdf 0 BIN\RESTORE.X
%TOOLPATH%ndc D human302.xdf 0 BIN\SORT.X
%TOOLPATH%ndc D human302.xdf 0 BIN\SPEED.X
REM %TOOLPATH%ndc D human302.xdf 0 BIN\SUBST.X
%TOOLPATH%ndc D human302.xdf 0 BIN\SYS.X
%TOOLPATH%ndc D human302.xdf 0 BIN\TIMER.X
%TOOLPATH%ndc D human302.xdf 0 BIN\TREE.X
%TOOLPATH%ndc D human302.xdf 0 BIN\USKCGM.X
REM %TOOLPATH%ndc D human302.xdf 0 BIN\WHERE.X

REM SYSフォルダ
REM %TOOLPATH%ndc D human302.xdf 0 SYS\ASK68K.SYS
%TOOLPATH%ndc D human302.xdf 0 SYS\PRNDRV.SYS
%TOOLPATH%ndc D human302.xdf 0 SYS\PRNDRV1.SYS
%TOOLPATH%ndc D human302.xdf 0 SYS\PRNDRV2.SYS
%TOOLPATH%ndc D human302.xdf 0 SYS\PRNDRV3.SYS
%TOOLPATH%ndc D human302.xdf 0 SYS\RAMDISK.SYS
REM %TOOLPATH%ndc D human302.xdf 0 SYS\RSDRV.SYS
REM %TOOLPATH%ndc D human302.xdf 0 SYS\SRAMDISK.SYS
REM %TOOLPATH%ndc D human302.xdf 0 SYS\CONFIGED.X
REM %TOOLPATH%ndc D human302.xdf 0 SYS\FASTIO.X
REM %TOOLPATH%ndc D human302.xdf 0 SYS\FASTOPEN.X
REM %TOOLPATH%ndc D human302.xdf 0 SYS\FASTSEEK.X
REM %TOOLPATH%ndc D human302.xdf 0 SYS\FDDEVICE.X
%TOOLPATH%ndc D human302.xdf 0 SYS\FLOAT2.X
%TOOLPATH%ndc D human302.xdf 0 SYS\FLOAT3.X
%TOOLPATH%ndc D human302.xdf 0 SYS\FLOAT4.X
%TOOLPATH%ndc D human302.xdf 0 SYS\IOCS.X

REM ETCフォルダ
REM %TOOLPATH%ndc D human302.xdf 0 ETC\DEFSPTOOL.BAS
%TOOLPATH%ndc D human302.xdf 0 ETC\INSTALL.BAT
%TOOLPATH%ndc D human302.xdf 0 ETC\AUTOEXEC.HD
%TOOLPATH%ndc D human302.xdf 0 ETC\CONFIG.HD
REM %TOOLPATH%ndc D human302.xdf 0 ETC\DEFSPTOOL.HLP

REM HISフォルダ
REM %TOOLPATH%ndc D human302.xdf 0 HIS\HISTORY.HIS
REM %TOOLPATH%ndc D human302.xdf 0 HIS\HISTORY.HLP
REM %TOOLPATH%ndc D human302.xdf 0 HIS\KEY.HIS

REM AUTOEXEC.BATとCONFIG.SYSを差し替える
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\AUTOEXEC.BAT \
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\CONFIG.SYS \

REM ETCにファイルを追加
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\ETC\passwd \ETC
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\ETC\startup.env \ETC

REM homeフォルダを作る
%TOOLPATH%ndc PD human302.xdf 0 \home
%TOOLPATH%ndc PD human302.xdf 0 root \home
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\home\root\%%login \home\root
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\home\root\%%fishrc \home\root

REM usr/bin usr/sys フォルダを作る
%TOOLPATH%ndc PD human302.xdf 0 \usr
%TOOLPATH%ndc PD human302.xdf 0 bin \usr
%TOOLPATH%ndc PD human302.xdf 0 sys \usr

REM forever、loginを/usr/binに格納
curl http://www.retropc.net/x68000/software/tools/itatoolbox/login/login06.lzh -fsLO
lha xf login06.lzh
%TOOLPATH%ndc P human302.xdf 0 forever.x \usr\bin
%TOOLPATH%ndc P human302.xdf 0 login.x \usr\bin

REM fishを/usr/binに格納
mkdir fish
cd fish
curl http://www.retropc.net/x68000/software/tools/itatoolbox/fish/fish080.lzh -fsLO
lha xf fish080.lzh
cd ..
%TOOLPATH%ndc P human302.xdf 0 fish\fish.x \usr\bin
del fish\* /q
attrib -R fish\contrib
del fish\contrib\* /q
rmdir fish\contrib
rmdir fish

REM HIOCSを取得、格納
curl http://www.retropc.net/x68000/software/system/iocs/hiocs/hiocs16.lzh -fsLO
lha xf hiocs16.lzh
%TOOLPATH%ndc PA human302.xdf 0 hiocs.x \SYS

REM KRAMDRVを取得、格納
curl http://www.retropc.net/x68000/software/disk/ramdisk/kramd/KRAMD101.LZH -fsLO
lha  xf KRAMD101.LZH
%TOOLPATH%ndc PA human302.xdf 0 KRAMD.SYS \SYS

REM CONDRVを取得、格納
curl http://www.retropc.net/x68000/software/system/console/condrveririn/COND_E12.ZIP -fsLO
unzip COND_E12.ZIP condrv.sys
%TOOLPATH%ndc PA human302.xdf 0 condrv.sys \SYS

REM FLOAT2Pを取得
curl http://www.retropc.net/x68000/software/system/float/float2p/FLT23_20.LZH -fsLO
lha xf FLT23_20.LZH
%TOOLPATH%ndc PA human302.xdf 0 float2p.x \SYS

REM VTwentyOneを取得、格納
curl http://www.retropc.net/x68000/software/disk/filename/twentyone/tw136c14.lzh -fsLO
lha xf tw136c14.lzh
REM 長いファイル名を格納出来ないようなのでリネームして格納
ren TW136C14\VTwentyOne.x V21.x
%TOOLPATH%ndc PA human302.xdf 0 TW136C14/V21.x \usr\bin

REM lndrvを取得、格納
curl http://www.retropc.net/x68000/software/disk/symlink/lndrv/LNDRV126.LZH -fsLO
lha xf LNDRV126.LZH
%TOOLPATH%ndc PA human302.xdf 0 lndrv.x \usr\sys

REM lnを入れる
curl http://retropc.net/x68000/software/disk/symlink/ln/LN.LZH -fsLO
lha xf LN.LZH
%TOOLPATH%ndc PA human302.xdf 0 ln.x \usr\bin

REM lxを取得、格納
curl http://www.retropc.net/x68000/software/tools/archiver/lx/LXR120FS.LZH -fsLO
lha xf LXR120FS.LZH
%TOOLPATH%ndc PA human302.xdf 0 lx.r \usr\bin

REM エディタ(EDR-plus)を取得、格納
curl http://retropc.net/x68000/software/texteditor/ed/edrplus/EDRPV200.ZIP -fsLO
unzip EDRPV200.ZIP
%TOOLPATH%ndc PA human302.xdf 0 EDR-plus-V2\bin\ed.r \usr\bin

REM ls、cp、mv、rm、rmdir、cat、chmod、passwd、mkdirを入れる
curl http://retropc.net/x68000/software/tools/itatoolbox/ls/ls15.lzh -fsLO
lha xf ls15.lzh
%TOOLPATH%ndc PA human302.xdf 0 ls.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/cp/cp28.lzh -fsLO
lha xf cp28.lzh
%TOOLPATH%ndc PA human302.xdf 0 cp.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/mv/mv19.lzh -fsLO
lha xf mv19.lzh
%TOOLPATH%ndc PA human302.xdf 0 mv.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/rm/rm14.lzh -fsLO
lha xf rm14.lzh
%TOOLPATH%ndc PA human302.xdf 0 rm.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/rmdir/rmdir14.lzh -fsLO
lha xf rmdir14.lzh
%TOOLPATH%ndc PA human302.xdf 0 rmdir.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/cat/cat15.lzh -fsLO
lha xf cat15.lzh
%TOOLPATH%ndc PA human302.xdf 0 cat.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/chmod/chmod14.lzh -fsLO
lha xf chmod14.lzh
%TOOLPATH%ndc PA human302.xdf 0 chmod.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/passwd/passwd03.lzh -fsLO
lha xf passwd03.lzh
ren passwd.att passwd.x
%TOOLPATH%ndc PA human302.xdf 0 passwd.x \usr\bin
curl http://retropc.net/x68000/software/tools/itatoolbox/mkdir/mkdir14.lzh -fsLO
lha xf mkdir14.lzh
%TOOLPATH%ndc PA human302.xdf 0 mkdir.x \usr\bin


REM -------------------------------------------------
REM dev02.xdfに開発環境を整える

REM dev02.xdfをブランクで初期化
copy ..\blank.xdf dev02.xdf

REM まずはdevフォルダに整える
mkdir dev
mkdir dev\usr
mkdir dev\usr\bin
mkdir dev\tmp

REM GCC（真里子版）を取得、格納
curl http://retropc.net/x68000/software/develop/c/gcc_mariko/GCC142.LZH -fsLO
lha xf GCC142.LZH
copy gcc.x dev\usr\bin
copy gcc_cc1.x dev\usr\bin
copy gcc_cpp.x dev\usr\bin

REM HASを取得、格納
curl http://retropc.net/x68000/software/develop/as/has060/HAS06089.LZH -fsLO
lha xf HAS06089.LZH
copy HAS060.X dev\usr\bin

REM HLK evolutionを取得、格納
curl http://retropc.net/x68000/software/develop/lk/hlkev/hlkev15.zip -fsLO
unzip hlkev15.zip hlk.r
copy hlk.r dev\usr\bin

REM libcを取得、格納
curl http://retropc.net/x68000/software/develop/lib/libc1132a/libc32b.tgz -fsLO
move libc32b.tgz dev\usr\libc32b.tgz
cd dev\usr
tartool libc32b.tgz
DEL libc32b.tgz
cd ..
cd ..

REM makeを取得、格納
curl http://www.retropc.net/x68000/software/develop/make/gmake362/MAKEX15F.ZIP -fsLO
unzip MAKEX15F.ZIP make.x
copy make.x dev\usr\bin

REM TODO コンパイラ以外の各種ツールもここで入れておきたい(グラフィックツールやサウンドドライバなども……)

REM devset.lzhを作り、dev02.xdfに格納
cd dev
lha a devset.lzh *
cd ..
%TOOLPATH%ndc PA dev02.xdf 0 dev\devset.lzh

REM ディスクイメージのみ移動させ他のものは削除
move human302.xdf ..\dev01.xdf
move dev02.xdf ..\dev02.xdf

cd ..

REM 作業フォルダを丸ごと削除
rmdir /S /Q temp68dev

EXIT /B

:ERROR
ECHO             _________________
ECHO --------------------------------------------
ECHO Error! %CMDNAME%がインストールされていません
ECHO 
PAUSE
