#!/bin/sh

# Quick hack to generate IPMI EEPROM images

BaseNumber=1
EndNumber=36

SerialNumber=$BaseNumber
while true
do
    SerialNumberString=`printf "%03d" $SerialNumber`
    frugy -w \
          -s "serial_number=$SerialNumberString" \
          -o "EEPROM_$SerialNumberString".bin \
          QuartzEEPROM.yml
    if [ "$SerialNumber" -ge "$EndNumber" ]
    then
        break
    fi
    ((SerialNumber=$SerialNumber+1))
done
