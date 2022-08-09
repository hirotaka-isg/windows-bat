@echo off
rem ========================================================
rem 目的：拠点に合わせてネットワークの設定を切り替える
rem 作成日：2022/07/30
rem 管理者で実行して下さい
rem +で囲われた範囲は自身の環境に合わせて設定して下さい
rem ========================================================

rem +++++++++++++++++++++++++++++++++++++++++++++++
rem 拠点１の設定
set location01_interface_name="Wi-Fi"
set location01_ip=XXX.XXX.XXX.XXX
set location01_subnet=XXX.XXX.XXX.XXX
set location01_default_gateway=XXX.XXX.XXX.XXX
set location01_dns_server1=XXX.XXX.XXX.XXX
set location01_dns_server2=XXX.XXX.XXX.XXX

rem 拠点２の設定
set location02_interface_name="Wi-Fi"
set location02_ip=XXX.XXX.XXX.XXX
set location02_subnet=XXX.XXX.XXX.XXX
set location02_default_gateway=XXX.XXX.XXX.XXX
set location02_dns_server1=XXX.XXX.XXX.XXX
set location02_dns_server2=XXX.XXX.XXX.XXX

rem 拠点３の設定  ※DHCPなので、インターフェース名のみ
set location03_interface_name="Wi-Fi"
rem +++++++++++++++++++++++++++++++++++++++++++++++

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
rem IPの設定
netsh interface ip set address %location01_interface_name% static %location01_ip% %location01_subnet% %location01_default_gateway%

rem DNSサーバの設定
netsh interface ipv4 set dns name="%location01_interface_name%" source=static addr="%location01_dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%location01_interface_name%" addr="%location02_dns_server2%" index=2 validate=no
ipconfig

pause
goto :EOF

:location_20
echo 拠点２
　
netsh interface ip set address %location02_interface_name% static %location02_ip% %location02_subnet% %location02_default_gateway%

rem DNSサーバの設定
netsh interface ipv4 set dns name="%location02_interface_name%" source=static addr="%location02_dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%location02_interface_name%" addr="%location02_dns_server2%" index=2 validate=no

rem 設定後の確認
ipconfig

pause
goto :EOF

:location_30
echo 拠点３（DHCP）

rem DHCPに設定
netsh interface ipv4 set address name=%location03_interface_name% source=dhcp
netsh interface ipv4 set dnsservers name=%location03_interface_name% source=dhcp

rem 設定後の確認
ipconfig

pause
goto :EOF
