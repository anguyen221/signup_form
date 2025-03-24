import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('First Name'),
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 10),

            const Text('Last Name'),
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 10),
            
            const Text('Email'),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),

            const Text('Contact No.'),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),

            const Text('Date of Birth'),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 10),

            const Text('Password'),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {}, 
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
