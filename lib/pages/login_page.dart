import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLogin;

  const LoginPage({
    super.key,
    required this.onLogin,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRegisterMode = false;

  static const Color bg = Color(0xFFF9FBF7);
  static const Color green = Color(0xFF0F3A1A);
  static const Color muted = Color(0xFF556353);
  static const Color cardBorder = Color(0xFFE2E8DE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: green,
                    child: Icon(Icons.eco, color: Color(0xFFB9D9B3)),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Virtual Ag Lab',
                    style: TextStyle(
                      color: green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 42),
              Text(
                isRegisterMode ? 'Buat Akun Baru' : 'Selamat Datang',
                style: const TextStyle(
                  color: green,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isRegisterMode
                    ? 'Daftar untuk mulai menyimpan progres eksperimen tanaman.'
                    : 'Masuk untuk melanjutkan simulasi agronomi digital.',
                style: const TextStyle(
                  color: muted,
                  fontSize: 14,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: cardBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    if (isRegisterMode) ...[
                      _inputField(
                        label: 'Nama',
                        hint: 'Masukkan nama Anda',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 14),
                    ],
                    _inputField(
                      label: 'Email',
                      hint: 'contoh@email.com',
                      icon: Icons.mail_outline,
                    ),
                    const SizedBox(height: 14),
                    _inputField(
                      label: 'Password',
                      hint: 'Masukkan password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: widget.onLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          isRegisterMode ? 'Daftar' : 'Masuk',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextButton(
                      onPressed: () {
                        setState(() => isRegisterMode = !isRegisterMode);
                      },
                      child: Text(
                        isRegisterMode
                            ? 'Sudah punya akun? Masuk'
                            : 'Belum punya akun? Daftar',
                        style: const TextStyle(
                          color: green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0E7),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: green),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Login masih mock untuk prototype 50%. Tidak ada backend atau database pada tahap ini.',
                        style: TextStyle(
                          color: muted,
                          fontSize: 12,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: green,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            prefixIcon: Icon(icon, color: muted),
            filled: true,
            fillColor: bg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: cardBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: cardBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: green, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
