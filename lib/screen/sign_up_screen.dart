import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:liquid/app/app_localizations.dart';
import 'package:liquid/app/app_localizations_delegate.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _handleSignUp() {
    final t = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.translate('success_signup')), backgroundColor: Colors.blueAccent),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [buildLanguageDropdown()],
      ),
      body: Stack(
        children: [
          Positioned(top: -50, left: -50, child: _buildWaterBlob(180, 180, const Color(0xFF8AE9FF).withOpacity(0.5))),
          Positioned(bottom: -60, right: -60, child: _buildWaterBlob(250, 250, const Color(0xFF52C4FF).withOpacity(0.4))),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 420,
                    padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [Colors.white.withOpacity(0.7), Colors.white.withOpacity(0.3)],
                      ),
                      border: Border.all(width: 1.5, color: Colors.white.withOpacity(0.8)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1E88E5).withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                t.translate('signup_title'),
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0D3B66)),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                t.translate('signup_welcome'),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13, color: const Color(0xFF0D3B66).withOpacity(0.7)),
                              ),
                              const SizedBox(height: 30),
                              _buildTextField(
                                controller: _nameController,
                                hintText: t.translate('enter_name'),
                                prefixIcon: Icons.person_outline,
                                validator: (val) => val!.isEmpty ? t.translate('err_name') : null,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: _emailController,
                                hintText: t.translate('enter_email'),
                                prefixIcon: Icons.email_outlined,
                                validator: (val) => val!.isEmpty || !val.contains('@') ? t.translate('err_email') : null,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: _passwordController,
                                hintText: t.translate('create_password'),
                                prefixIcon: Icons.lock_outline,
                                obscureText: _obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    color: const Color(0xFF0D3B66).withOpacity(0.6),
                                    size: 20,
                                  ),
                                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                ),
                                validator: (val) => val!.isEmpty ? t.translate('err_pass') : null,
                              ),
                              const SizedBox(height: 25),
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(colors: [Color(0xFF0072FF), Color(0xFF00C6FF)]),
                                ),
                                child: ElevatedButton(
                                  onPressed: _handleSignUp,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  ),
                                  child: Text(
                                    t.translate('signup_btn'),
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    t.translate('already_have_acc') + ' ',
                                    style: TextStyle(fontSize: 13, color: const Color(0xFF0D3B66).withOpacity(0.7)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      t.translate('login_link'),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF0072FF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -35,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [Colors.white.withOpacity(0.9), const Color(0xFF0072FF).withOpacity(0.5)]),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Center(child: Icon(Icons.person_add, size: 35, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Color(0xFF0D3B66), fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: const Color(0xFF0D3B66).withOpacity(0.5), fontSize: 14),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: const Color(0xFF0D3B66).withOpacity(0.7), size: 20) : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withOpacity(0.4),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.white.withOpacity(0.6))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.white.withOpacity(0.6))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFF0072FF), width: 1.5)),
      ),
      validator: validator,
    );
  }

  Widget _buildWaterBlob(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}