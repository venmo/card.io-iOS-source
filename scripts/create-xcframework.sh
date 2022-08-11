#!/bin/bash

archive() {
    sdk=$1

    xcodebuild archive \
        -project icc.xcodeproj \
        -scheme CardIO \
        -archivePath CardIO-${sdk} \
        -sdk ${sdk} \
        -quiet \
        SKIP_INSTALL=NO
}

xcframework() {
    xcodebuild -create-xcframework \
        -archive CardIO-iphoneos.xcarchive \
        -framework CardIO.framework \
        -archive CardIO-iphonesimulator.xcarchive \
        -framework CardIO.framework \
        -output CardIO.xcframework
}

echo "Archiving for iOS…"
archive iphoneos

echo "Archiving for iOS Simulator…"
archive iphonesimulator

echo "Creating XCFramework…"
xcframework
