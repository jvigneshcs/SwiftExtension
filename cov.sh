#!/bin/sh
# References:
# https://blog.bitrise.io/code-coverage-for-swift-package-manager-based-apps
# https://stackoverflow.com/a/55993789/618994

or_not_found() {
  if type "$1" >/dev/null 2>&1; then # if given a valid command
    "$@"                             # run that command with original arguments
  else
    echo "$1 Command not found"  # write to stdout so it's captured by the command substitution
  fi
}

swift test --enable-code-coverage

BIN_PATH="$(swift build --show-bin-path)"
XCTEST_PATH="$(find ${BIN_PATH} -name '*.xctest')"

COV_BIN=$XCTEST_PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    f="$(basename $XCTEST_PATH .xctest)"
    COV_BIN="${COV_BIN}/Contents/MacOS/$f"
fi

or_not_found llvm-cov report \
    "${COV_BIN}" \
    -instr-profile=.build/debug/codecov/default.profdata \
    -ignore-filename-regex=".build|Tests" \
    -use-color
