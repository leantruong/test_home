
# Flutter Clean Architecture with Riverpod

A Flutter app that uses the "https://fakerapi.it/en".

### Features
- Fetch person list
- Detail person info

### What is used in this project?

- **Riverpod**
  Used for state management
- **Freezed**
  Code generation

- **Dartz**
  Functional Programming `Either<Left,Right>`
- **Auto Route**
  Navigation package that uses code generation to simplify route setup
- **Dio**
  Http client for dart. Supports interceptors and global configurations
- **Shared Preferences**
  Persistent storage for simple data
- **Flutter and Dart**
  And obviously flutter and dart 😅

### Project Description

#### Data

The data layer is the outermost layer of the application and is responsible for communicating with the server-side or a local database and data management logic. It also contains repository implementations.

##### a. Data Source

Describes the process of acquiring and updating the data.
Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. At the same time, local Data sources will cache or persist data.

##### b. Repository

The bridge between the Data layer and the Domain layer.
Actual implementations of the repositories in the Domain layer. Repositories are responsible for coordinating data from the different Data Sources.

#### Domain

The domain layer is responsible for all the business logic. It is written purely in Dart without flutter elements because the domain should only be concerned with the business logic of the application, not with the implementation details.

##### a. Providers

Describes the logic processing required for the application.
Communicates directly with the repositories.

##### b. Repositories

Abstract classes that define the expected functionality of outer layers.

#### Presentation

The presentation layer is the most framework-dependent layer. It is responsible for all the UI and handling the events in the UI. It does not contain any business logic.

##### a. Widget (Screens/Views)

Widgets notify the events and listen to the states emitted from the `StateNotifierProvider`.

##### b. Providers

Describes the logic processing required for the presentation.
Communicates directly with the `Providers` from the domain layer.

### Project Description

- `main.dart` file has services initialization code and wraps the root `MyApp` with a `ProviderScope`
- `main/app.dart` has the root `MaterialApp` and initializes `AppRouter` to handle the route throughout the application.
- `services` abstract app-level services with their implementations.
- The `shared` folder contains code shared across features
  - `theme` contains general styles (colors, themes & text styles)
  - `model` contains all the Data models needed in the application.
  - `http` is implemented with Dio.
  - `storage` is implemented with SharedPreferences.
  - Service locator pattern and Riverpod are used to abstract services when used in other layers.

### Run this project

##### Go to the project directory

` cd test_home`

##### Get all the packages

`flutter pub get`

##### Run the build runner command

` flutter packages pub run build_runner watch --delete-conflicting-outputs `

##### Run the project

`flutter run` or simply press ` F5 key` if you are using VSCode

