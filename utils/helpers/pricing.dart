class CPriceCalculatorHelper {
  /// Base fare when a ride starts
  static const double baseFare = 3.0;

  /// Cost per kilometer
  static const double costPerKm = 1.5;

  /// Cost per minute
  static const double costPerMinute = 0.2;

  /// Fixed booking fee (optional)
  static const double bookingFee = 1.0;

  /// Calculate total price
  static double calculatePrice({
    required double distanceInKm,
    required double durationInMinutes,
    double surgeMultiplier = 1.0,
  }) {
    final distanceCost = distanceInKm * costPerKm;
    final timeCost = durationInMinutes * costPerMinute;
    double total = baseFare + distanceCost + timeCost + bookingFee;

    // Apply surge pricing if any
    total *= surgeMultiplier;

    return double.parse(total.toStringAsFixed(2)); // Round to 2 decimal places
  }
}

// void main() {
//   double distance = 12.5; // kilometers
//   double duration = 25; // minutes
//   double surge = 1.2; // 20% surge pricing

//   double totalFare = PriceCalculatorHelper.calculatePrice(
//     distanceInKm: distance,
//     durationInMinutes: duration,
//     surgeMultiplier: surge,
//   );

//   print('Total Fare: \$${totalFare}');
// }

