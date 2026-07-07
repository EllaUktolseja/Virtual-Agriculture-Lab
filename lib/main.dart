import 'package:flutter/material.dart';
import 'package:agro_lab_app/pages/dashboard_page.dart';
import 'package:agro_lab_app/pages/jelajah_page.dart';
import 'package:agro_lab_app/pages/setup_page.dart';
import 'package:agro_lab_app/pages/hasil_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Ag Lab',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9FBF7),
        fontFamily: 'Inter',
      ),
      home: const MainNavigationContainer(),
    );
  }
}
class PlaceholderPage extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF7),
        elevation: 0,
        title: Text(title, style: const TextStyle(color: Color(0xFF0F3A1A), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 96, color: const Color(0xFF0F3A1A)),
            const SizedBox(height: 24),
            Text(
              'Halaman $title belum tersedia.',
              style: const TextStyle(fontSize: 18, color: Color(0xFF556353)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
class MainNavigationContainer extends StatefulWidget {
  const MainNavigationContainer({super.key});

  @override
  State<MainNavigationContainer> createState() => _MainNavigationContainerState();
}

class _MainNavigationContainerState extends State<MainNavigationContainer> {
  int _currentIndex = 0;
  Widget? _customPage;

  void _navigateToTab(int index) {
    setState(() {
      _currentIndex = index;
      _customPage = null;
    });
  }

  void _pushCustomPage(Widget page) {
    setState(() {
      _customPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> basePages = [
      DashboardPage(onStartExperiment: () => _navigateToTab(1)),
      PilihKomoditasPage(onSelectTanaman: (tanaman) {
        _pushCustomPage(SetupEksperimenPage(
          tanamanData: tanaman,
          onBack: () => setState(() => _customPage = null),
          onStartSimulation: () => _pushCustomPage(
            HasilSimulasiPage(
              onBack: () => setState(() => _customPage = null),
              onRestart: () => _navigateToTab(1),
            ),
          ),
        ));
      }),
      const PlaceholderPage(title: 'Eksperimen', icon: Icons.science),
      const PlaceholderPage(title: 'Simulasi AR', icon: Icons.view_in_ar),
    ];

    final Widget currentPage = _customPage ?? basePages[_currentIndex];

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFAFAF7),
        selectedItemColor: const Color(0xFF0F3A1A),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: (index) => _navigateToTab(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Jelajah'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Eksperimen'),
          BottomNavigationBarItem(icon: Icon(Icons.view_in_ar), label: 'Simulasi'),
        ],
      ),
    );
  }
}