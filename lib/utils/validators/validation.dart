class TValidators {
  TValidators._();

   /// Validates standard email format
  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
    );
    return regex.hasMatch(email.trim());
  }

  /// Password rules:
  /// - Minimum 8 characters
  static bool isValidPassword(String password) {
    return password.trim().length >= 8;
  }


  /// 0712345678
  /// 0112345678
  /// +254712345678
  /// 254712345678
  static bool isValidKenyanPhone(String phone) {
    final String cleaned = phone.replaceAll(RegExp(r'\s+'), '');

    final RegExp regex = RegExp(
      r'^(?:\+254|254|0)(7|1)\d{8}$',
    );

    return regex.hasMatch(cleaned);
  }

  
  /// Formats phone to +2547XXXXXXXX
  static String formatKenyanPhone(String phone) {
    String cleaned = phone.replaceAll(RegExp(r'\D'), '');

    if (cleaned.startsWith('0')) {
      cleaned = cleaned.substring(1);
    }

    if (cleaned.startsWith('254')) {
      cleaned = cleaned.substring(3);
    }

    return '+254$cleaned';
  }
}
