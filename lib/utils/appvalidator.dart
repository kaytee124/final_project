class Appvalidator {
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }

    // Remove any whitespace or special characters
    final cleanedValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedValue.length == 10) {
      if (!cleanedValue.startsWith('0')) {
        return '10-digit number must start with 0';
      }
    } else if (cleanedValue.length == 12) {
      if (!cleanedValue.startsWith('233')) {
        return '12-digit number must start with 233';
      }
    } else {
      return 'Phone number must be 10 digits (starting with 0) or 12 digits (starting with 233)';
    }

    // Check if all characters are digits
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanedValue)) {
      return 'Phone number can only contain digits';
    }

    return null; // Return null if validation passes
  }

  String? validateusername(value) {
    if (value!.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  String? isEmptyCheck(value) {
    if (value!.isEmpty) {
      return 'Please fill details';
    }
    return null;
  }
}
