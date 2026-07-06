import 'package:flutter/material.dart';

class PilihKomoditasPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSelectTanaman;
  const PilihKomoditasPage({super.key, required this.onSelectTanaman});

  @override
  State<PilihKomoditasPage> createState() => _PilihKomoditasPageState();
}

class _PilihKomoditasPageState extends State<PilihKomoditasPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredTanaman = [];

  final List<Map<String, dynamic>> _daftarTanaman = [
    {
      'nama': 'Jagung',
      'latin': 'Zea mays',
      'fase': 'Fase Vegetatif',
      'tag': 'SEDANG',
      'tagBg': Color(0xFFEBF5FB),
      'tagText': Color(0xFF2980B9),
      'bintang': 1,
      'deskripsi': 'Zea mays. Tanaman semusim yang adaptif dengan kebutuhan air sedang.',
      'tanah': 'Tanah Sedang',
      'siklus': 'Siklus 90 Hari',
      'iconTanah': Icons.grass,
      'gambar': 'https://images.unsplash.com/photo-1551754625-7036a507d57a?w=500&auto=format&fit=crop',
    },
    {
      'nama': 'Padi',
      'latin': 'Oryza sativa',
      'fase': 'Fase Vegetatif',
      'tag': 'SENSITIF AIR',
      'tagBg': Color(0xFFFCEAE6),
      'tagText': Color(0xFFD35400),
      'bintang': 2,
      'deskripsi': 'Oryza sativa. Tanaman pangan pokok yang membutuhkan genangan air luas.',
      'tanah': 'Tanah Becek',
      'siklus': 'Siklus 120 Hari',
      'iconTanah': Icons.opacity,
      'gambar': 'https://images.unsplash.com/photo-1536657464919-892534f60d6e?w=500&auto=format&fit=crop',
    },
  ];

  @override
  void initState() {
    super.initState();
    _filteredTanaman = _daftarTanaman;
    _searchController.addListener(_filterTanamanList);
  }

  void _filterTanamanList() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTanaman = _daftarTanaman.where((tanaman) {
        final nama = tanaman['nama'].toString().toLowerCase();
        final latin = tanaman['latin'].toString().toLowerCase();
        return nama.contains(query) || latin.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF7),
        elevation: 0,
        title: const Text('Virtual Ag Lab', style: TextStyle(color: Color(0xFF0F3A1A), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih Komoditas Tanaman', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF0F3A1A))),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE2E8DE)),
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Cari tanaman...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredTanaman.length,
              itemBuilder: (context, index) {
                final item = _filteredTanaman[index];
                return GestureDetector(
                  onTap: () => widget.onSelectTanaman(item),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8DE)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(item['nama'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3A1A))),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}