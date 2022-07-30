@echo off

rem 目的：拠点に合わせてネットワークの設定を切り替える
rem 作成日：2022/07/30
rem 管理者で実行して下さい

echo 10：拠点名１
echo 20：拠点名２
echo 30：拠点名３
echo 上記から拠点を半角数字で入力してください
set /p location=

rem 各ロケーションに合わせて分岐
IF %location%==10 goto location_10
IF %location%==20 goto location_20
IF %location%==30 goto location_30

:location_10
echo 拠点１
echo 設定情報
set interface_name="Wi-Fi"
set ip_address=XXX.XXX.XXX.XXX
set subnet_mask=XXX.XXX.XXX.XXX
set default_gateway=XXX.XXX.XXX.XXX

rem DNSサーバー情報
set dns_server1=XXX.XXX.XXX.XXX
set dns_server2=XXX.XXX.XXX.XXX

echo interface_name="Wi-Fi"
echo ip_address=XXX.XXX.XXX.XXX
echo subnet_mask=XXX.XXX.XXX.XXX
echo default_gateway=XXX.XXX.XXX.XXX
echo dns_server1=XXX.XXX.XXX.XXX
echo dns_server2=XXX.XXX.XXX.XXX

netsh interface ip set address %interface_name% static %ip_address% %subnet_mask% %default_gateway%

rem DNSサーバの設定
netsh interface ipv4 set dns name="%interface_name%" source=static addr="%dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%interface_name%" addr="%dns_server2%" index=2 validate=no
pause
goto :EOF

:location_20
echo 拠点２
echo 設定情報
set interface_name="Wi-Fi"
set ip_address=XXX.XXX.XXX.XXX
set subnet_mask=XXX.XXX.XXX.XXX
set default_gateway=XXX.XXX.XXX.XXX

rem DNSサーバー情報
set dns_server1=XXX.XXX.XXX.XXX
set dns_server2=XXX.XXX.XXX.XXX

echo interface_name="Wi-Fi"
echo ip_address=XXX.XXX.XXX.XXX
echo subnet_mask=XXX.XXX.XXX.XXX
echo default_gateway=XXX.XXX.XXX.XXX
echo dns_server1=XXX.XXX.XXX.XXX
echo dns_server2=XXX.XXX.XXX.XXX

netsh interface ip set address %interface_name% static %ip_address% %subnet_mask% %default_gateway%

rem DNSサーバの設定
netsh interface ipv4 set dns name="%interface_name%" source=static addr="%dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%interface_name%" addr="%dns_server2%" index=2 validate=no

pause
goto :EOF

:location_30
echo 拠点３（DHCP）
set interface_name="Wi-Fi"
rem DHCPに設定
netsh interface ipv4 set address name=%interface_name% source=dhcp
netsh interface ipv4 set dnsservers name=%interface_name% source=dhcp
pause
goto :EOF

