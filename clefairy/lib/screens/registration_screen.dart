import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'main_shell.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController(text: 'Jane Doe');
  final _aadhaarController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _aadhaarController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _signUp() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainShell(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF221019), Color(0xFF3D1A2B), Color(0xFF221019)],
          ),
        ),
        child: Stack(
          children: [
            // Gradient blobs
            Positioned(
              top: -80,
              left: -80,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primary.withOpacity(0.15),
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              right: -80,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primary.withOpacity(0.08),
                ),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Header
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                'Clefairy',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Form card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Your safety is our priority. Let's get you started.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade400,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Full Name
                            _buildLabel('FULL NAME'),
                            const SizedBox(height: 6),
                            _buildTextField(
                              controller: _nameController,
                              icon: Icons.person_outline_rounded,
                              hint: 'Jane Doe',
                            ),

                            const SizedBox(height: 16),

                            // Aadhaar Number
                            _buildLabel('AADHAAR NUMBER'),
                            const SizedBox(height: 6),
                            _buildTextField(
                              controller: _aadhaarController,
                              icon: Icons.fingerprint_rounded,
                              hint: '12-digit Aadhaar number',
                              suffix: Icon(
                                Icons.verified_user_rounded,
                                color: AppTheme.primary,
                                size: 20,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Email
                            _buildLabel('EMAIL ADDRESS'),
                            const SizedBox(height: 6),
                            _buildTextField(
                              controller: _emailController,
                              icon: Icons.email_outlined,
                              hint: 'jane@example.com',
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 16),

                            // Password
                            _buildLabel('PASSWORD'),
                            const SizedBox(height: 6),
                            _buildTextField(
                              controller: _passwordController,
                              icon: Icons.lock_outline_rounded,
                              hint: '••••••••',
                              isPassword: true,
                            ),

                            const SizedBox(height: 16),

                            // Confirm Password
                            _buildLabel('CONFIRM'),
                            const SizedBox(height: 6),
                            _buildTextField(
                              controller: _confirmController,
                              icon: Icons.lock_reset_rounded,
                              hint: '••••••••',
                              isPassword: true,
                            ),

                            const SizedBox(height: 24),

                            // Sign Up Button
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: _signUp,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 8,
                                  shadowColor:
                                      AppTheme.primary.withOpacity(0.4),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward_rounded,
                                        size: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Footer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          GestureDetector(
                            onTap: _signUp,
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                            letterSpacing: 1.5,
                            height: 1.6,
                          ),
                          children: [
                            const TextSpan(
                                text: 'BY SIGNING UP, YOU AGREE TO OUR\n'),
                            TextSpan(
                              text: 'TERMS OF SERVICE',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(text: ' AND '),
                            TextSpan(
                              text: 'PRIVACY POLICY',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade400,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool isPassword = false,
    Widget? suffix,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 20),
          suffixIcon: suffix,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
