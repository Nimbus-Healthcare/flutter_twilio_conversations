By [**Diversido**](https://www.diversido.io)

## Flutter Twilio Conversations
This package is based on [Twilio Programmable Chat Plugin](https://pub.dev/packages/twilio_programmable_chat). We decided to make our own version of it and rebase to Twilio Conversations SDK since Twilio Programmeble Chat is sunsetting this year. It is not an official plugin and still requires some fixes and further maintenance, please do not report issues of it to Twilio — if you have any issues, please file an issue instead of contacting support.

## About this fork
This is the **Nimbus Healthcare** maintained fork of [Diversido/flutter_twilio_conversations](https://github.com/Diversido/flutter_twilio_conversations), which has been dormant since February 2025. It adds:

* **Android:** support for AGP 9 built-in Kotlin, `compileSdk` 36 and a matching Java target.
* **iOS:** Swift Package Manager support (`ios/flutter_twilio_conversations/Package.swift`, depending on [twilio/conversations-ios](https://github.com/twilio/conversations-ios) 4.0.x). The podspec still works for CocoaPods apps.

The iOS SPM change is also proposed upstream in [Diversido#58](https://github.com/Diversido/flutter_twilio_conversations/pull/58). If upstream merges it and resumes maintenance, apps can switch back.

### Using the fork
Pin a commit from `main` in your `pubspec.yaml`:

```yaml
flutter_twilio_conversations:
  git:
    url: https://github.com/Nimbus-Healthcare/flutter_twilio_conversations.git
    ref: <commit sha>
    path: flutter_twilio_conversations
```

## Installing the plugin

```sh
# Run the following command
$ dart pub add flutter_twilio_conversations
```

## Setup
No special setup required, most of the tips on Console setup can be found in [Twilio's Native SDK Guides](https://www.twilio.com/docs/conversations)

## Supported platforms
* Android
* iOS
* Web

## Tutorial for uploading new versions
```sh
# Start by uploading a new version of the Platform interface
$ (cd flutter_twilio_conversations_platform_interface && flutter pub get && dart pub publish)
# Then wait several minutes and upload the new Web package, which depends on the new version of the interface
$ (cd flutter_twilio_conversations_web && flutter pub upgrade && dart pub publish)
# Then wait several minutes and upload the new main package, which depends on both other packages
$ (cd flutter_twilio_conversations && flutter pub upgrade && dart pub publish)
```


# Development and Contributing
Feel free to contribute by creating merge requests!