# demo_movies

To run project:
1. Open Terminal in root project and type "flutter pub get" (enter) and then "flutter pub run build_runner build --delete-conflicting-outputs" (enter)
2. Open project in Android Studio and then create two Flutter run configuration with details specified below:
    1. dev run configuration
        - Name: dev
        - Dart entrypoint: (pointing to) lib/main_dev.dart
        - Build flavor: dev

    2. prod run configuration
        - Name: prod
        - Dart entrypoint: (pointing to) lib/main_prod.dart
        - Build flavor: prod

3. Run the project with "dev" run configuration or "prod" run configuration.
