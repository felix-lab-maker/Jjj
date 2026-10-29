# Angelspiel – Offline Angel-Prototyp 1.0

Dunkles Angelspiel für Android. Offline, ohne Registrierung, ohne Internet.

## Installation
1. `Angelspiel.apk` auf Android-Gerät kopieren und öffnen.
2. Falls nötig: Installation aus dieser Quelle erlauben.
3. Nach Installation kann die Berechtigung wieder deaktiviert werden.

Voraussetzung: Android 6+ und aktuelle Android System WebView. Native Android-Hülle mit lokal eingebetteter HTML/CSS/JS-Oberfläche.

## Enthalten
- Sechs Angelreviere: Dorfteich, Waldfluss, Bergsee, Steilküste, Tiefsee, Legendenreich.
- 25 Fischarten mit Gewicht, Seltenheit (häufig → legendär) und Punkten.
- 8 Würfe pro Mission, 3 Leben, Freischaltung ab 6 Fängen.
- Freies Training in allen Revieren ohne Belohnungen.
- XP, Münzen, Kombos, Fischlexikon und lokale Top-10-Runden.
- Freischaltbare Farbthemen, Echolot und Profi-Rute.
- Lokale Speicherung im WebView (`angelspiel-v1`). Kein Cloud-Backup.

## Nicht enthalten
- Kein Online-Server, keine globale Rangliste, keine Accounts.
- Keine Live-KI.
- Keine echten Käufe – alle Münzen nur erspielt.

## Quellcode
- `app/src/main/assets/index.html`: komplette Oberfläche & Spiellogik, auch direkt im Browser spielbar.
- `app/src/main/java/de/angelspiel/app/MainActivity.java`: Android-WebView-Hülle.
- `app/src/main/AndroidManifest.xml`: Android-Konfiguration (keine Internetberechtigung).
- `build-apk.sh`: APK bauen ohne Gradle.

## Selbst bauen unter Linux
Benötigt: JDK 17, zip, Android SDK Platform 29 und Build Tools 30.0.3.

```bash
chmod +x build-apk.sh
export ANDROID_JAR="$ANDROID_HOME/platforms/android-29/android.jar"
export BUILD_TOOLS="$ANDROID_HOME/build-tools/30.0.3"
./build-apk.sh
```

APK liegt danach unter `releases/Angelspiel.apk`. Skript erstellt lokalen Dev-Key in `.build/development.jks` (Passwort `android`). Nur für Entwicklung, nicht für Release. Für Updates immer denselben Key nutzen.

## Lizenz
Prototyp – Entwicklungsversion, kein Play-Store-Release.
