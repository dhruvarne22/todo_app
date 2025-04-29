# 📝 ToDo App (Flutter + Sqflite)

A simple yet powerful ToDo application built using **Flutter** with **Sqflite** as the local database. The project is structured using the **MVC architecture** to ensure scalability and maintainability.

## 📱 Features

- ✅ Add new tasks
- 📝 Edit existing tasks
- 🗑️ Delete tasks
- 📁 Save tasks locally using SQLite
- 📦 Clean MVC architecture

## 📂 Project Structure (MVC)

```
lib/
├── controller/
│   └── todo_controller.dart
|   └── database_helper.dart
├── model/
│   └── task.dart
├── view/
│   ├── home_screen.dart
│   └── add_task_screen.dart
└── main.dart
```

## 🛠️ Tech Stack

- **Flutter** – UI toolkit
- **Sqflite** – Local storage (SQLite plugin for Flutter)
- **Path Provider** – To locate the database path
- **MVC Architecture** – For clean separation of concerns

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/dhruvarne22/todo_app
cd todo
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.9.1
```

> Make sure to run `flutter pub get` after editing `pubspec.yaml`.


## 🤝 Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.