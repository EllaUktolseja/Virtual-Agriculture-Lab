import 'package:flutter/material.dart';

class HistoriEksperimenPage extends StatelessWidget {
  final VoidCallback onCompare;
  final VoidCallback onStartNewExperiment;

  const HistoriEksperimenPage({
    super.key,
    required this.onCompare,
    required this.onStartNewExperiment,
  });

  static const Color bg = Color(0xFFF9FBF7);
  static const Color green = Color(0xFF0F3A1A);
  static const Color muted = Color(0xFF556353);
  static const Color cardBorder = Color(0xFFE2E8DE);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> experiments = [
      {
        'name': 'Glycine Max',
        'status': 'Normal',
        'date': '12 Okt 2023, 14:30',
        'health': 92,
        'statusColor': green,
        'image': 'https://images.unsplash.com/photo-1591857177580-dc82b9ac4e1e?w=300&auto=format&fit=crop',
      },
      {
        'name': 'Solanum\nLycopersicum',
        'status': 'Stres Air',
        'date': '10 Okt 2023, 09:15',
        'health': 45,
        'statusColor': Color(0xFFC62828),
        'image': 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=300&auto=format&fit=crop',
      },
      {
        'name': 'Zea Mays',
        'status': 'Nutrisi +',
        'date': '08 Okt 2023, 16:45',
        'health': 88,
        'statusColor': Color(0xFF7A2E58),
        'image': 'https://images.unsplash.com/photo-1551754655-cd27e38d2076?w=300&auto=format&fit=crop',
      },
      {
        'name': 'Triticum Aestivum',
        'status': 'Normal',
        'date': '05 Okt 2023, 11:20',
        'health': 78,
        'statusColor': green,
        'image': 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=300&auto=format&fit=crop',
      },
    ];

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: const Text(
          'Virtual Ag Lab',
          style: TextStyle(
            color: green,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
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
                Icon(Icons.cloud_off, size: 16, color: muted),
                SizedBox(width: 4),
                Text(
                  'Offline',
                  style: TextStyle(
                    color: muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.account_circle, color: green, size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _summaryCard(),
            const SizedBox(height: 20),
            _searchBar(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: onCompare,
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                icon: const Icon(Icons.compare_arrows, color: Colors.white),
                label: const Text(
                  'Bandingkan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...experiments.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _experimentCard(item),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: onStartNewExperiment,
                style: OutlinedButton.styleFrom(
                  foregroundColor: green,
                  side: const BorderSide(color: green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text(
                  'Mulai Eksperimen Baru',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.science,
              color: Color(0xFFB9D9B3),
              size: 34,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Histori Eksperimen',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Lacak kemajuan riset botani Anda.',
                  style: TextStyle(
                    color: muted,
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 28),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '12\nTotal Simulasi',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: green,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari eksperimen...',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: bg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: muted),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: muted),
        ),
      ),
    );
  }

  Widget _experimentCard(Map<String, Object> item) {
    final int health = item['health'] as int;
    final Color statusColor = item['statusColor'] as Color;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item['image'] as String,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 56,
                    height: 56,
                    color: const Color(0xFFE5EAE2),
                    child: const Icon(Icons.eco, color: green),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF222222),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: muted,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          item['date'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: muted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0E7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item['status'] as String,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _healthSection(health, statusColor)),
              const SizedBox(width: 20),
              Expanded(child: _ratingSection()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _healthSection(int value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kesehatan',
          style: TextStyle(fontSize: 14, color: muted),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 5,
                backgroundColor: const Color(0xFFE3E5DF),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$value%',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _ratingSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estimasi Hasil',
          style: TextStyle(fontSize: 14, color: muted),
        ),
        SizedBox(height: 8),
        Text(
          '★ ★ ★ ★ ☆',
          style: TextStyle(
            color: green,
            fontSize: 16,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
