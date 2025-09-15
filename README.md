# Tally App ( Geny Interview Task App )
A Flutter mini-app showcasing a list of businesses with search and detail screens. Built with Provider state management, Dio networking, and a reusable, composable BusinessCard widget. Designed to be flexible, testable, and offline-capable.

Business Page



https://github.com/user-attachments/assets/65d0572a-8590-45e6-8a79-33881cdbdeb3




## 📌 Demo Video
 
The full video is too large to upload here.  
Copy the link below into your browser to watch the full demo video:

```bash
https://drive.google.com/file/d/1774TuXntoFmzWI4hQsDLuidoR5dLRzak/view?usp=sharing
```
In the demo, I showcased:

- Server error simulation  
- Retry button test  
- Real-time business search filtering  
- Smooth navigation to detail screen on BusinessCard tap



## 🚀 Getting Started

### 📦 Installation

**Clone the Repository**

```bash
git clone git@github.com:jmcfx/tally-task-app.git

cd tally-task-app
```

### 🚀 Steps to Run




#### 1. 🔧 Set Up Dependencies and Generate Code ‼️

Run the following to clean the project, install dependencies, generate localization and `build_runner` outputs (e.g., `freezed`, `json_serializable`):
```bash
make fresh
``` 
This will run the following commands:


-   `flutter clean` – Resets the build directory
-   `flutter pub get` – Fetches dependencies
-   `dart run build_runner build -d` – Generates `freezed`, `json_serializable`

#### 2. 🚀 Run the app on a connected device or emulator ‼️

```bash
flutter run
```

#### 3. 🔄 Regenerate Code Only

If you just need to regenerate code (e.g., after editing models or annotations):

```bash
make runner
```

> Runs `dart run build_runner build -d`

#### 4. 👀 Watch for File Changes

Automatically regenerates code on file changes during development:
```bash
make watch
```

> Runs `dart run build_runner watch -d`

#### 5. 📦 Build APK (for Android)

To create an APK:
```bash
make apk
``` 

> Equivalent to:  
> `flutter clean && flutter build apk`


## Folder Structure :open_file_folder:

```
lib/
├── app/
├── core/
│   ├── errors/
│   ├── network/
│   └── utils/
├── di/
├── features/
│   ├── search/
│   │   ├── data/
│   │   │   ├── client/
│   │   │   ├── data_sources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── use_cases/
│   │   └── presentation/
│   │       ├── provider/
│   │       ├── pages/
│   │       └── widgets/
```

## ✨ Features

- 🧼 Clean Architecture  
- 🔎 Search businesses with real-time filtering  
- 📝 Business Detail Page – View full details of each business including location and contact.  
- 🧩 Reusable BusinessCard widget – Built using composition for flexible layouts, making it easy to adapt for other models like services.  
- 💾 Local persistence / Offline support – Businesses remain visible even without an internet connection after the first load.  
- ⚡ Clear loading, empty, error, and retry states – Improves UX with proper state handling.  
- 🛠 Normalized messy API keys into a clean domain model – Ensures data consistency and validation.  
- 📱 Responsive and clean UI – Works on multiple screen sizes with proper padding and spacing.  
- 🔗 Easy navigation – Tap a business card to navigate to its detail page.  
- 🔄 Extensible & testable architecture – Designed with Provider and clean layers for maintainability and testing.  
- 🌐 Mock API with Dio Interceptor – Local JSON served through a custom Dio interceptor, simulating real API requests/responses and enabling error state testing.  


## 📦 Dependencies

- **flutter** – The core Flutter SDK used to build cross-platform apps.
- **cupertino_icons** – Provides iOS-style icons for your Flutter app.
- **dartz** – Functional programming tools for Dart (e.g., Either, Option types).
- **equatable** – Simplifies value comparison in Dart classes, useful for state management.
- **dio** – A powerful HTTP client with interceptors and cancellation support.
- **freezed_annotation** – For generating immutable data classes with `freezed`.
- **json_annotation** – Provides annotations for JSON serialization with `json_serializable`.
- **retrofit** – Type-safe HTTP client generator inspired by Retrofit.
- **dev** – Utilities for development (ensure usage).
- **get_it** – Lightweight service locator for dependency injection.
- **shared_preferences** – Simple key-value storage for persisting data locally.
- **internet_connection_checker** – Checks internet connectivity status.
- **provider** – State management solution using the Provider pattern.

### Dev Dependencies

- **flutter_test** – Flutter's built-in testing framework.
- **flutter_lints** – Lint rules for Flutter projects.
- **build_runner** – Runs code generation tools like `freezed` or `json_serializable`.
- **freezed** – Code generator for immutable classes and unions/sealed classes.
- **json_serializable** – Generates JSON serialization logic for annotated models.
- **retrofit_generator** – Generates Retrofit API client code from annotations.
