import 'package:flutter/material.dart';

class CompareScenarioPage extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onApplyScenario;

  const CompareScenarioPage({
    super.key,
    this.onBack,
    this.onApplyScenario,
  });

  static const Color bg = Color(0xFFF9FBF7);
  static const Color green = Color(0xFF0F3A1A);
  static const Color muted = Color(0xFF556353);
  static const Color border = Color(0xFFDDE5D8);
  static const Color brown = Color(0xFF7D5D55);
  static const Color danger = Color(0xFF7A2E58);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (onBack != null) {
              onBack!();
            } else if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3F4A3D)),
        ),
        title: const Text(
          'Virtual Ag Lab',
          style: TextStyle(
            color: green,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.account_circle, color: Color(0xFF3F4A3D), size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bandingkan Skenario',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pilih dan bandingkan 2 log eksperimen yang telah Anda jalankan untuk menganalisis perbedaan respons tanaman terhadap variasi lingkungan yang berbeda.',
              style: TextStyle(
                color: muted,
                fontSize: 14,
                height: 1.28,
              ),
            ),
            const SizedBox(height: 20),
            _selectorCard(),
            const SizedBox(height: 20),
            _healthCard(),
            const SizedBox(height: 16),
            _growthCard(),
            const SizedBox(height: 16),
            _harvestCard(),
            const SizedBox(height: 20),
            _chartCard(),
            const SizedBox(height: 20),
            _analysisCard(context),
            const SizedBox(height: 20),
            _visualCard(
              imageUrl: 'https://images.unsplash.com/photo-1532187643603-ba119ca4109e?w=900&auto=format&fit=crop',
              label: 'Visualisasi A: Kontrol Dasar',
            ),
            const SizedBox(height: 14),
            _visualCard(
              imageUrl: 'https://images.unsplash.com/photo-1495107334309-fcf20504a5ab?w=900&auto=format&fit=crop',
              label: 'Visualisasi B: Optimasi pH (direkomendasikan)',
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectorCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _scenarioInput(
            label: 'Skenario A',
            value: 'Optimasi Nitrogen v1.2 (12 Jan)',
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.compare_arrows, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          _scenarioInput(
            label: 'Skenario B',
            value: 'Kontrol Kelembaban Tinggi (15 Jan)',
          ),
        ],
      ),
    );
  }

  Widget _scenarioInput({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: muted,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF9EA79B)),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _healthCard() {
    return _metricWrapper(
      title: 'Skor Kesehatan',
      trailingIcon: Icons.favorite,
      trailingColor: green,
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: _BigMetric(
                  value: '82%',
                  label: 'Skenario A',
                  color: Color(0xFF333333),
                ),
              ),
              Expanded(
                child: _BigMetric(
                  value: '94%',
                  label: 'Skenario B',
                  color: green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Row(
              children: [
                Expanded(
                  flex: 7,
                  child: ColoredBox(
                    color: Color(0xFFDADDD6),
                    child: SizedBox(height: 7),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ColoredBox(
                    color: green,
                    child: SizedBox(height: 7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '+12% peningkatan kesehatan dibandingkan A ↗',
              style: TextStyle(
                color: green,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _growthCard() {
    return _metricWrapper(
      title: 'Efisiensi Pertumbuhan',
      trailingIcon: Icons.bolt,
      trailingColor: brown,
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _BigMetric(
                  value: '1.2x',
                  label: 'Skenario A',
                  color: Color(0xFF222222),
                ),
              ),
              Expanded(
                child: _BigMetric(
                  value: '1.8x',
                  label: 'Skenario B',
                  color: brown,
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            children: [
              _Pill(text: 'SIGNIFIKAN'),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Laju pertumbuhan optimal',
                  style: TextStyle(color: muted, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _harvestCard() {
    return _metricWrapper(
      title: 'Estimasi Panen',
      trailingIcon: Icons.grass,
      trailingColor: danger,
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _BigMetric(
                  value: '4.5 kg',
                  label: 'Skenario A',
                  color: Color(0xFF222222),
                ),
              ),
              Expanded(
                child: _BigMetric(
                  value: '5.2 kg',
                  label: 'Skenario B',
                  color: brown,
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Text(
                'Perkiraan Panen',
                style: TextStyle(color: muted, fontSize: 12),
              ),
              Spacer(),
              Text(
                'Est. +15.5%',
                style: TextStyle(
                  color: danger,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricWrapper({
    required String title,
    required IconData trailingIcon,
    required Color trailingColor,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF454D43),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Icon(trailingIcon, color: trailingColor, size: 22),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }

  Widget _chartCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Visualisasi Pertumbuhan Akumulatif',
            style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Perbandingan Biomasa (gram) vs Waktu (hari)',
            style: TextStyle(color: muted, fontSize: 12),
          ),
          const SizedBox(height: 28),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _Legend(color: Color(0xFFBFC6C0), text: 'Skenario A'),
              SizedBox(width: 16),
              _Legend(color: green, text: 'Skenario B'),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 210,
            width: double.infinity,
            child: CustomPaint(
              painter: const _LineChartPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _analysisCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2EC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome, color: green, size: 22),
              SizedBox(width: 10),
              Text(
                'Analisis Komparatif',
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check_circle, color: green, size: 18),
              SizedBox(width: 10),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Keunggulan Skenario B: ',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: 'Skenario B menunjukkan performa 15% lebih baik. Stabilisasi pH 6.2 - 6.5 mempercepat absorpsi mikronutrien.',
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: Color(0xFF242424),
                    fontSize: 14,
                    height: 1.28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info, color: Color(0xFF71786F), size: 18),
              SizedBox(width: 10),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Observasi Kelembaban: ',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: 'Pada Skenario A, fluktuasi kelembaban di atas 80% menyebabkan stres transpirasi ringan.',
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: Color(0xFF242424),
                    fontSize: 14,
                    height: 1.28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {
                if (onApplyScenario != null) {
                  onApplyScenario!();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Skenario B diterapkan pada simulasi.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              label: const Text(
                'Terapkan Skenario B',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              icon: const Icon(Icons.rocket_launch, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _visualCard({
    required String imageUrl,
    required String label,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            height: 152,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 152,
              width: double.infinity,
              color: const Color(0xFFDDE5D8),
              child: const Center(
                child: Icon(Icons.image_not_supported, color: muted),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.05),
                    Colors.black.withValues(alpha: 0.45),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 12,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BigMetric extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _BigMetric({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: CompareScenarioPage.muted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;

  const _Pill({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD8D2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: CompareScenarioPage.brown,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String text;

  const _Legend({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 7),
        Text(
          text,
          style: const TextStyle(color: CompareScenarioPage.muted, fontSize: 12),
        ),
      ],
    );
  }
}

class _LineChartPainter extends CustomPainter {
  const _LineChartPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xFFE8ECE5)
      ..strokeWidth = 1;

    for (int i = 0; i < 4; i++) {
      final y = size.height * (i + 1) / 5;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final aPaint = Paint()
      ..color = const Color(0xFFBFC6C0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final bPaint = Paint()
      ..color = CompareScenarioPage.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4;

    final aPath = Path()
      ..moveTo(0, size.height * 0.78)
      ..lineTo(size.width * 0.22, size.height * 0.73)
      ..lineTo(size.width * 0.42, size.height * 0.63)
      ..lineTo(size.width * 0.62, size.height * 0.58)
      ..lineTo(size.width * 0.82, size.height * 0.56)
      ..lineTo(size.width, size.height * 0.54);

    final bPath = Path()
      ..moveTo(0, size.height * 0.72)
      ..lineTo(size.width * 0.22, size.height * 0.66)
      ..lineTo(size.width * 0.42, size.height * 0.54)
      ..lineTo(size.width * 0.62, size.height * 0.42)
      ..lineTo(size.width * 0.82, size.height * 0.34)
      ..lineTo(size.width, size.height * 0.31);

    canvas.drawPath(aPath, aPaint);
    canvas.drawPath(bPath, bPaint);

    final labelPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    const labels = ['H-0', 'H-30', 'H-60', 'H-90'];
    for (int i = 0; i < labels.length; i++) {
      final x = size.width * i / (labels.length - 1);
      labelPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(
          color: Color(0xFFB7BDB3),
          fontSize: 9,
        ),
      );
      labelPainter.layout();
      labelPainter.paint(canvas, Offset(x - labelPainter.width / 2, size.height - 16));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
