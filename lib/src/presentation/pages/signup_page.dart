import 'package:defasio1_adby/src/core/database/localstorage.dart';
import 'package:flutter/material.dart';

import '../controllers/signup_controller.dart';
import '../widgets/button_widget.dart';
import '../widgets/form_field_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    initPage();
    super.initState();
  }

  initPage() {
    final LocalStorage localStorage = HiveLocalStorage();
    controller = SignupController(localStorage: localStorage);
  }

  late SignupController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.change_circle_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ValueListenableBuilder<String?>(
              valueListenable: controller.nameError,
              builder: (_, value, w) {
                return FormFieldWidget(
                  hint: 'Name',
                  label: 'Name',
                  controller: controller.nameController,
                  errorText: value,
                  onChanged: (text) => controller.sendValidate(name: text),
                );
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder<String?>(
              valueListenable: controller.emailError,
              builder: (_, value, w) {
                return FormFieldWidget(
                  hint: 'E-mail',
                  label: 'E-mail',
                  controller: controller.emailController,
                  errorText: value,
                  onChanged: (text) => controller.sendValidate(email: text),
                );
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder<String?>(
              valueListenable: controller.phoneError,
              builder: (_, value, w) {
                return FormFieldWidget(
                  hint: 'Phone',
                  label: 'Phone',
                  controller: controller.phoneController,
                  errorText: value,
                  onChanged: (text) => controller.sendValidate(phone: text),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder<bool>(
            valueListenable: controller.isSending,
            builder: (_, value, w) {
              return ButtonWidget(
                title: "Send",
                isLoading: value,
                onPressed: controller.send,
              );
            }),
      ),
    );
  }
}
