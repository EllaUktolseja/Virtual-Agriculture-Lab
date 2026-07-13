import 'package:flutter/material.dart';

class PanduanRisetPage extends StatelessWidget {
  const PanduanRisetPage({super.key});

  static const Color bg = Color(0xFFF9FBF7);
  static const Color green = Color(0xFF0F3A1A);
  static const Color muted = Color(0xFF556353);
  static const Color cardBorder = Color(0xFFE2E8DE);
  static const Color lightGreen = Color(0xFFEAF0E7);

  @override
  Widget build(BuildContext context) {
    final categories = [
      _ResearchCategory(
        title: 'Dasar Agronomi',
        subtitle: 'Fondasi ilmu tanaman',
        icon: Icons.eco,
        color: green,
      ),
      _ResearchCategory(
        title: 'Manajemen Nutrisi',
        subtitle: 'Hara, pupuk, dan pH',
        icon: Icons.science,
        color: const Color(0xFF7A2E58),
      ),
      _ResearchCategory(
        title: 'Identifikasi Hama',
        subtitle: 'Gejala dan mitigasi',
        icon: Icons.bug_report,
        color: const Color(0xFFC76A2B),
      ),
      _ResearchCategory(
        title: 'Optimalisasi Lingkungan',
        subtitle: 'Air, suhu, dan cahaya',
        icon: Icons.thermostat,
        color: const Color(0xFF2E6F95),
      ),
    ];

    final articles = [
      _ResearchArticle(
        title: 'Analisis Spektral Defisiensi Nitrogen',
        subtitle: 'Mengenali klorosis melalui indikator visual daun.',
        readTime: '8 menit',
        icon: Icons.grass,
      ),
      _ResearchArticle(
        title: 'Kalibrasi Sensor pH Tanah Digital',
        subtitle: 'Panduan memahami pH dan dampaknya pada serapan hara.',
        readTime: '6 menit',
        icon: Icons.sensors,
      ),
      _ResearchArticle(
        title: 'Kontrol Biologis: Penggunaan Predator Alami',
        subtitle: 'Pendekatan ramah lingkungan untuk mengurangi hama.',
        readTime: '10 menit',
        icon: Icons.shield,
      ),
    ];

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: const Text(
          'Panduan Riset',
          style: TextStyle(
            color: green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.account_circle, color: green, size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 20),
            const Text(
              'Kategori Utama',
              style: TextStyle(
                color: green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.18,
              ),
              itemBuilder: (context, index) => _categoryCard(categories[index]),
            ),
            const SizedBox(height: 24),
            _popularGuideCard(),
            const SizedBox(height: 24),
            const Text(
              'Artikel Riset',
              style: TextStyle(
                color: green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...articles.map(
              (article) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _articleCard(article),
              ),
            ),
            const SizedBox(height: 12),
            _expertQuoteCard(context),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari panduan, artikel, atau topik riset...',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        prefixIcon: const Icon(Icons.search, color: muted),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: cardBorder),
        ),
      ),
    );
  }

  Widget _categoryCard(_ResearchCategory category) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: category.color.withValues(alpha: 0.12),
            radius: 20,
            child: Icon(category.icon, color: category.color, size: 22),
          ),
          const Spacer(),
          Text(
            category.title,
            style: const TextStyle(
              color: green,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            category.subtitle,
            style: const TextStyle(
              color: muted,
              fontSize: 11,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _popularGuideCard() {
    return Container(
      decoration: BoxDecoration(
        color: green,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: green.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            child: Image.network(
              'https://images.unsplash.com/photo-1532187643603-ba119ca4109e?w=900&auto=format&fit=crop',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                color: const Color(0xFF244D2C),
                child: const Center(
                  child: Icon(Icons.local_florist, color: Colors.white70, size: 54),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Panduan Populer',
                  style: TextStyle(
                    color: Color(0xFFB9D9B3),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Simulasi Fotofosforilasi pada Spesies C3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pelajari bagaimana proses cahaya, klorofil, dan nutrisi memengaruhi performa pertumbuhan tanaman.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _articleCard(_ResearchArticle article) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(article.icon, color: green, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    color: green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  article.subtitle,
                  style: const TextStyle(
                    color: muted,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 14, color: muted),
                    const SizedBox(width: 5),
                    Text(
                      article.readTime,
                      style: const TextStyle(color: muted, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: muted),
        ],
      ),
    );
  }

  Widget _expertQuoteCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF0E7),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFD3DDCF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: green, size: 34),
          const SizedBox(height: 8),
          const Text(
            '“Simulasi digital membantu mahasiswa memahami hubungan antara kondisi lingkungan dan respon fisiologis tanaman tanpa harus menunggu siklus tanam penuh.”',
            style: TextStyle(
              color: Color(0xFF263326),
              fontSize: 14,
              height: 1.55,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Dr. Aris Setiawan',
            style: TextStyle(
              color: green,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Pakar Agronomi Digital',
            style: TextStyle(color: muted, fontSize: 12),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profil pakar akan dikembangkan pada tahap berikutnya.'),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: green,
                side: const BorderSide(color: green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.person_search),
              label: const Text(
                'Profil Lengkap',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResearchCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _ResearchCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class _ResearchArticle {
  final String title;
  final String subtitle;
  final String readTime;
  final IconData icon;

  const _ResearchArticle({
    required this.title,
    required this.subtitle,
    required this.readTime,
    required this.icon,
  });
}
