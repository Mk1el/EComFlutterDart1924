class TPricingCalculator {
  TPricingCalculator._();

  /// Kenya VAT rate (16%) – VAT is INCLUDED in product price
  static const double _vatRate = 0.16;

  /// Calculates TOTAL price = product price (VAT inclusive) + transport fee
  static double calculateTotalPrice(
    double productPrice,
    String location,
  ) {
    final double transportFee = _getTransportFee(location);
    final double total = productPrice + transportFee;

    return double.parse(total.toStringAsFixed(2));
  }

  /// Extracts VAT from a VAT-INCLUSIVE price
  /// Formula: VAT = price × 16 / 116
  static double extractVat(double vatInclusivePrice) {
    final double vat = vatInclusivePrice * _vatRate / (1 + _vatRate);
    return double.parse(vat.toStringAsFixed(2));
  }

  /// Net price (price without VAT)
  static double netPrice(double vatInclusivePrice) {
    final double net = vatInclusivePrice - extractVat(vatInclusivePrice);
    return double.parse(net.toStringAsFixed(2));
  }

  /// Transport fee by location (Kenya)
  static double _getTransportFee(String location) {
    switch (location.toLowerCase()) {
      case 'nairobi':
        return 200;
      case 'mombasa':
        return 350;
      case 'kisumu':
        return 300;
      case 'nakuru':
        return 250;
      case 'eldoret':
        return 300;

      // Other towns / upcountry
      default:
        return 400;
    }
  }
}
