class AppValidator {
  static String? validEmail(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validatePassword(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < 10) {
      return '$fieldName must be at least 10 Characters long';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return '$fieldName must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return '$fieldName must contain at least one number';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
      return '$fieldName must contain at least one special character';
    }

    return null;
  }

  static String? validatePhone(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    if (value.length < 11) {
      return 'Phone number must be at 11 digits';
    }
    return null;
  }

  static String? validateDate(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a date';
    }
    return null;
  }
}
