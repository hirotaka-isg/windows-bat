@echo off
rem IP設定
rem 管理者で実行

echo 10
echo 20
echo 30

echo 拠点を半角数字で入力してください
set /p location=

IF %location%==10 goto 10
IF %location%==20 goto 20
IF %location% goto 30

rem 設定情報

:10
echo パターン１
set interface_name="Wi-Fi"
set ip_address=192.168.0.10
set subnet_mask=255.255.255.0
set default_gateway=192.168.0.1

rem DNSサーバー情報
set dns_server1=192.168.0.250
set dns_server2=192.168.0.251

echo interface_name="Wi-Fi"
echo ip_address=192.168.0.10
echo subnet_mask=255.255.255.0
echo default_gateway=192.168.0.1
echo dns_server1=192.168.0.250
echo dns_server2=192.168.0.251

rem netsh interface ip set address "(アダプタ名)" static (IPアドレス) (ネットマスク) (デフォルトゲートウェイ)
netsh interface ip set address %interface_name% static %ip_address% %subnet_mask% %default_gateway%

rem DNSサーバの設定
netsh interface ipv4 set dns name="%interface_name%" source=static addr="%dns_server1%" register=non validate=no
netsh interface ipv4 add dns name="%interface_name%" addr="%dns_server2%" index=2 validate=no
pause
goto :EOF

:20
echo パターン２DHCP
set interface_name="Wi-Fi"
rem IP アドレスを DHCP に設定する
netsh interface ipv4 set address name=%interface_name% source=dhcp
rem DNS サーバーの設定を DHCP に設定します。
netsh interface ipv4 set dnsservers name=%interface_name% source=dhcp
pause
goto :EOF

echo 終了
