# Jjj – Spiele-Sammlung

Zwei offline Android-Spiele + GitHub Automation + Pitch-Präsentation. Ohne Internet, ohne Accounts, ohne Käufe.

> **🎬 Neu: PowerPoint-Pitch mit Animationen → [`Angelspiel-Praesentation.pptx`](Angelspiel-Praesentation.pptx) (14 Slides, animierte Übergänge)**

## 🎣 Angelspiel (neu!)

Dunkles Angelspiel: 6 Reviere, 25 Fischarten, 8 Würfe pro Mission – Casting → Biss → Drill.

- **Spielen im Browser:** `Angelspiel/app/src/main/assets/index.html` öffnen – oder [GitHub Pages Demo](#-github-pages) nutzen
- **APK:** `Angelspiel/releases/Angelspiel.apk` (nach Build via Actions)
- **Bauen:** siehe `Angelspiel/README.md` und `Angelspiel/build-apk.sh`

Features: Echolot, Profi-Rute, Fischlexikon, lokale Top-10, Themes, Kombos, XP.

## 🧮 Math Ascend

Mathe-Abenteuer aus der Original-ZIP.

- **Spielen:** `MathAscend/app/src/main/assets/index.html`
- **APK:** `MathAscend/releases/MathAscend.apk`
- **Bauen:** `MathAscend/build-apk.sh`

## 🎨 Präsentation

Polierte PowerPoint mit 14 Slides, dunklem Fishing-Design und animierten Übergängen (Fade, Push, Wipe):

1. Titel & Vision
2. Agenda
3. Warum offline?
4. Math Ascend – das Original
5. Angelspiel – Highlights
6. Gameplay Loop (3 Phasen)
7. Fortschritt & Lexikon
8. Shop – Fair Play
9. Architektur (WebView + build-apk.sh)
10. GitHub Actions (Push → Build → Artifact → Release)
11. GitHub Pages (direkt spielen)
12. Installation & Demo
13. Roadmap V1 → V2
14. Closing

Datei: [`Angelspiel-Praesentation.pptx`](Angelspiel-Praesentation.pptx) + [`docs/Angelspiel-Praesentation.pptx`](docs/Angelspiel-Praesentation.pptx) (für Pages)

> Tipp: In PowerPoint → *Bildschirmpräsentation → Ab aktueller Folie* – alle Übergänge sind als „Beim Klicken“ animiert, Texte erscheinen nacheinander.

## 📁 Repo-Struktur

```
.
├── Angelspiel/                  # Neues Angelspiel (Android + Web)
│   ├── app/src/main/assets/index.html
│   ├── app/src/main/java/de/angelspiel/app/MainActivity.java
│   ├── app/src/main/AndroidManifest.xml
│   ├── build-apk.sh
│   └── releases/Angelspiel.apk (nach Build)
├── MathAscend/                  # Original Math-Spiel entpackt
│   ├── app/src/main/assets/index.html
│   ├── README.md
│   ├── build-apk.sh
│   └── releases/MathAscend.apk
├── docs/                        # GitHub Pages (spielbar)
│   ├── index.html               # Landing Page
│   ├── angel/index.html         # Angelspiel
│   ├── math/index.html          # Math Ascend
│   └── Angelspiel-Praesentation.pptx
├── Angelspiel-Praesentation.pptx  # Pitch-Deck (14 Slides + Animationen)
└── .github/workflows/build-apks.yml  # Baut beide APKs automatisch
```

## 🤖 GitHub Actions – APKs automatisch bauen

Der Workflow `.github/workflows/build-apks.yml` baut bei jedem Push beide APKs:

- installiert JDK 17 + Android SDK (Platform 29, Build-Tools 30.0.3)
- führt `MathAscend/build-apk.sh` und `Angelspiel/build-apk.sh` aus
- lädt die APKs als Artifacts hoch
- bei Tag `v*` erstellt er automatisch ein Release mit beiden APKs

**So nutzt du ihn:**
1. Push auf `main` oder `arena/*` → Actions → Artifact downloaden
2. Tag erstellen: `git tag v1.0 && git push origin v1.0` → Release mit APKs

## 🌐 GitHub Pages

Aktiviere Pages: **Settings → Pages → Source: Deploy from branch → Branch: main → Folder: /docs**

Danach:
- `https://felix-lab-maker.github.io/Jjj/` → Landing Page
- `https://felix-lab-maker.github.io/Jjj/angel/` → Angelspiel
- `https://felix-lab-maker.github.io/Jjj/math/` → Math Ascend
- `https://felix-lab-maker.github.io/Jjj/Angelspiel-Praesentation.pptx` → Präsentation direkt downloaden

Oder lokal: einfach `Angelspiel/app/src/main/assets/index.html` im Browser öffnen.

## 🔧 Lokal bauen

```bash
# Einmalig: Android SDK installieren (siehe Angelspiel/README.md)

# Angelspiel
export ANDROID_JAR="$ANDROID_HOME/platforms/android-29/android.jar"
export BUILD_TOOLS="$ANDROID_HOME/build-tools/30.0.3"
./Angelspiel/build-apk.sh
# → Angelspiel/releases/Angelspiel.apk

# Math Ascend
./MathAscend/build-apk.sh
# → MathAscend/releases/MathAscend.apk
```

## 📦 Releases

Releases liegen unter `releases/` und als GitHub Actions Artifacts. Nach dem Build kannst du die APKs direkt auf Android installieren (Installation aus unbekannter Quelle erlauben).

---

Offline-Prototypen, keine Play-Store-Releases. Viel Spaß beim Angeln! 🎣
