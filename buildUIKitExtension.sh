#!/bin/bash

set -eo pipefail

xcodebuild -workspace . \
    -scheme UIKitExtension \
    -destination platform='iOS Simulator',OS=14.4,name='iPhone 12' \
    build
