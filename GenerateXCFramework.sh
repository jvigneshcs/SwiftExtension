#!/bin/sh
# References:
# https://medium.com/swlh/how-to-build-xcframework-with-xcode-b3d0b3c08f43
# https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script
# https://stackoverflow.com/a/31164417/618994
#
# Pass scheme name as -s argument to the script,
# supported platforms with colon ; separated as -p argument to the script
# Supported Platforms:
# macOS,
# iOS, iOS Simulator,
# watchOS, watchOS Simulator
# tvOS, tvOS Simulator
while getopts p:s: flag
do
    case "${flag}" in
        p) platforms=${OPTARG};;
        s) NAME=${OPTARG};;
    esac
done

if [ -z $NAME ]; then
    echo "Pass scheme name as -s argument to the script"
    exit 1
elif [ ! "$platforms" ]; then
    echo  "Pass supported platforms with colon ; separated as -p argument to the script"
    exit 1
fi

IFS=';' read -ra SUPPORTED_PLATFORMS <<< "$platforms"


BUILD_FOLDER="build/$NAME"
FRAMEWORK_RELATIVE_PATH="Products/Library/Frameworks/$NAME.framework"
FRAMEWORKS=""

# Build the scheme for all platforms that we plan to support
for PLATFORM in "${SUPPORTED_PLATFORMS[@]}"; do


    case $PLATFORM in
    "macOS")
    SDK="macosx"
    ;;
    "iOS")
    SDK="iphoneos"
    ;;
    "iOS Simulator")
    SDK="iphonesimulator"
    ;;
    "watchOS")
    SDK="watchos"
    ;;
    "watchOS Simulator")
    SDK="watchsimulator"
    ;;
    "tvOS")
    SDK="appletvos"
    ;;
    "tvOS Simulator")
    SDK="appletvsimulator"
    ;;
    esac

    ARCHIVE_PATH="$BUILD_FOLDER/Release-$SDK"

    xcodebuild archive \
            -project "SwiftExtension.xcodeproj" \
            -scheme $NAME \
            ONLY_ACTIVE_ARCH=NO \
            -destination "generic/platform=$PLATFORM" \
            -derivedDataPath ".build" \
            -archivePath $ARCHIVE_PATH \
            -sdk $SDK \
            SKIP_INSTALL=NO \
            BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
            
    FRAMEWORK_PATH="$ARCHIVE_PATH.xcarchive/$FRAMEWORK_RELATIVE_PATH"
    FRAMEWORK_LIB_PATH="$FRAMEWORK_PATH/$NAME"
            
    if [ -f "$FRAMEWORK_LIB_PATH" ]; then
        lipo -info "$FRAMEWORK_LIB_PATH"
    fi
    
    FRAMEWORKS+=" -framework $FRAMEWORK_PATH"

done

OUTPUT=$BUILD_FOLDER/$NAME.xcframework

rm -rf $OUTPUT

xcodebuild -create-xcframework \
    $FRAMEWORKS \
    -output $OUTPUT
