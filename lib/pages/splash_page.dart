import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final VoidCallback onContinue;

  const SplashPage({
    super.key,
    required this.onContinue,
  });

  static const Color bg = Color(0xFFF9FBF7);
  static const Color green = Color(0xFF0F3A1A);
  static const Color muted = Color(0xFF556353);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF0E7),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.eco, color: green, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Virtual Ag Lab',
                        style: TextStyle(
                          color: green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 210,
                height: 210,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0E7),
                  borderRadius: BorderRadius.circular(44),
                  boxShadow: [
                    BoxShadow(
                      color: green.withValues(alpha: 0.14),
                      blurRadius: 28,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 146,
                      height: 146,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    const Icon(
                      Icons.biotech,
                      color: Color(0xFFB9D9B3),
                      size: 82,
                    ),
                    Positioned(
                      right: 28,
                      bottom: 30,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFD4A373),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.spa, color: Colors.white, size: 24),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'Eksperimen Agronomi Digital',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: green,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Pelajari komoditas tanaman, jalankan simulasi lingkungan, dan pahami rekomendasi pemulihan melalui prototype pembelajaran interaktif.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: muted,
                  fontSize: 14,
                  height: 1.55,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Mulai Belajar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Prototype 50% - simulation learning flow',
                style: TextStyle(
                  color: muted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
