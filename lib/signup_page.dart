import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'dart:developer';
import 'confirmation_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _submitForm() {
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState!.value;
      log('Form Submitted: $formData');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationPage(
            firstName: formData['first_name'] ?? '',
            lastName: formData['last_name'] ?? '',
            email: formData['email'] ?? '',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('First Name'),
              FormBuilderTextField(
                name: 'first_name',
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 10),

              const Text('Last Name'),
              FormBuilderTextField(
                name: 'last_name',
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 10),

              const Text('Email'),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  final emailRegex =
                      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  return emailRegex.hasMatch(value)
                      ? null
                      : 'Enter a valid email';
                },
              ),
              const SizedBox(height: 10),

              const Text('Contact No.'),
              FormBuilderTextField(
                name: 'contact_no',
                decoration: const InputDecoration(border: OutlineInputBorder()),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  final phoneRegex = RegExp(r'^\d{10}$');
                  return phoneRegex.hasMatch(value)
                      ? null
                      : 'Enter a valid 10-digit phone number';
                },
              ),
              const SizedBox(height: 10),

              const Text('Date of Birth'),
              FormBuilderDateTimePicker(
                name: 'dob',
                inputType: InputType.date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                format: DateFormat('MM-dd-yy'),
                validator: (value) =>
                    (value == null) ? 'Select your date of birth' : null,
              ),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
