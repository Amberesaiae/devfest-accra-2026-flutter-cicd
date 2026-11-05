# From Code to Testers: Flutter CI/CD with Codemagic

**DevFest Accra 2026 — Presenter Runbook**

- **Presenter:** Julius Boakye
- **Workshop:** Flutter CI/CD with GitHub, Codemagic, and Firebase App Distribution
- **Starter Project:** `devfest_accra_2026`
- **Repository:** `devfest-accra-2026-flutter-cicd`

---

## 1. Workshop Objective

By the end of this session, participants should understand how to:

1. Start with an existing Flutter project.
2. Push and manage the project on GitHub.
3. Register an Android app in Firebase.
4. Configure Firebase App Distribution.
5. Create a tester group.
6. Connect GitHub to Codemagic.
7. Configure a CI/CD workflow using `codemagic.yaml`.
8. Build an Android APK automatically.
9. Distribute that APK to testers through Firebase.

### The Final Result:
> **A developer pushes code to GitHub → Codemagic builds and tests the Flutter app → Firebase App Distribution delivers the APK to testers.**

---

## 2. Before the Workshop — Preparation

Do not wait until the event day to discover that an account needs verification or that a build takes longer than expected.

### 2.1 Accounts to Prepare
- [ ] GitHub account
- [ ] Codemagic account
- [ ] Google account
- [ ] Firebase project access
- [ ] Android device or emulator
- [ ] Flutter SDK installed
- [ ] Git installed
- [ ] Working internet connection

### 2.2 Prepare the Starter Repository
- **Repository name:** `devfest-accra-2026-flutter-cicd`
- **Starter project:** `devfest_accra_2026`

**Checklist before the event:**
- [ ] Push the starter project to GitHub.
- [ ] Confirm the repository is public and accessible to participants.
- [ ] Clone it into a separate test folder.
- [ ] Run `flutter pub get`.
- [ ] Run `flutter test`.
- [ ] Run the app on an Android device or emulator.
- [ ] Confirm that the welcome screen displays correctly.

> [!WARNING]
> Do not include Firebase service-account JSON files, passwords, signing keys, or other secrets in the public repository.

### 2.3 Keep These Details Available

| Item | Value to prepare |
| :--- | :--- |
| **GitHub repository** | Your public repository URL |
| **Flutter project** | `devfest_accra_2026` |
| **Android package name** | `com.juliusboakye.devfest_accra_2026` |
| **Firebase project ID** | Obtain from Firebase Console |
| **Firebase Android App ID** | Obtain after registration (`1:xxx:android:xxx`) |
| **Tester group alias** | `devfest-testers` |
| **Codemagic variable group** | `firebase_credentials` |

> [!NOTE]
> The **Firebase App ID** is not the same as the **Android package name**. You will need both.

---

## 3. Opening the Workshop

⏱️ **Suggested time: 3 minutes**

### What to Say
> *"Hello everyone!*  
> *Today, we're going to look at something every mobile developer eventually encounters: how do we get our application from our development machine into the hands of people who need to test it?*  
> *Many developers write code, build an APK manually, and send it to someone through WhatsApp or email.*  
> *That works, but what happens when you're working with a team, releasing updates regularly, or managing multiple testers?*  
> *Today, we're going to automate that process. We'll use GitHub to host our code, Codemagic to automate our builds, and Firebase App Distribution to deliver the application to testers."*

### Explain the Final Pipeline
```
GitHub ──> Codemagic ──> Flutter Tests ──> Android Build ──> Firebase App Distribution ──> Testers
```

**Transition:**  
*"Before we start configuring any of these services, let's make sure everyone has the same starting point."*

---

## 4. Stage One — Get the Starter Flutter Application

⏱️ **Suggested time: 5 minutes**

### What to Say
> *"I've prepared a small Flutter application for everyone. We won't spend time building a complicated interface because our focus today is the release process."*

Show the GitHub repository.

### Commands for Participants:

```bash
# Clone the starter repository
git clone https://github.com/Darkbeast-glitch/devfest-accra-2026-flutter-cicd.git
cd devfest-accra-2026-flutter-cicd

# Install dependencies
flutter pub get

# Run tests
flutter test

# Run the app
flutter run
```

### What to Explain
The app displays:
- Welcome to DevFest Accra 2026
- My name is Julius.
- From Code to Testers 🚀

It also includes a widget test in `test/widget_test.dart`.

**Teaching Point:**  
> *"Notice that we already have tests in our project. Later, Codemagic will execute these tests automatically before producing our application build."*

### Checkpoint:
Confirm participants can clone, install dependencies, and run the app. If someone has a local machine issue, have them follow along on the projector.

---

## 5. Stage Two — Create the Firebase Project

⏱️ **Suggested time: 8 minutes**

### What to Say
> *"Now that we have our Flutter application, we need somewhere to distribute it.*  
> *Firebase provides a service called Firebase App Distribution. It allows us to distribute pre-release versions of our applications to testers without publishing them to the Play Store."*

### Steps:
1. Open [Firebase Console](https://console.firebase.google.com/).
2. Sign in with your Google account.
3. Click **Create a project**.
4. Enter project name: `devfest-accra-2026`.
5. Continue through setup (disable Google Analytics for this demo to save time).
6. Click **Create project** and wait for provisioning.

### Key Distinction:
> *"We are not building a Firebase-powered application today. We're using Firebase as our application distribution service. We can register an Android app for App Distribution without integrating Firebase SDKs or `google-services.json` into our Flutter code."*

---

## 6. Stage Three — Register the Android Application

⏱️ **Suggested time: 5 minutes**

### What to Say
> *"Firebase needs to know which Android application we're distributing. To do that, we register the application using its Android package name."*

### Steps:
1. Open Firebase Project Overview.
2. Click **Add app** → Select **Android**.
3. Enter Android package name:  
   `com.juliusboakye.devfest_accra_2026`
4. Enter App nickname:  
   `DevFest Accra Flutter App`
5. Continue with registration. Skip downloading `google-services.json` since no Firebase client SDKs are required.

> [!IMPORTANT]
> The package name must match `applicationId` in `android/app/build.gradle.kts`. Firebase uses it to identify the app.

---

## 7. Stage Four — Enable Firebase App Distribution

⏱️ **Suggested time: 5 minutes**

### Steps:
1. Inside your Firebase project, open **App Distribution** from the Build menu on the left.
2. If prompted, click **Get started**.
3. Select the registered Android application.

### What to Say
> *"Firebase App Distribution is where we'll manage our pre-release builds. We can upload a build, choose who receives it, add release notes, and let testers install it."*

---

## 8. Stage Five — Create the Tester Group

⏱️ **Suggested time: 5 minutes**

### What to Say
> *"Instead of adding testers individually every time we release an application, we can organize them into groups."*

### Steps:
1. In Firebase App Distribution, click the **Testers & Groups** tab.
2. Click **Add group**.
3. Group name: `DevFest Testers`
4. Group alias: `devfest-testers`
5. Save the group.
6. Add your own email address as a tester (plus volunteer participants).

> [!IMPORTANT]
> The group name is what we see in Firebase. The **group alias** (`devfest-testers`) is what we reference in `codemagic.yaml`.

---

## 9. Stage Six — Connect GitHub to Codemagic

⏱️ **Suggested time: 7 minutes**

### What to Say
> *"We now have our source code on GitHub and our tester group in Firebase. We need a service that can connect these two parts and automate the work. That's where Codemagic comes in."*

### Steps:
1. Open [Codemagic](https://codemagic.io/) and sign in.
2. Connect your GitHub account and authorize repository access.
3. Click **Add application**.
4. Select `devfest-accra-2026-flutter-cicd`.
5. Select **Flutter** as the project type.
6. Open application configuration.

---

## 10. Stage Seven — Create `codemagic.yaml`

⏱️ **Suggested time: 10 minutes**

### What to Say
> *"This is where the automation instructions live. Instead of manually clicking buttons, we define the entire workflow in a YAML file that lives in our repository."*

Create `codemagic.yaml` in the project root:

```yaml
workflows:
  android-workflow:
    name: DevFest Android Build

    environment:
      flutter: stable

    scripts:
      - name: Get Flutter packages
        script: |
          flutter pub get

      - name: Run Flutter tests
        script: |
          flutter test

      - name: Analyze Flutter code
        script: |
          flutter analyze

      - name: Build Android APK
        script: |
          flutter build apk --release

    artifacts:
      - build/app/outputs/flutter-apk/app-release.apk
```

### Commit and Push:
```bash
git add codemagic.yaml
git commit -m "Add Codemagic Android workflow"
git push origin main
```

---

## 11. Stage Eight — Run the First Codemagic Build

⏱️ **Suggested time: 5 minutes**

1. Return to Codemagic and open the app.
2. Confirm Codemagic detects `codemagic.yaml`.
3. Select `android-workflow` on branch `main`.
4. Click **Start new build**.
5. Walk the audience through the real-time build logs:
   - Setting up build machine
   - Fetching dependencies (`flutter pub get`)
   - Executing tests (`flutter test`)
   - Running analyzer (`flutter analyze`)
   - Building APK (`flutter build apk --release`)
   - Collecting the APK artifact

---

## 12. Stage Nine — Configure Firebase Authentication

⏱️ **Suggested time: 8 minutes**

### What to Say
> *"Codemagic can build our application, but it still needs permission to publish that application to Firebase. We authenticate Codemagic using a Google Cloud service account with least-privilege permissions."*

### Steps to Create Service Account:
1. In Firebase, go to **Project Settings** → **Service accounts**.
2. Click **Manage service account permissions** (opens Google Cloud Console).
3. Click **+ Create Service Account**.
4. Name: `codemagic-firebase-distribution`.
5. Assign Role: **Firebase App Distribution Admin**.
6. Click **Done**.
7. Click the created service account → **Keys** tab → **Add Key** → **Create new key** (JSON).
8. Download and securely save the JSON file.

> [!CAUTION]
> Never commit this JSON file to GitHub or show the private key on the screen!

---

## 13. Stage Ten — Add Credentials to Codemagic

⏱️ **Suggested time: 7 minutes**

1. In Codemagic, open **Application settings** → **Environment variables**.
2. Create group: `firebase_credentials`.
3. Add these two variables:

| Variable | Value | Notes |
| :--- | :--- | :--- |
| `FIREBASE_SERVICE_ACCOUNT` | Entire contents of downloaded JSON key file | Mark as **Secret** |
| `GOOGLE_APPLICATION_CREDENTIALS` | `$CM_BUILD_DIR/firebase_credentials.json` | Mark as **Secret** |

4. Ensure both are assigned to the `firebase_credentials` group and saved.

---

## 14. Stage Eleven — Configure Firebase Publishing

⏱️ **Suggested time: 8 minutes**

Update `codemagic.yaml` to include automatic triggers and publishing:

```yaml
workflows:
  android-workflow:
    name: DevFest Android Firebase Distribution

    triggering:
      events:
        - push
      branch_patterns:
        - pattern: main
          include: true
      cancel_previous_builds: true

    environment:
      flutter: stable
      groups:
        - firebase_credentials

    scripts:
      - name: Get Flutter packages
        script: |
          flutter pub get

      - name: Run Flutter tests
        script: |
          flutter test

      - name: Analyze Flutter code
        script: |
          flutter analyze

      - name: Build Android APK
        script: |
          flutter build apk --release

    artifacts:
      - build/app/outputs/flutter-apk/app-release.apk

    publishing:
      firebase:
        firebase_service_account: $FIREBASE_SERVICE_ACCOUNT
        android:
          app_id: YOUR_FIREBASE_ANDROID_APP_ID
          groups:
            - devfest-testers
          artifact_type: apk
```

Replace `YOUR_FIREBASE_ANDROID_APP_ID` with the actual ID from Firebase Console (e.g. `1:346528691909:android:a6bcaa14d0cab3f317a2ac`).

```bash
git add codemagic.yaml
git commit -m "Configure Firebase App Distribution publishing"
git push origin main
```

---

## 15. Stage Twelve — Run the Complete Pipeline

⏱️ **Suggested time: 5 minutes**

1. Start the workflow in Codemagic or watch the automatic push trigger.
2. Watch the publishing step in the build logs:
   - Codemagic authenticates with Firebase.
   - Uploads `app-release.apk`.
   - Assigns release to `devfest-testers`.

---

## 16. Stage Thirteen — Verify the Distribution

⏱️ **Suggested time: 5 minutes**

1. Open Firebase Console → **App Distribution** → **Releases**.
2. Confirm the new release appears with the correct version number.
3. Show the assigned group: `devfest-testers`.
4. Open your tester email on an Android device, accept invitation, and install the build.

---

## 17. Stage Fourteen — Demonstrate Another Code Change

⏱️ **Suggested time: 5 minutes**

*This proves the true value of CI/CD:*

1. Open `pubspec.yaml` and increment version:
   ```yaml
   version: 1.0.0+2
   ```
2. Open `lib/welcome.dart` and modify a visible string.
3. Commit and push:
   ```bash
   git add pubspec.yaml lib/welcome.dart
   git commit -m "chore: release update v1.0.0+2"
   git push origin main
   ```
4. Show that Codemagic automatically detects the push on `main`, runs tests, builds the APK, and delivers the new release to testers without touching any manual build buttons!

---

## 18. Troubleshooting Guide

| Problem | Root Cause & Fix |
| :--- | :--- |
| **Repository not detected** | Check GitHub integration and OAuth permissions in Codemagic. |
| **`groups: extra fields not permitted`** | Ensure `groups:` is indented under `environment:`, not at the root of `android-workflow`. |
| **Tests fail in CI** | Run `flutter test` locally to diagnose and fix failing assertions. |
| **Analyzer fails in CI** | Run `flutter analyze` locally to resolve lint issues. |
| **APK not found** | Verify path: `build/app/outputs/flutter-apk/app-release.apk`. |
| **Firebase auth fails** | Confirm `FIREBASE_SERVICE_ACCOUNT` is set in Codemagic environment variables and role is *Firebase App Distribution Admin*. |
| **Firebase app not found** | Verify `app_id` matches the Firebase App ID (not package name). |
| **Tester group not found** | Check that `groups` in YAML matches the group **alias** (`devfest-testers`), not the display name. |
| **Push does not trigger** | Check GitHub repo `Settings → Webhooks`. Ensure Codemagic webhook exists and is active. |

---

## 19. Quick Reference Commands

```bash
# Clone
git clone https://github.com/Darkbeast-glitch/devfest-accra-2026-flutter-cicd.git
cd devfest-accra-2026-flutter-cicd

# Install packages
flutter pub get

# Run tests
flutter test

# Code analysis
flutter analyze

# Local build
flutter build apk --release

# Push changes
git add .
git commit -m "Update code"
git push origin main
```

---

## 20. Final Presenter Checklist Before Going on Stage

- [ ] Repository is public: `https://github.com/Darkbeast-glitch/devfest-accra-2026-flutter-cicd`
- [ ] Local tests pass (`flutter test`).
- [ ] Android package name confirmed: `com.juliusboakye.devfest_accra_2026`.
- [ ] Firebase App ID ready: `1:346528691909:android:a6bcaa14d0cab3f317a2ac`.
- [ ] Tester group alias confirmed: `devfest-testers`.
- [ ] Service account JSON key securely stored in Codemagic secrets.
- [ ] Backup APK on USB drive/Google Drive in case of venue Wi-Fi failure.
- [ ] Android test device connected and ready to receive test build.

**The Main Takeaway:**  
*"We are not simply learning how to build an APK. We are learning how to automate the journey from source code to testers."*
