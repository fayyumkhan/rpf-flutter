# RPF Flutter

RPF Duty Management App - A Flutter application for managing RPF constable duties with location tracking and real-time monitoring.

## Project Overview

This is a Flutter-based mobile application designed for RPF (Railway Protection Force) personnel to:
- Manage duty assignments and schedules
- Track real-time GPS location during duty hours
- Handle inspection tasks
- View duty history and analytics
- Monitor duty zones through interactive maps

## Getting Started

### Prerequisites

- Flutter SDK (>= 3.3.0)
- Dart SDK (>= 3.3.0)
- Android Studio / Xcode (for iOS development)
- Internet connection for API calls

### Installation

1. Clone the repository:
```bash
git clone https://github.com/fayyumkhan/rpf-flutter.git
cd rpf-flutter
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate app icons and splash screen:
```bash
flutter pub run flutter_launcher_icons
flutter pub run flutter_native_splash:create
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # Entry point
├── config/                   # App configuration
├── models/                   # Data models
├── services/                 # Business logic & API services
├── screens/                  # UI screens
├── utils/                    # Helper utilities
├── widgets/                  # Reusable widgets
└── assets/                   # Images, icons, fonts
```

### Key Directories

- **services/**: Contains API communication, tracking service, and network management
- **screens/**: Main application screens (Login, Dashboard, Tracking, History, etc.)
- **models/**: Data structures for API responses and local data
- **utils/**: Helper functions for storage, location sampling, session management

## Features

### Core Features
- User authentication and session management
- Real-time GPS location tracking
- Interactive duty zone mapping
- Inspection task management
- Duty history tracking
- Dark/Light theme support

### Tracking System
- Continuous background location tracking
- Foreground service for reliability
- WebSocket real-time updates
- Battery optimization
- Network status monitoring

## Configuration

The app uses environment variables for configuration via `AppConfig`:

```dart
static const String apiBaseUrl = 'https://www.rpfwcr.in/api';
static const String socketHost = 'www.rpfwcr.in';
static const int socketPort = 443;
```

These can be overridden at build time:
```bash
flutter run -d <device> \
  --dart-define=API_BASE_URL=https://your-api.com/api \
  --dart-define=SOCKET_HOST=your-socket-host.com
```

## Dependencies

### Core
- **flutter_svg**: SVG image support
- **geolocator**: Location services
- **flutter_map**: Map display
- **latlong2**: Geographic coordinates

### State Management
- **provider**: Reactive state management

### Services
- **http**: HTTP requests
- **shared_preferences**: Local storage
- **flutter_foreground_task**: Background location tracking
- **pusher_client_socket**: WebSocket communication

### UI
- **image_picker**: Photo selection
- **image_cropper**: Image editing
- **flutter_native_splash**: Splash screen
- **flutter_launcher_icons**: App icons

### System
- **battery_plus**: Battery status monitoring

## Build

### Development Build
```bash
flutter build apk --debug
```

### Release Build
```bash
flutter build apk --release
flutter build appbundle --release  # For Play Store
```

## Testing

```bash
flutter test
```

## License

Proprietary - All rights reserved

## Support

For issues and feature requests, please contact the development team.

---

**Last Updated**: 2026-05-18
