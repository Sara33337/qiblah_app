# Qiblah Application

The Qiblah Application is a Flutter-based mobile app designed to help Muslims determine the Qiblah direction for prayer and access daily prayer times. It offers a simple, user-friendly interface with advanced features like compass-based Qiblah direction and animated guidance.

---

## Features

- **Qiblah Compass**: Real-time, animated compass showing the Qiblah direction.
- **Prayer Times**: Displays daily prayer times based on the user's location.
- **Location Detection**: Automatically detects the user's location to fetch accurate data.
- **Drawer Navigation**: Provides easy access to key app features.
- **Permission Handling**: Ensures location permissions are handled efficiently.

---

## Screens

### Home Screen
- Displays the user's current location.
- Shows a countdown to the next prayer.
- Lists all prayer times for the day.

### Qiblah Screen
- Features a compass to indicate the Qiblah direction.
- Displays the angle in degrees relative to the north.
- Provides an animated visualization of the Qiblah direction.

---

## Getting Started

### Prerequisites
- Flutter SDK installed.
- Dart >= 2.17.0.
- Android Studio or Visual Studio Code (optional).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/qiblah_application.git
   ```
2. Navigate to the project directory:
   ```bash
   cd qiblah_application
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## Dependencies

| Dependency                  | Purpose                                                |
|-----------------------------|--------------------------------------------------------|
| `flutter_qiblah`            | Provides Qiblah direction calculations and streams.    |
| `flutter_screenutil`        | Ensures responsive UI across various screen sizes.     |
| `permission_handler`        | Handles runtime permissions for location services.     |
| `flutter_bloc`              | Manages state efficiently across the app.              |

---

## File Structure

```
lib/
|-- core/
|   |-- appStyle/               # Custom text styles
|   |-- widgets/                # Reusable UI components
|
|-- features/
|   |-- home/
|   |   |-- logic/             # Business logic (Cubit)
|   |   |-- presentation/      # Home Screen UI
|   |-- qiblah/
|       |-- presentation/      # Qiblah Screen UI
|
|-- main.dart                   # App entry point
```

---

## Future Enhancements

- Add multi-language support for better accessibility.
- Integrate notifications for upcoming prayer times.
- Provide offline functionality for prayer schedules.
- Introduce a dark mode for better usability.

---

## Contributing

We welcome contributions! Follow these steps:
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add a new feature"
   ```
4. Push to your branch:
   ```bash
   git push origin feature-name
   ```
5. Submit a pull request.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Contact

For questions or suggestions, please contact:
- **Name**: Sara Abdo Abosobh
- **Email**: saraabosobh963@gmail.com

---
