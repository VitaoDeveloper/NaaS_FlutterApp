# NaaS API Calling App

A simple Flutter app that consumes the public **[No as a Service](https://naas.isalman.dev/)** API to generate random excuses (in Portuguese) for creatively saying "no" to any request.

The project serves as a practical example of REST API consumption in Flutter using the `dio` package, with proper handling of loading and error states.

## About the project

The main screen shows an initial message and a "Generate excuse" button. When pressed, the app makes a `GET` request to the `/no` endpoint of the NaaS API (Portuguese variant) and displays the returned excuse on screen. The app handles three states:

- **Loading** — while the request is in progress, the button shows a progress indicator and is disabled;
- **Success** — the excuse returned by the API is displayed on the central card;
- **Error** — if the API returns an HTTP error or the connection fails, a friendly error message is shown instead of the excuse.

## Tech stack

- **Flutter** (Material 3)
- **Dart**
- **[dio](https://pub.dev/packages/dio)** — HTTP client used to consume the API
- **[No as a Service](https://naas.isalman.dev/)** (Portuguese endpoint) — external API that provides the excuses

## Project structure

```
NaaS_FlutterApp/
├── lib/
│   └── main.dart          # Single-screen app: UI + API integration via Dio
├── android/                # Android platform configuration
├── ios/                    # iOS platform configuration
├── linux/                  # Linux platform configuration
├── macos/                  # macOS platform configuration
├── windows/                # Windows platform configuration
├── web/                    # Web platform configuration
├── test/
│   └── widget_test.dart
└── pubspec.yaml            # Project dependencies and metadata
```

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (compatible with Dart `^3.11.5`, as specified in `pubspec.yaml`)
- An emulator, physical device, or browser set up to run Flutter

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/VitaoDeveloper/NaaS_FlutterApp.git
   cd NaaS_FlutterApp
   ```

2. Install the dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app (choose your target platform):
   ```bash
   flutter run
   ```

   Or specify a device/platform, for example:
   ```bash
   flutter run -d chrome     # Web
   flutter run -d windows    # Windows
   flutter run -d linux      # Linux
   ```
   
Or you can just download the .apk file in https://github.com/VitaoDeveloper/NaaS_FlutterApp/releases


> The app requires an internet connection, since it queries the external API `no-as-a-service-portuguese-ts.vercel.app` in real time.

## License

This project currently has no defined license. Feel free to use it as a study reference.
