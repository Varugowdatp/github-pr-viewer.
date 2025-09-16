* GITHUB PULL REQUEST VIEWER

A Flutter app that displays open Pull Requests from a GitHub repository using the GitHub REST API.
Includes token simulation, dark mode, Cupertino iOS-style UI, error handling, and bonus features.

* OBJECTIVE

-- Fetch pull requests from a GitHub repository.

-- Show PR title, description, author, and created date.

-- Simulate login with a fake token.

-- Store token securely using shared_preferences.

-- Display token inside the app.

* PROJECT STRUCTURE
  lib/
 ┣ core/
 ┃ ┣ api/
 ┃ ┃ ┗ github_api.dart        # GitHub API integration
 ┃ ┣ models/
 ┃ ┃ ┗ pull_request_model.dart
 ┃ ┗ utils/
 ┃    ┣ constants.dart        # App colors and constants
 ┃    ┗ theme_provider.dart   # Dark mode state management
 ┣ screens/
 ┃ ┣ login_screen.dart        # Dummy login with token simulation
 ┃ ┗ pull_request_screen.dart # List of PRs with refresh
 ┣ widgets/
 ┃ ┣ pr_card.dart             # Card UI for pull requests
 ┃ ┣ loading_widget.dart      # Shimmer loading effect
 ┃ ┗ error_widget.dart        # Error + retry button
 ┣ main.dart                  # Entry point

*  SETUP INSTRUCTIONS
  -- CLONE THE REPO
     git clone https://github.com/Varugowdatp/github-pr-viewer.git
     cd github-pr-viewer
  -- INSTALL DEPENDENCY
     flutter pub get
  -- RUN
      flutter run
 -- DEPENDEMCY USED
     flutter pub add http shared_preferences provider shimmer cupertino_icons

* TOKEN HANDLING

* On the login screen, the user enters any string as a fake token (or leaves empty for default abc123).
* Token is saved using shared_preferences.
* The stored token can be viewed later in the PR screen using a CupertinoAlertDialog.
* If GitHub rate limits API requests (60/hour without auth), you can replace the fake token with a real GitHub personal access token (PAT) for unlimited requests.

* Bonus Features Implemented

 Cupertino iOS-style UI (alerts, buttons, switches, dialogs)
 Shimmer loading effect while data loads
 Dark mode toggle (persistent across sessions)
 Error handling with retry button
 Pull-to-refresh with CupertinoSliverRefreshControl
 Token display dialog
 Clean, modular folder structure
 Attractive card design with shadows and rounded corners

 *KNOWN ISSUES AND IMPLEMNTATION

 --The simulated token is not actually used in API requests unless replaced with a valid GitHub token.

--Only open pull requests are fetched (/pulls endpoint). For closed/merged, add ?state=all.

--No pagination yet — only fetches the first 30 PRs.

--Requires an internet connection.


* DEMO VIDEO
  

https://github.com/user-attachments/assets/98acab38-f1a5-4215-a9ac-d90067f3d5fb


