#!/bin/sh
#
#Alan Ferrari <alan.ferrari@supsi.ch>
#Inject method call information in a Android APK
#and it extract the classes characteristics
#
#LGLP License 
#Depens on dex2jar
######################################



APK="./demoapp/BatteryMonitor.apk"
DIR="./demoapp/"
rm classes.*
rm -r res/



./dex2jar/d2j-dex2jar.sh -o classes.jar $APK
java -jar transformer/CodeInjection.jar ./classes.jar
./dex2jar/d2j-jar2dex.sh -o classes.dex ./res/classes-mod.jar
jar uvf $APK ./classes.dex
./dex2jar/d2j-apk-sign.sh -f -o $APK-signed.apk $APK
echo "Done! use adb install to install the application";

