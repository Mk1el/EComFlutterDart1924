import 'package:intl/intl.dart';

class TFormatter {
  TFormatter._();

  static String formatDate(DateTime? date) {
    final DateTime formattedDate = date ?? DateTime.now();
    return DateFormat('dd-MM-yyyy').format(formattedDate);
  }

  static String formatDateTime(DateTime? date) {
    final DateTime formattedDate = date ?? DateTime.now();
    return DateFormat('dd-MM-yyyy HH:mm').format(formattedDate);
  }

 
  static bool isValidPhoneNumber(String phone) {
    final String cleaned = phone.replaceAll(RegExp(r'\s+'), '');
    // 0712345678
    // +254712345678
    // 254712345678
    final RegExp regex = RegExp(
      r'^(?:\+?\d{1,3})?[0-9]{9,12}$',
    );

    return regex.hasMatch(cleaned);
  }

  /// Formats phone number to international format
  /// Default country code: +254 (Kenya)
  static String formatPhoneNumber(
    String phone, {
    String countryCode = '+254',
  }) {
    String cleaned = phone.replaceAll(RegExp(r'\D'), '');

    if (cleaned.startsWith('0')) {
      cleaned = cleaned.substring(1);
    }

    if (cleaned.startsWith(countryCode.replaceAll('+', ''))) {
      return '+$cleaned';
    }

    return '$countryCode$cleaned';
  }
}
