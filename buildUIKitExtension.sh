#!/bin/bash

set -eo pipefail

xcodebuild -workspace . \
    -scheme UIKitExtension \
    -destination platform='iOS Simulator',OS=15.0,name='iPhone 13' \
    build
