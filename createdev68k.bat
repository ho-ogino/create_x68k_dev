ECHO OFF

REM �R�}���h�����邩�`�F�b�N

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

REM NDC���_�E�����[�h
curl https://euee.web.fc2.com/tool/NDC0A07.LZH -fsLO
lha xf NDC0A07.LZH
copy NDC.exe %TOOLPATH%

REM Human68k 3.02���_�E�����[�h
curl http://www.retropc.net/x68000/software/sharp/human302/HUMN302I.LZH -fsLO
lha xf HUMN302I.LZH

REM HUMAN302�̒�����J�����ɕs�K�v�Ȃ��̂��폜
%TOOLPATH%ndc D human302.xdf 0 CONFIG.SYS
%TOOLPATH%ndc D human302.xdf 0 AUTOEXEC.BAT

REM BIN�t�H���_
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

REM SYS�t�H���_
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

REM ETC�t�H���_
REM %TOOLPATH%ndc D human302.xdf 0 ETC\DEFSPTOOL.BAS
%TOOLPATH%ndc D human302.xdf 0 ETC\INSTALL.BAT
%TOOLPATH%ndc D human302.xdf 0 ETC\AUTOEXEC.HD
%TOOLPATH%ndc D human302.xdf 0 ETC\CONFIG.HD
REM %TOOLPATH%ndc D human302.xdf 0 ETC\DEFSPTOOL.HLP

REM HIS�t�H���_
REM %TOOLPATH%ndc D human302.xdf 0 HIS\HISTORY.HIS
REM %TOOLPATH%ndc D human302.xdf 0 HIS\HISTORY.HLP
REM %TOOLPATH%ndc D human302.xdf 0 HIS\KEY.HIS

REM AUTOEXEC.BAT��CONFIG.SYS�������ւ���
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\AUTOEXEC.BAT \
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\CONFIG.SYS \

REM ETC�Ƀt�@�C����ǉ�
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\ETC\passwd \ETC
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\ETC\startup.env \ETC

REM home�t�H���_�����
%TOOLPATH%ndc PD human302.xdf 0 \home
%TOOLPATH%ndc PD human302.xdf 0 root \home
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\home\root\%%login \home\root
%TOOLPATH%ndc P human302.xdf 0 ..\ENV\home\root\%%fishrc \home\root

REM usr/bin usr/sys �t�H���_�����
%TOOLPATH%ndc PD human302.xdf 0 \usr
%TOOLPATH%ndc PD human302.xdf 0 bin \usr
%TOOLPATH%ndc PD human302.xdf 0 sys \usr

REM forever�Alogin��/usr/bin�Ɋi�[
curl http://www.retropc.net/x68000/software/tools/itatoolbox/login/login06.lzh -fsLO
lha xf login06.lzh
%TOOLPATH%ndc P human302.xdf 0 forever.x \usr\bin
%TOOLPATH%ndc P human302.xdf 0 login.x \usr\bin

REM fish��/usr/bin�Ɋi�[
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

REM HIOCS���擾�A�i�[
curl http://www.retropc.net/x68000/software/system/iocs/hiocs/hiocs16.lzh -fsLO
lha xf hiocs16.lzh
%TOOLPATH%ndc PA human302.xdf 0 hiocs.x \SYS

REM KRAMDRV���擾�A�i�[
curl http://www.retropc.net/x68000/software/disk/ramdisk/kramd/KRAMD101.LZH -fsLO
lha  xf KRAMD101.LZH
%TOOLPATH%ndc PA human302.xdf 0 KRAMD.SYS \SYS

REM CONDRV���擾�A�i�[
curl http://www.retropc.net/x68000/software/system/console/condrveririn/COND_E12.ZIP -fsLO
unzip COND_E12.ZIP condrv.sys
%TOOLPATH%ndc PA human302.xdf 0 condrv.sys \SYS

REM FLOAT2P���擾
curl http://www.retropc.net/x68000/software/system/float/float2p/FLT23_20.LZH -fsLO
lha xf FLT23_20.LZH
%TOOLPATH%ndc PA human302.xdf 0 float2p.x \SYS

REM VTwentyOne���擾�A�i�[
curl http://www.retropc.net/x68000/software/disk/filename/twentyone/tw136c14.lzh -fsLO
lha xf tw136c14.lzh
REM �����t�@�C�������i�[�o���Ȃ��悤�Ȃ̂Ń��l�[�����Ċi�[
ren TW136C14\VTwentyOne.x V21.x
%TOOLPATH%ndc PA human302.xdf 0 TW136C14/V21.x \usr\bin

REM lndrv���擾�A�i�[
curl http://www.retropc.net/x68000/software/disk/symlink/lndrv/LNDRV126.LZH -fsLO
lha xf LNDRV126.LZH
%TOOLPATH%ndc PA human302.xdf 0 lndrv.x \usr\sys

REM ln������
curl http://retropc.net/x68000/software/disk/symlink/ln/LN.LZH -fsLO
lha xf LN.LZH
%TOOLPATH%ndc PA human302.xdf 0 ln.x \usr\bin

REM lx���擾�A�i�[
curl http://www.retropc.net/x68000/software/tools/archiver/lx/LXR120FS.LZH -fsLO
lha xf LXR120FS.LZH
%TOOLPATH%ndc PA human302.xdf 0 lx.r \usr\bin

REM �G�f�B�^(EDR-plus)���擾�A�i�[
curl http://retropc.net/x68000/software/texteditor/ed/edrplus/EDRPV200.ZIP -fsLO
unzip EDRPV200.ZIP
%TOOLPATH%ndc PA human302.xdf 0 EDR-plus-V2\bin\ed.r \usr\bin

REM ls�Acp�Amv�Arm�Armdir�Acat�Achmod�Apasswd�Amkdir������
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
REM dev02.xdf�ɊJ�����𐮂���

REM dev02.xdf���u�����N�ŏ�����
copy ..\blank.xdf dev02.xdf

REM �܂���dev�t�H���_�ɐ�����
mkdir dev
mkdir dev\usr
mkdir dev\usr\bin
mkdir dev\tmp

REM GCC�i�^���q�Łj���擾�A�i�[
curl http://retropc.net/x68000/software/develop/c/gcc_mariko/GCC142.LZH -fsLO
lha xf GCC142.LZH
copy gcc.x dev\usr\bin
copy gcc_cc1.x dev\usr\bin
copy gcc_cpp.x dev\usr\bin

REM HAS���擾�A�i�[
curl http://retropc.net/x68000/software/develop/as/has060/HAS06089.LZH -fsLO
lha xf HAS06089.LZH
copy HAS060.X dev\usr\bin

REM HLK evolution���擾�A�i�[
curl http://retropc.net/x68000/software/develop/lk/hlkev/hlkev15.zip -fsLO
unzip hlkev15.zip hlk.r
copy hlk.r dev\usr\bin

REM libc���擾�A�i�[
curl http://retropc.net/x68000/software/develop/lib/libc1132a/libc32b.tgz -fsLO
move libc32b.tgz dev\usr\libc32b.tgz
cd dev\usr
tartool libc32b.tgz
DEL libc32b.tgz
cd ..
cd ..

REM make���擾�A�i�[
curl http://www.retropc.net/x68000/software/develop/make/gmake362/MAKEX15F.ZIP -fsLO
unzip MAKEX15F.ZIP make.x
copy make.x dev\usr\bin

REM TODO �R���p�C���ȊO�̊e��c�[���������œ���Ă�������(�O���t�B�b�N�c�[����T�E���h�h���C�o�Ȃǂ��c�c)

REM devset.lzh�����Adev02.xdf�Ɋi�[
cd dev
lha a devset.lzh *
cd ..
%TOOLPATH%ndc PA dev02.xdf 0 dev\devset.lzh

REM �f�B�X�N�C���[�W�݈̂ړ��������̂��͍̂폜
move human302.xdf ..\dev01.xdf
move dev02.xdf ..\dev02.xdf

cd ..

REM ��ƃt�H���_���ۂ��ƍ폜
rmdir /S /Q temp68dev

EXIT /B

:ERROR
ECHO             _________________
ECHO --------------------------------------------
ECHO Error! %CMDNAME%���C���X�g�[������Ă��܂���
ECHO 
PAUSE
