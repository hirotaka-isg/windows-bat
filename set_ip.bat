@echo off
rem IP�ݒ�
rem �Ǘ��҂Ŏ��s

echo 10
echo 20
echo 30

echo ���_�𔼊p�����œ��͂��Ă�������
set /p location=

IF %location%==10 goto 10
IF %location%==20 goto 20
IF %location% goto 30

rem �ݒ���

:10
echo �p�^�[���P
set interface_name="Wi-Fi"
set ip_address=192.168.0.10
set subnet_mask=255.255.255.0
set default_gateway=192.168.0.1

rem DNS�T�[�o�[���
set dns_server1=192.168.0.250
set dns_server2=192.168.0.251

echo interface_name="Wi-Fi"
echo ip_address=192.168.0.10
echo subnet_mask=255.255.255.0
echo default_gateway=192.168.0.1
echo dns_server1=192.168.0.250
echo dns_server2=192.168.0.251

rem netsh interface ip set address "(�A�_�v�^��)" static (IP�A�h���X) (�l�b�g�}�X�N) (�f�t�H���g�Q�[�g�E�F�C)
netsh interface ip set address %interface_name% static %ip_address% %subnet_mask% %default_gateway%

rem DNS�T�[�o�̐ݒ�
netsh interface ipv4 set dns name="%interface_name%" source=static addr="%dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%interface_name%" addr="%dns_server2%" index=2 validate=no
pause
goto :EOF

:20
echo �p�^�[���QDHCP
set interface_name="Wi-Fi"
rem IP �A�h���X�� DHCP �ɐݒ肷��
netsh interface ipv4 set address name=%interface_name% source=dhcp
rem DNS �T�[�o�[�̐ݒ�� DHCP �ɐݒ肵�܂��B
netsh interface ipv4 set dnsservers name=%interface_name% source=dhcp
pause
goto :EOF

echo �I��
