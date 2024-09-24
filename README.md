
# Flutter Pagination and Clean Architecture Project

This project demonstrates efficient pagination techniques and clean architecture principles in Flutter. It showcases how to handle large datasets and fetch data efficiently from the backend.

## Features
- **Pagination**: Efficiently load large data sets in smaller chunks.
- **Clean Architecture**: Structured, maintainable codebase adhering to clean architecture principles.
- **Backend Integration**: Connect seamlessly with a PHP/Laravel backend to fetch data.

## Getting Started

### Prerequisites
Ensure you have the following installed:
- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **PHP and Laravel**: [Install Laravel](https://laravel.com/docs/8.x/installation)

### Running the Project

Follow these steps to get the project up and running:

1. **Start the Backend Server**
    ```bash
    php artisan serve
    ```
2. **Build and Run the Flutter App**
    Use your preferred IDE (VSCode, Android Studio, etc.) or run:
    ```bash
    flutter run
    ```

### Testing on a Physical Device
If you're testing on a real mobile device, follow these additional steps:

1. **Run Laravel on Local Network**
    Start the Laravel server, making it accessible on your local network:
    ```bash
    php artisan serve --host 0.0.0.0 --port 8000
    ```
2. **Update Mobile App Constants**
    Replace the backend URL in the mobile app constants with your machine's local IP address.

    Example:
    ```dart
    const String BASE_URL = 'http://YOUR_LOCAL_IP:8000';
    ```

    Find your local IP address:
    - On macOS or Linux: Run `ifconfig` in your terminal.
    - On Windows: Run `ipconfig` in Command Prompt.

## Project Structure
The project is organized following clean architecture principles:
- **Data Layer**: Handles API requests and data manipulation.
- **Domain Layer**: Defines business logic and core use cases.
- **Presentation Layer**: Flutter UI and state management.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for more details.
