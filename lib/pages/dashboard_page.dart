import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final VoidCallback onStartExperiment;
  const DashboardPage({super.key, required this.onStartExperiment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF7),
        elevation: 0,
        title: const Text(
          'Virtual Ag Lab',
          style: TextStyle(color: Color(0xFF0F3A1A), fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE5EAE2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.cloud_off, size: 16, color: Color(0xFF556353)),
                SizedBox(width: 4),
                Text('Offline', style: TextStyle(color: Color(0xFF556353), fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.account_circle, color: Color(0xFF0F3A1A), size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, Elara!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Color(0xFF111111)),
            ),
            const SizedBox(height: 6),
            const Text(
              'Selamat datang kembali di Laboratorium Virtual Pertanian.',
              style: TextStyle(fontSize: 14, color: Color(0xFF555555), height: 1.3),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEAEFE7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12, width: 0.5),
              ),
              child: const Column(
                children: [
                  Text(
                    'Statistik Simulasi',
                    style: TextStyle(color: Color(0xFF0F3A1A), fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '12 Simulasi Selesai',
                    style: TextStyle(color: Color(0xFF556353), fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onStartExperiment,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F3A1A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.energy_savings_leaf, size: 40, color: Color(0xFF0F3A1A)),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Mulai Eksperimen',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Eksperimen Terakhir',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF111111)),
                ),
                Card(
                  color: const Color(0xFF224E2A),
                  elevation: 0,
                  shape: const StadiumBorder(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text('Aktif', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8DE)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 64,
                          height: 64,
                          color: const Color(0xFFE5EAE2),
                          child: const Icon(Icons.image, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jagung (Zea mays)',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A)),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Fase: Vegetatif, Hari ke-45',
                            style: TextStyle(fontSize: 13, color: Color(0xFF555555)),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF224E2A),
                      minimumSize: const Size(double.infinity, 44),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    onPressed: onStartExperiment,
                    icon: const Icon(Icons.play_arrow, color: Colors.white, size: 16),
                    label: const Text('Lanjut Eksperimen', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}