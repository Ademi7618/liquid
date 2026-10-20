
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:liquid/app/app_localizations.dart';
import 'package:liquid/app/app_localizations_delegate.dart';
import 'package:liquid/screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  void _handleLogin() {
    final t = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.translate('success_login')), backgroundColor: Colors.blueAccent),
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
          Positioned(top: 100, right: -80, child: _buildWaterBlob(250, 250, const Color(0xFF52C4FF).withOpacity(0.4))),
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
                                t.translate('login_title'),
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0D3B66)),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                t.translate('welcome'),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13, color: const Color(0xFF0D3B66).withOpacity(0.7)),
                              ),
                              const SizedBox(height: 30),
                              _buildTextField(
                                controller: _userIdController,
                                hintText: t.translate('user_id'),
                                prefixIcon: Icons.person_outline,
                                validator: (val) => val!.isEmpty ? t.translate('err_user') : null,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: _passwordController,
                                hintText: t.translate('password'),
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
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          value: _rememberMe,
                                          activeColor: const Color(0xFF0072FF),
                                          onChanged: (val) => setState(() => _rememberMe = val ?? false),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(t.translate('remember'), style: const TextStyle(fontSize: 13, color: Color(0xFF0D3B66))),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      t.translate('forgot'),
                                      style: const TextStyle(fontSize: 13, color: Color(0xFF0072FF), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
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
                                  onPressed: _handleLogin,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 24),
                                      Text(t.translate('login_btn'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.25)),
                                        child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    t.translate('no_account') + ' ',
                                    style: TextStyle(fontSize: 13, color: const Color(0xFF0D3B66).withOpacity(0.7)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                                      );
                                    },
                                    child: Text(
                                      t.translate('sign_up_link'),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF0072FF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(child: Divider(color: const Color(0xFF0D3B66).withOpacity(0.2))),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      t.translate('or'),
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF0D3B66).withOpacity(0.6)),
                                    ),
                                  ),
                                  Expanded(child: Divider(color: const Color(0xFF0D3B66).withOpacity(0.2))),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildSocialCard(Icons.g_mobiledata, Colors.red, t),
                                  const SizedBox(width: 15),
                                  _buildSocialCard(Icons.chat_bubble, Colors.indigo, t),
                                  const SizedBox(width: 15),
                                  _buildSocialCard(Icons.facebook, Colors.blue, t),
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
                      child: const Center(child: Icon(Icons.person, size: 35, color: Colors.white)),
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

  Widget _buildSocialCard(IconData icon, Color color, AppLocalizations t) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.5),
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1.5),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 26),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.translate('dev'))));
        },
      ),
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





