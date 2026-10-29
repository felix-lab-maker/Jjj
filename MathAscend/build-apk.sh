#!/usr/bin/env bash
set -euo pipefail
# Usage: ANDROID_JAR=/path/android.jar BUILD_TOOLS=/path/build-tools/30.0.3 ./build-apk.sh
ROOT="$(cd "$(dirname "$0")" && pwd)"
: "${ANDROID_JAR:?Set ANDROID_JAR to an Android SDK android.jar (API 29 or newer)}"
: "${BUILD_TOOLS:?Set BUILD_TOOLS to Android SDK build-tools 30.0.3}"
cd "$ROOT"
mkdir -p .build/classes .build/dex releases
"$BUILD_TOOLS/aapt" package -f -M app/src/main/AndroidManifest.xml -S app/src/main/res -A app/src/main/assets -I "$ANDROID_JAR" -F .build/resources.apk
javac -source 8 -target 8 -bootclasspath "$ANDROID_JAR" -d .build/classes app/src/main/java/de/mathascend/app/MainActivity.java
"$BUILD_TOOLS/d8" --lib "$ANDROID_JAR" --min-api 23 --output .build/dex .build/classes/de/mathascend/app/*.class
cp .build/resources.apk .build/unsigned.apk
(cd .build/dex && zip -q ../unsigned.apk classes.dex)
"$BUILD_TOOLS/zipalign" -f 4 .build/unsigned.apk .build/aligned.apk
if [ ! -f .build/development.jks ]; then
 keytool -genkeypair -keystore .build/development.jks -storepass android -keypass android -alias development -dname 'CN=Math Ascend Development' -keyalg RSA -keysize 2048 -validity 10000 -noprompt
fi
"$BUILD_TOOLS/apksigner" sign --ks .build/development.jks --ks-key-alias development --ks-pass pass:android --key-pass pass:android --out releases/MathAscend.apk .build/aligned.apk
"$BUILD_TOOLS/apksigner" verify --verbose releases/MathAscend.apk
printf '\nAPK: %s/releases/MathAscend.apk\n' "$ROOT"
