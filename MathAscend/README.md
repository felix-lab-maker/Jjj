# Math Ascend – spielbarer Offline-Prototyp 1.0

Dunkles Mathe-Spiel für Android. Keine Registrierung, keine Netzwerkverbindung, keine Zahlungen.

## Installation
1. MathAscend.apk auf ein Android-Gerät kopieren und öffnen.
2. Falls nötig, für die verwendete Dateien-App die Installation aus dieser Quelle erlauben.
3. Nach der Installation kann diese Berechtigung wieder ausgeschaltet werden.

Voraussetzungen: Android 6 oder neuer und eine aktuelle Android System WebView. Die App nutzt eine native Android-Hülle mit lokal eingebetteter HTML/CSS/JavaScript-Oberfläche. Auf neueren Android-Versionen kann ein Hinweis auf die ältere Ziel-Android-Version erscheinen. Dies ist eine Entwicklungsversion, kein Play-Store-Release.

## Enthalten
- Sechs Themenwelten: Kopfrechnen, Brüche/Prozent, Algebra, Funktionen/Geometrie, Analysis und Experten-Einstieg.
- Acht Aufgaben pro Mission, drei Leben, Freischaltung ab sechs richtigen Antworten.
- Freies Training in allen Welten ohne Belohnungen.
- XP, Energie, Kombos, Erklärungen und lokale Top-10-Runden.
- Freischaltbare Farbthemen und ein Lösungsweg-Coach im Training.
- Lokale Speicherung im WebView-Speicher. Kein Cloud-Backup und kein Gerätewechsel-Sync.

## Nicht enthalten / nächste Schritte
- Kein Internetserver, keine globale Rangliste, keine Benutzerkonten.
- Keine Live-KI: Textaufgaben sind lokale, parametrisierte Vorlagen.
- Expertenaufgaben sind eine kleine Auswahl, kein vollständiger Hochschulkurs.
- Keine Freitext-/Formeleingabe, keine Beweisprüfung, keine Käufe.
- Vor Onlinebetrieb: HTTPS-Backend, Authentifizierung, Datenschutzkonzept, serverseitige Aufgaben/Scores, Rate-Limits und unabhängige Prüfung von KI-Lösungen ergänzen. Nicht einfach lokale Punktzahlen als vertrauenswürdig übernehmen.

## Quellcode
- app/src/main/assets/index.html: vollständige Oberfläche und Spiellogik; auch direkt im modernen Browser nutzbar.
- app/src/main/java/de/mathascend/app/MainActivity.java: Android-WebView-Hülle.
- app/src/main/AndroidManifest.xml: Android-Konfiguration (keine Internetberechtigung).
- build-apk.sh: APK bauen ohne Gradle.

## Selbst bauen unter Linux
Benötigt: JDK 11 mit java, javac und keytool im PATH, zip, Android SDK Platform 29 und Build Tools 30.0.3. Die Android-SDK-Lizenzbedingungen beachten.

```bash
chmod +x build-apk.sh
export ANDROID_JAR="$ANDROID_HOME/platforms/android-29/android.jar"
export BUILD_TOOLS="$ANDROID_HOME/build-tools/30.0.3"
./build-apk.sh
```

Die APK liegt anschließend unter releases/MathAscend.apk. Das Skript erstellt einen lokalen Entwicklungsschlüssel in .build/development.jks (Passwort android). Er ist nur für Entwicklung geeignet, nicht für die Veröffentlichung. Schlüssel sichern: Für Updates muss immer derselbe Signaturschlüssel verwendet werden. Der Signaturschlüssel der mitgelieferten APK ist nicht im ZIP enthalten; eine selbst neu signierte APK erfordert daher gegebenenfalls die vorherige Deinstallation der gelieferten Version (mit Verlust lokaler Daten).

## Prüfstand
- Java-Quellcode kompiliert, DEX und APK erzeugt.
- APK-Signaturen v1, v2, v3 erfolgreich geprüft.
- JavaScript-Syntaxprüfung bestanden.
- 6000 generierte Aufgaben auf vier eindeutige Optionen und enthaltene richtige Antwort geprüft.
- Automatisierte Logiktests für Fortschritt, Belohnungen, Training und Shop bestanden.
- Keine Emulator- oder physische Gerätetestung; visuelle Darstellung und Android-Laufzeit müssen am Gerät geprüft werden.
