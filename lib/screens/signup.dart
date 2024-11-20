import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/images/', // Replace with your background image path
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // Form Content with Semi-Transparent Background
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 252, 249, 249).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.9, // 90% width
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 8, 8),
                        
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Full Name
                          TextFormField(
                            controller: _nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration("Full Name"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),

                          // Email
                          TextFormField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration("Email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),

                          // Password
                          TextFormField(
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration("Password"),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),

                          // Confirm Password
                          TextFormField(
                            controller: _confirmPasswordController,
                            style: const TextStyle(color: Color.fromARGB(255, 10, 8, 8)),
                            decoration: _inputDecoration("Confirm Password"),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Sign Up Button
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Perform sign-up logic here
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Sign Up Successful')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 7, 0, 0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Terms and Privacy Policy Notice
                          const Text(
                            "By signing up, you agree to our Terms and Privacy Policy.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(179, 10, 1, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Input Decoration Helper
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 2, 2)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 7, 5, 5)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 70, 184, 79)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
