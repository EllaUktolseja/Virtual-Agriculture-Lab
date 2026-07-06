import 'package:flutter/material.dart';

class SetupEksperimenPage extends StatefulWidget {
  final Map<String, dynamic> tanamanData;
  final VoidCallback onBack;
  final VoidCallback onStartSimulation;

  const SetupEksperimenPage({super.key, required this.tanamanData, required this.onBack, required this.onStartSimulation});

  @override
  State<SetupEksperimenPage> createState() => _SetupEksperimenPageState();
}

class _SetupEksperimenPageState extends State<SetupEksperimenPage> {
  String _selectedKondisi = 'Normal';
  double _pengairan = 250;
  double _suhu = 28;
  double _ph = 6.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F3A1A)),
          onPressed: widget.onBack,
        ),
        title: const Text('Setup Eksperimen', style: TextStyle(color: Color(0xFF0F3A1A), fontWeight: FontWeight.bold, fontSize: 16)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildBadge(widget.tanamanData['latin'] ?? 'Zea mays'),
                    const SizedBox(width: 8),
                    _buildBadge(widget.tanamanData['fase'] ?? 'Fase Vegetatif'),
                  ],
                ),
                const SizedBox(height: 12),
                Text(widget.tanamanData['nama'] ?? 'Jagung', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF0F3A1A))),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8DE)),
                  ),
                  child: Row(
                    children: [
                      Container(width: 44, height: 44, decoration: const BoxDecoration(color: Color(0xFFEAEFE7), shape: BoxShape.circle)),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Parameter Referensi', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          SizedBox(height: 4),
                          Text('Iklim Tropis (Moderat)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A))),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8DE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.tune, size: 20, color: Color(0xFF0F3A1A)),
                          SizedBox(width: 8),
                          Text('Parameter Eksperimen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A))),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildConditionChip('Normal'),
                          const SizedBox(width: 8),
                          _buildConditionChip('Stres Air'),
                          const SizedBox(width: 8),
                          _buildConditionChip('Suhu Ekstrim'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildSliderParameter(
                        title: 'Intensitas Pengairan',
                        unit: 'Satuan: ml/hari',
                        value: _pengairan,
                        min: 0,
                        max: 500,
                        targetRange: '200–300',
                        icon: Icons.water_drop,
                        color: Colors.blue.shade50,
                        iconColor: const Color(0xFF0F3A1A),
                        onChanged: (val) => setState(() => _pengairan = val),
                      ),
                      _buildSliderParameter(
                        title: 'Suhu Lingkungan',
                        unit: 'Satuan: Celcius (°C)',
                        value: _suhu,
                        min: 15,
                        max: 40,
                        targetRange: '24–30°C',
                        icon: Icons.thermostat,
                        color: Colors.red.shade50,
                        iconColor: Colors.red.shade700,
                        onChanged: (val) => setState(() => _suhu = val),
                      ),
                      _buildSliderParameter(
                        title: 'Tingkat Keasaman (pH)',
                        unit: 'Skala Logaritmik',
                        value: _ph,
                        min: 4.0,
                        max: 9.0,
                        targetRange: '5.8–7.0',
                        icon: Icons.change_history,
                        color: Colors.purple.shade50,
                        iconColor: Colors.purple.shade700,
                        onChanged: (val) => setState(() => _ph = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8DE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.insert_chart_outlined, size: 20, color: Color(0xFF0F3A1A)),
                          SizedBox(width: 8),
                          Text('Ringkasan Simulasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A))),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: const Color(0xFFF6F6F2), borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.brown, shape: BoxShape.circle)),
                                const SizedBox(width: 8),
                                const Text('PREDIKSI OUTPUT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text('Anomali Suhu Terdeteksi.', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown)),
                            const SizedBox(height: 6),
                            const Text('Konfigurasi saat ini berpotensi menyebabkan transpirasi berlebih pada jaringan epidermis.', style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text('VARIAN DEVIASI MATRIKS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54)),
                      const SizedBox(height: 16),
                      _buildMetricsRow('Stres Osmotik (Air)', '15.4% (Rendah)', 0.154, Colors.green),
                      const SizedBox(height: 16),
                      _buildMetricsRow('Stres Termal (Suhu)', '42.8% (Moderat)', 0.428, Colors.red.shade900),
                      const SizedBox(height: 16),
                      _buildMetricsRow('Efisiensi Pertumbuhan', '88.2%', 0.882, const Color(0xFF0F3A1A)),
                      const SizedBox(height: 20),
                      const Center(child: Text('Model simulasi berdasarkan dataset botani ARBOR-v2.4', style: TextStyle(fontSize: 10, color: Colors.grey)))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: const Color(0xFFF9FBF7),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F3A1A),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                onPressed: widget.onStartSimulation,
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text('Mulai Simulasi', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: const Color(0xFFE5EAE2), borderRadius: BorderRadius.circular(12)),
      child: Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF556353), fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildConditionChip(String title) {
  final isSelected = _selectedKondisi == title;
  return ChoiceChip(
    label: Text(title),
    selected: isSelected,
    selectedColor: const Color(0xFFEAEFE7),
    backgroundColor: Colors.white,
    labelStyle: TextStyle(
      color: isSelected ? const Color(0xFF0F3A1A) : Colors.black54,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      fontSize: 13,
    ),
    shape: StadiumBorder(
      side: BorderSide(
        color: isSelected ? const Color(0xFF0F3A1A) : Colors.black12,
      ),
    ),
    onSelected: (bool selected) {
      if (selected) {
        setState(() {
          _selectedKondisi = title;
          if (title == 'Stres Air') {
            _pengairan = 50;
            _suhu = 28; 
          } else if (title == 'Suhu Ekstrim') {
            _suhu = 38;
            _pengairan = 250; 
          } else { 
            _pengairan = 250;
            _suhu = 28;
            _ph = 6.5;
          }
        });
      }
    },
  );
}

  Widget _buildSliderParameter({
    required String title, required String unit, required double value, required double min, required double max,
    required String targetRange, required IconData icon, required Color color, required Color iconColor, required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A))),
                  const SizedBox(height: 2),
                  Text(unit, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(1), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A))),
                const SizedBox(height: 2),
                Text('Target Ideal: $targetRange', style: const TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.w600)),
              ],
            )
          ],
        ),
        SliderTheme(
          data: SliderThemeData(trackHeight: 3, activeTrackColor: const Color(0xFF0F3A1A), inactiveTrackColor: Colors.black12, thumbColor: Colors.white, overlayColor: const Color.fromRGBO(15, 58, 26, 0.1)),
          child: Slider(value: value, min: min, max: max, onChanged: onChanged),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(min.toStringAsFixed(0), style: const TextStyle(fontSize: 11, color: Colors.grey)),
              const Text('OPTIMAL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green)),
              Text(max.toStringAsFixed(0), style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMetricsRow(String label, String valueText, double progress, Color barColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 13, color: Colors.black54)),
            Text(valueText, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: barColor)),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(value: progress, minHeight: 6, backgroundColor: Colors.black12, valueColor: AlwaysStoppedAnimation<Color>(barColor)),
        ),
      ],
    );
  }
}