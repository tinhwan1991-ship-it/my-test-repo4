#!/usr/bin/env bash
# Lightweight Gradle launcher that does not require gradle-wrapper.jar.
# It downloads the pinned Gradle distribution on first use.
set -euo pipefail
VERSION="8.9"
BASE="${GRADLE_USER_HOME:-$HOME/.gradle}/snowbound-gradle"
DIST="$BASE/gradle-$VERSION"
ZIP="$BASE/gradle-$VERSION-bin.zip"
if [ ! -x "$DIST/bin/gradle" ]; then
  mkdir -p "$BASE"
  if [ ! -f "$ZIP" ]; then
    URL="https://services.gradle.org/distributions/gradle-$VERSION-bin.zip"
    if command -v curl >/dev/null 2>&1; then curl -fL "$URL" -o "$ZIP";
    elif command -v wget >/dev/null 2>&1; then wget -O "$ZIP" "$URL";
    else echo "ต้องติดตั้ง curl หรือ wget เพื่อดาวน์โหลด Gradle" >&2; exit 1; fi
  fi
  command -v unzip >/dev/null 2>&1 || { echo "กรุณาติดตั้ง unzip" >&2; exit 1; }
  unzip -q -o "$ZIP" -d "$BASE"
fi
exec "$DIST/bin/gradle" "$@"
