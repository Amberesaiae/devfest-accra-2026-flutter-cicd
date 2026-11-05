# DevFest Accra 2026 — From Code to Testers 🚀

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Codemagic](https://img.shields.io/badge/Codemagic-F96854?style=for-the-badge&logo=codemagic&logoColor=white)](https://codemagic.io)
[![Firebase](https://img.shields.io/badge/Firebase-%23FFA611.svg?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![GDG Accra](https://img.shields.io/badge/GDG-Accra%202026-4285F4?style=for-the-badge)](https://gdg.community.dev)

Welcome to the companion demonstration app for **DevFest Accra 2026**, presented by **Julius**. 

This project demonstrates how to set up an end-to-end, production-grade mobile continuous integration and delivery (CI/CD) pipeline for Flutter applications—taking your app seamlessly from local code commits directly into the hands of your testers.

---

## 📋 Session Abstract

> **"From Code to Testers: Flutter • Codemagic • Firebase"**  
> *Speaker: Julius*  
> *Conference: DevFest Accra 2026 (GDG Accra)*

Shipping mobile applications quickly without sacrificing code quality is one of the biggest challenges for modern development teams. This presentation and repository showcase:
1. **Automated Testing**: Writing clean unit and widget tests to catch bugs before they reach staging.
2. **CI/CD Automation with Codemagic**: Automating dependency installation, linting, tests, build generation, and code signing.
3. **Tester Distribution with Firebase**: Seamlessly distributing internal test builds to testers and stakeholders via Firebase App Distribution with zero manual friction.

---

## 🔄 Delivery Pipeline Workflow

```
┌──────────────────┐       ┌────────────────────┐       ┌────────────────────────┐       ┌──────────────────────────┐
│   Local Dev      │       │     CI Testing     │       │     Codemagic Build    │       │   Firebase Distribution  │
│  Flutter + Dart  │ ────> │  Widget/Unit Tests │ ────> │ Automated APK/IPA /AAB │ ────> │ Instant Test Release to   │
│   (Git Push)     │       │   Analyzer Lints   │       │   Signing & Artifacts  │       │       Testers Team       │
└──────────────────┘       └────────────────────┘       └────────────────────────┘       └──────────────────────────┘
```

---

## ✨ Features

- **DevFest Accra Welcome Screen**: A modern conference UI built with Google Developer styling, interactive session breakdown, and speaker spotlight.
- **Interactive Agenda Modal**: Explore the presentation breakdown directly inside the app.
- **Tested & Verified**: Comprehensive widget test suite verifying UI rendering and modal interactions.
- **Material 3 Theming**: Responsive layout optimized for modern devices with safe area and smooth scrolling support.

---

## 🛠️ Tech Stack & Tools

| Component | Technology | Purpose |
| :--- | :--- | :--- |
| **Framework** | [Flutter 3.x](https://flutter.dev) | Cross-platform mobile UI |
| **Language** | [Dart](https://dart.dev) | High-performance, client-optimized programming language |
| **Environment** | [FVM (Flutter Version Management)](https://fvm.app) | Consistent Flutter SDK versioning across team members |
| **CI / CD** | [Codemagic](https://codemagic.io) | Continuous integration & build automation |
| **Distribution** | [Firebase App Distribution](https://firebase.google.com/products/app-distribution) | Pre-release distribution to testers |

---

## 🚀 Getting Started

### Prerequisites

Ensure you have [FVM](https://fvm.app/) and Flutter installed:

```bash
# Check FVM installation
fvm --version
```

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/devfest_accra_2026.git
   cd devfest_accra_2026
   ```

2. **Install project dependencies:**
   ```bash
   fvm flutter pub get
   ```

3. **Run the application:**
   ```bash
   fvm flutter run
   ```

---

## 🧪 Running Tests & Diagnostics

To run the complete test suite:

```bash
# Run all unit and widget tests
fvm flutter test

# Run Dart code analyzer
fvm flutter analyze
```

---

## 📁 Project Structure

```
devfest_accra_2026/
├── lib/
│   ├── main.dart            # Application entrypoint & Material theme setup
│   └── welcome.dart         # DevFest Accra 2026 Welcome & Presentation Showcase
├── test/
│   └── widget_test.dart     # Widget tests for WelcomeScreen & Agenda Sheet
├── pubspec.yaml             # Dependencies and project metadata
└── README.md                # Project documentation
```

---

## 👨‍💻 Speaker & Credits

- **Presenter**: Julius
- **Event**: [DevFest Accra 2026](https://gdg.community.dev)
- **Organized by**: Google Developer Group (GDG) Accra

*"Let's build, learn, and ship something amazing together."*
