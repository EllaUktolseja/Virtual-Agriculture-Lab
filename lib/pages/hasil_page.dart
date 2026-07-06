import 'package:flutter/material.dart';

class HasilSimulasiPage extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onRestart;

  const HasilSimulasiPage({
    super.key, 
    required this.onBack, 
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F3A1A)),
          onPressed: onBack,
        ),
        title: const Text(
          'Virtual Ag Lab',
          style: TextStyle(color: Color(0xFF0F3A1A), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color(0xFF0F3A1A)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumbs text
            const Text(
              'Simulasi  >  Jagung Hibrida',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            const Text(
              'Hasil Simulasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A)),
            ),
            const SizedBox(height: 16),

            // Header Banner: Simulasi Selesai
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2E5A36),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check_circle_outline, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Simulasi Selesai',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Siklus 90 hari telah dirender dan dianalisis secara menyeluruh.',
                          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Proyeksi Pertumbuhan (Card Grafik Placeholder)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8DE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Proyeksi Pertumbuhan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A)),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Perbandingan tinggi tanaman terhadap waktu (H0 - H90)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: const BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    onPressed: () {},
                    icon: const Text('Bandingkan', style: TextStyle(fontSize: 12)),
                    label: const Icon(Icons.keyboard_arrow_down, size: 16),
                  ),
                  const SizedBox(height: 20),
                  // Placeholder Area Grafik
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: Icon(Icons.show_chart, size: 80, color: Colors.grey.shade300),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Legenda Grafik
                  const Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.brown),
                      SizedBox(width: 6),
                      Text('Hasil Aktual', style: TextStyle(fontSize: 12, color: Colors.black54)),
                      SizedBox(width: 20),
                      Icon(Icons.square, size: 10, color: Colors.black12),
                      SizedBox(width: 6),
                      Text('Zona Optimal Pertumbuhan', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Analisis Lingkungan (Warning Card)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCEAE6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Color(0xFFC0392B)),
                      SizedBox(width: 8),
                      Text(
                        'Analisis Lingkungan',
                        style: TextStyle(color: Color(0xFFC0392B), fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text.rich(
                    TextSpan(
                      text: 'Pertumbuhan ',
                      style: TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
                      children: [
                        TextSpan(text: 'Zea Mays', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' terhambat karena kondisi pH tanah yang terlalu asam '),
                        TextSpan(text: '(4.5).', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Inner Box: Rekomendasi
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF2F0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REKOMENDASI',
                          style: TextStyle(color: Color(0xFFC0392B), fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0.5),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Lakukan pengapuran dengan dolomit untuk menaikkan pH. pH rendah memicu toksisitas aluminium dan menghambat serapan hara (N & P).',
                          style: TextStyle(color: Colors.black87, fontSize: 12, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Badges
                  Row(
                    children: [
                      _buildMiniBadge('pH 4.5 Kritis', const Color(0xFFFFF0EE), const Color(0xFFC0392B)),
                      const SizedBox(width: 8),
                      _buildMiniBadge('Varietas: Jagung Hibrida', Colors.white, Colors.black54),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Button Buka AR Viewer
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F3A1A),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
              onPressed: () {},
              icon: const Icon(Icons.view_in_ar, color: Colors.white),
              label: const Text('Buka AR Viewer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 28),

            // Indikator Vital Section
            const Text(
              'Indikator Vital',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A)),
            ),
            const SizedBox(height: 12),
            
            // Grid Indikator (Kesehatan, Estimasi Panen, Efisiensi Air)
            Row(
              children: [
                Expanded(child: _buildVitalCard('Kesehatan', child: const Icon(Icons.favorite, color: Colors.red, size: 40))),
                const SizedBox(width: 12),
                Expanded(child: _buildVitalCard('Estimasi Panen', child: _buildCircularIndicator(0.42, '42%', Colors.brown))),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildVitalCard('Efisiensi Air', child: _buildCircularIndicator(0.85, '85%', const Color(0xFF0F3A1A)))),
                const SizedBox(width: 12),
                const Expanded(child: SizedBox()), // Kosong agar simetris sesuai gambar grid bawahnya ganjil
              ],
            ),
            const SizedBox(height: 32),

            // Action Buttons Bawah
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF0F3A1A),
                side: const BorderSide(color: Color(0xFF0F3A1A)),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Unduh Laporan PDF', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F3A1A),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
              onPressed: onRestart,
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text('Mulai Simulasi Baru', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget: Badge kecil di dalam kartu warning
  Widget _buildMiniBadge(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12, width: 0.5),
      ),
      child: Text(label, style: TextStyle(fontSize: 11, color: textColor, fontWeight: FontWeight.w500)),
    );
  }

  // Helper Widget: Card untuk Indikator Vital
  Widget _buildVitalCard(String title, {required Widget child}) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8DE)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: child)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Helper Widget: Lingkaran Progres Persentase (42% & 85%)
  Widget _buildCircularIndicator(double value, String percentage, Color color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 6,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        Text(
          percentage,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }
}