#!/bin/sh

pluginkit -r "/Applications/FxPlugHangingTestWrapper.app/Contents/PlugIns/"

rm -rf "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper.app"
rm -rf "/Applications/FxPlugHangingTestWrapper.app"
rm -rf "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper"
rm -rf "/Library/Application Support/FxPlugHangingTest/Data/FxPlugHangingTestWrapper.app"
rm -rf "/Library/Application Support/Final Cut Pro/Templates.localized/Effects.localized/Test/FxPlug Hanging/FxPlug Hanging"
