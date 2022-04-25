# Simple Weather App

This is my weather app project for a coding challenge submission.

I am choosing to write in a "diary-style" voice for documentation so that you can see my thought processes on how I wrote some things. There is some overall information here in the README as well as some comments in each file. This project was written in Flutter 2.10.4 and tested on a Pixel_3a_XL android emulator. I do not own a personal iOS device so I was unable to run and test it on iOS. This app may only run successfully on Android.

## Project Requirements
I was given three user requirements for this project. 

As a user, I should be able to:
- Search for a location and see the weather forecast for that location
- Toggle between the metric and imperial system when displaying units
- Refresh the weather for the selected location
- The app should pull weather data from https://www.metaweather.com/api/

## How To Run The App
Assuming that Flutter is installed and all checks for `flutter doctor` have passed, here are some directions for running the app.

**Using Visual Studio Code:**
1. Clone this repository to your local machine.
2. Open the project folder in Visual Studio Code.
3. In the lower right area of Visual Studio Code, select the device you want this app to run on.
4. Run the app from the menu using Run > Start Debugging or press F5.

**Using Android Studio**
1. Clone this repository to your local machine.
2. Open the project folder in Android Studio.
3. In the upper toolbar of Android Studio, select the device you want this app to run on from the dropdown menu.
4. The main.dart configuration should be selected by default. If not, make sure it is selected.
5. Run the app by pressing the green play button or from the menu using Run > Run 'main.dart'

**Using the command line:**
1. Clone this repository to your local machine.
2. Navigate to the project folder using `cd`
3. Check that your device is connected using `flutter devices`
4. Run the app using `flutter run`
```
$ cd very_good_weather
$ flutter devices
$ flutter run
```

## Packages
The following external packages were used:
- [http](https://pub.dev/packages/http) - a library for making HTTP requests.
- [intl](https://pub.dev/packages/intl) - used for DateTime parsing and formatting.
- [rxdart](https://pub.dev/packages/rxdart) - extends the capabilities of streams, which are used for BLoC.
- [shared_preferences](https://pub.dev/packages/shared_preferences) - used for storing key-value pair data on the device.

## Developer Notes
Most of the Flutter projects I have worked on were written during the "ancient times" of Flutter--before null-safety existed and before flutter_bloc became popular, so I apologize for any null-safety violations and any use of nullable types. I am most familiar with implementing BLoC using RxDart, so that is what I used for this project.
