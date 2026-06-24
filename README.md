# Corporate Procurement

## Features

- Authentication
- Dashboard
- Procurement
- Approvals
- Assets
- Offline Storage
- Push Notifications

## Tech Stack

- Flutter
- Riverpod
- Hive
- Dio
- GoRouter
- Firebase Messaging

## Architecture

Clean Architecture

Presentation
→ Provider
→ Repository
→ Data Source
→ API


Push Notification Architecture

Firebase Cloud Messaging (FCM) integration structure has been implemented.

Notification Service, route handling, and deep-link navigation are prepared.

Firebase initialization is currently disabled in the demo build to avoid environment-specific configuration dependencies.

The application is ready for production FCM integration by enabling Firebase initialization and configuring platform-specific credentials.
## Setup

flutter pub get

flutter run

## Test

flutter test



Presentation Layer
│
├── Screens
├── Widgets
└── Providers
│
▼
Domain Layer
│
├── Repository Contracts
└── Use Cases
│
▼
Data Layer
│
├── Repository Impl
├── Remote Data Source
└── Local Data Source
│
▼
API / Hive



UI
│
▼
Riverpod Provider
│
▼
Repository
│
├── Remote Source (Dio)
│
└── Local Source (Hive)
│
▼
Response
│
▼
State Update
│
▼
UI Refresh# corporate-procurement
