/// This is a class containing some helper methods for unit conversions
/// between metric and imperial units. I did not need to use all of these methods, 
/// but I wanted to write out the conversions for both directions.

class UnitConversionHelper {
  static double convertFahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * (5 / 9);
  }

  static double convertCelsiusToFahrenheit(double celcius) {
    return (celcius * (9 / 5) + 32);
  }

  static double convertMileToKilometer(double mile) {
    return mile * 1.609;
  }

  static double convertKilometerToMile(double kilometer) {
    return kilometer * 0.621;
  }
}