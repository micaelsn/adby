import 'package:flutter/material.dart';

import '../../core/database/localstorage.dart';

class SignupController {
  final LocalStorage localStorage;

  SignupController({required this.localStorage});

  ValueNotifier<bool> isSending = ValueNotifier(false);

  ValueNotifier<String?> nameError = ValueNotifier(null);
  ValueNotifier<String?> emailError = ValueNotifier(null);
  ValueNotifier<String?> phoneError = ValueNotifier(null);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  static const String errorMessage = "This field is required.";

  sendValidate({String? name, String? email, String? phone}) {
    if (name != null) {
      nameError.value = name.isEmpty ? errorMessage : null;
    }
    if (email != null) {
      emailError.value = email.isEmpty ? errorMessage : null;
    }
    if (phone != null) {
      phoneError.value =
          phone.isEmpty || phone.length < 11 ? errorMessage : null;
    }
  }

  send() async {
    isSending.value = true;
    sendValidate(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );
    if (fieldsIsValid) {
      await localStorage.insert('signup', {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
      });
    }
    isSending.value = false;
  }

  bool get fieldsIsValid =>
      nameError.value == null &&
      emailError.value == null &&
      phoneError.value == null;
}
