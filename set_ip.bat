@echo off

rem �ړI�F���_�ɍ��킹�ăl�b�g���[�N�̐ݒ��؂�ւ���
rem �쐬���F2022/07/30
rem �Ǘ��҂Ŏ��s���ĉ�����

echo 10�F���_���P
echo 20�F���_���Q
echo 30�F���_���R
echo ��L���狒�_�𔼊p�����œ��͂��Ă�������
set /p location=

rem �e���P�[�V�����ɍ��킹�ĕ���
IF %location%==10 goto location_10
IF %location%==20 goto location_20
IF %location%==30 goto location_30

:location_10
echo ���_�P
echo �ݒ���
set interface_name="Wi-Fi"
set ip_address=XXX.XXX.XXX.XXX
set subnet_mask=XXX.XXX.XXX.XXX
set default_gateway=XXX.XXX.XXX.XXX

rem DNS�T�[�o�[���
set dns_server1=XXX.XXX.XXX.XXX
set dns_server2=XXX.XXX.XXX.XXX

echo interface_name="Wi-Fi"
echo ip_address=XXX.XXX.XXX.XXX
echo subnet_mask=XXX.XXX.XXX.XXX
echo default_gateway=XXX.XXX.XXX.XXX
echo dns_server1=XXX.XXX.XXX.XXX
echo dns_server2=XXX.XXX.XXX.XXX

netsh interface ip set address %interface_name% static %ip_address% %subnet_mask% %default_gateway%

rem DNS�T�[�o�̐ݒ�
netsh interface ipv4 set dns name="%interface_name%" source=static addr="%dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%interface_name%" addr="%dns_server2%" index=2 validate=no
pause
goto :EOF

:location_20
echo ���_�Q
echo �ݒ���
set interface_name="Wi-Fi"
set ip_address=XXX.XXX.XXX.XXX
set subnet_mask=XXX.XXX.XXX.XXX
set default_gateway=XXX.XXX.XXX.XXX

rem DNS�T�[�o�[���
set dns_server1=XXX.XXX.XXX.XXX
set dns_server2=XXX.XXX.XXX.XXX

echo interface_name="Wi-Fi"
echo ip_address=XXX.XXX.XXX.XXX
echo subnet_mask=XXX.XXX.XXX.XXX
echo default_gateway=XXX.XXX.XXX.XXX
echo dns_server1=XXX.XXX.XXX.XXX
echo dns_server2=XXX.XXX.XXX.XXX

netsh interface ip set address %interface_name% static %ip_address% %subnet_mask% %default_gateway%

rem DNS�T�[�o�̐ݒ�
netsh interface ipv4 set dns name="%interface_name%" source=static addr="%dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%interface_name%" addr="%dns_server2%" index=2 validate=no

pause
goto :EOF

:location_30
echo ���_�R�iDHCP�j
set interface_name="Wi-Fi"
rem DHCP�ɐݒ�
netsh interface ipv4 set address name=%interface_name% source=dhcp
netsh interface ipv4 set dnsservers name=%interface_name% source=dhcp
pause
goto :EOF

