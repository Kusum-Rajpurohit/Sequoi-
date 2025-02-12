import 'dart:ui'; // Import for blur effect
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'page_two.dart';

// Theme Colors (Updated)
const kPrimaryColor = Color(0xFF102A5C); // Dark Midnight Blue
const kBackgroundColor = Color(0xFF0A0A0A); // Darkest shade
const kCardBackgroundColor = Color(0xFF1E1E1E); // Soft dark gray
const kTextColor = Color(0xFFEAEAEA); // Off-white for readability
const kSecondaryTextColor = Color(0xFFB0B0B0); // Subtle gray
const kBorderColor = Color(0xFF2C2C2C); // Gentle borders

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.4, -0.6), // Soft glow position
            radius: 1.4,
            colors: [
              Color(0xFF04619F), // *Deep Cyan-Blue (Vibrant but not too bright)*
              Color(0xFF3D2C8D), // *Subtle Purple (Adds richness)*
              Color(0xFF1B1F3B), // *Deep Navy Blue (Strong base)*
              Color(0xFF0A0A0A), // *Vintage Black (Dark & elegant)*
            ],
            stops: [0.1, 0.3, 0.7, 1.0],
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Rounded corners
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // Frosted glass effect
                child: Container(
                  width: screenWidth * 0.35,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: kCardBackgroundColor.withOpacity(0.5), // More translucent effect
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)), // Subtle Border
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor.withOpacity(0.3), // Soft Neon Glow
                        blurRadius: 30,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Welcome Text
                      const Text(
                        'Welcome!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Email Field
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(color: kTextColor),
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: const TextStyle(color: kSecondaryTextColor),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: kBorderColor.withOpacity(0.6)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(color: kTextColor),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: kSecondaryTextColor),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: kBorderColor.withOpacity(0.6)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PageTwo()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 8,
                          shadowColor: kPrimaryColor.withOpacity(0.5),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Sign Up Button
                      OutlinedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "Feature Coming Soon!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: kTextColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: kPrimaryColor.withOpacity(0.7)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}