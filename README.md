# Quickfood

![](https://img.shields.io/github/license/T-Thyrak/quickfood)
![](https://img.shields.io/github/languages/code-size/T-Thyrak/quickfood)
![](https://img.shields.io/github/last-commit/T-Thyrak/quickfood)

- [Quickfood](#quickfood)
- [Description](#description)
- [Features](#features)
  - [Completed](#completed)
  - [Planned or interested](#planned-or-interested)
- [Installation](#installation)
  - [Dependencies](#dependencies)
  - [Installation steps](#installation-steps)
- [Contributors](#contributors)


# Description
This is a project that aims to serve as a quick and easy way to order your food from local restaurants.

The project is written in Flutter, so you are able to setup your own version of the application easily.

# Features
## Completed
- Login and Registration through Firebase email/password or Google OAuth
- Checkout and order foods
- Edit your profile

## Planned or interested
- Incorporate location based ordering so you can order food from your local restaurants
- Foods that you might like based on past orders

# Installation
## Dependencies
- [Flutter](https://flutter.dev/)
- [Git](https://git-scm.com/)
- [Firebase](https://firebase.google.com/)

## Installation steps
First, we clone the repository.

```bash
git clone https://github.com/T-Thyrak/quickfood.git
cd quickfood
```

Next, we install the dependencies.
```bash
flutter pub get
```

Then, we put our firebase services into the appropriate folders.

- Android: `/android/app/google-services.json`
- iOS: `/ios/Runner/GoogleService-Info.plist`
- MacOS: `/macos/Runner/GoogleService-Info.plist`

Firebase doesn't have support Windows application yet, so that is unfortunate.

Finally, we can build and run our application.

```bash
flutter run -d <device>
```

# Contributors
- [Teng Thaisothyrak](https://github.com/T-Thyrak)
- [Sareoun Sirivadthna](https://github.com/N1ghtler)
- [Sieng Satya](https://github.com/SatyaProgrammer)