import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;

  const ConfirmationPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, $firstName $lastName!", style: const TextStyle(fontSize: 20)),
            Text("Your email: $email"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to Signup"),
            ),
          ],
        ),
      ),
    );
  }
}