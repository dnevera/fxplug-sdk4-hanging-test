#!/bin/sh


/bin/mkdir -p "/Library/Application Support/Final Cut Pro/Templates.localized/Effects.localized/Test/FxPlug Hanging"
pluginkit -r `pluginkit -avmD |grep "com.dehancer.film.fxplug.hanging.test"| awk '{print $6}'`
pluginkit -r "/Applications/FxPlugHangingTestWrapper.app/Contents/PlugIns/"
rm -rf "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper.app"
rm -rf "/Applications/FxPlugHangingTestWrapper.app"
