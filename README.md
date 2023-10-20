# Firebase Phone Authentication with BLoC

## About

This project demonstrates the use of Firebase's phone authentication feature combined with the BLoC (Business Logic Component) pattern for state management in Flutter. It's meant for educational purposes and to serve as a starting point for developers interested in implementing such a feature in their apps.

## Features

- User registration via phone number.
- OTP (One-Time Password) verification.
- BLoC pattern for clean and efficient state management.

## Getting Started

### Prerequisites

- Flutter SDK
- Firebase account

### Setup

1. Clone this repository:

https://github.com/Holy-Morphism/auth-bloc-phone.git

2. Navigate to the project directory and install dependencies:

cd auth-bloc-phone && flutter pub get

3. Setup Firebase:

- Go to the [Firebase Console](https://console.firebase.google.com/).
- Create a new project (or select an existing one).
- Add your app to the project.
- Enable phone authentication in the Firebase Authentication section.
- Download the `google-services.json` file and place it in the `android/app` directory of your project.

4. Run the app:

## Usage

1. Launch the app.
2. Enter your phone number.
3. Receive and input the OTP sent to your phone.
4. View the authenticated user screen upon successful verification.

### Note

Phone number sign-in is only available for use on real devices and the web.
To test your authentication flow on device emulators, please see Testing.

## Contributing

Feel free to fork the repository, make changes, and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- Firebase for providing authentication services.
- BLoC package for enabling efficient state management in Flutter.
