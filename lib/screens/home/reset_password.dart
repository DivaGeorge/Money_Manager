import 'package:flutter/material.dart';
import 'package:money_manager/screens/home/login_page.dart';
import 'package:money_manager/screens/home/widgets/reset_form.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200), // SizedBox
            const Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ), // Text
            const SizedBox(height: 5), // SizedBox
            const Text(
              'Please enter your email address',
            ), // Text
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ResetForm(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: const Text('Reset Password'),
            )
          ], // Column children
        ),
      ),
    );
  }
}
