#!/bin/sh

rm -rf "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper.app"
unzip "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper" -d "/Library/Application Support/FxPlugHangingTest/Data"
rm -rf "/Applications/FxPlugHangingTestWrapper.app"
mv "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper.app" "/Applications"
rm -rf "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper"
rm -rf "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper.app"

rm -rf "/Library/Application Support/Final Cut Pro/Templates.localized/Effects.localized/Test/FxPlug Hanging/FxPlug Hanging"
cp -R "/Applications/FxPlugHangingTestWrapper.app/Contents/Resources/FxPlug Hanging" "/Library/Application Support/Final Cut Pro/Templates.localized/Effects.localized/Test/FxPlug Hanging/"

open -j "/Applications/FxPlugHangingTestWrapper.app"

pluginkit -rav "/Applications/FxPlugHangingTestWrapper.app/Contents/PlugIns/FxPlugHangingTestFxPlug.pluginkit"
export path=`pluginkit -avmD |grep "com.dehancer.film.fxplug.hanging.test"| awk '{print $6}'` && pluginkit -rav $path --raw && pluginkit -av $path && pluginkit -e use -i "com.dehancer.film.fxplug.hanging.test" --raw && echo $path

pluginkit -avDm|grep dehancer
