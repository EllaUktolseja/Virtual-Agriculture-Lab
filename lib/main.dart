import 'package:flutter/material.dart';
import 'package:agro_lab_app/pages/dashboard_page.dart';
import 'package:agro_lab_app/pages/jelajah_page.dart';
import 'package:agro_lab_app/pages/setup_page.dart';
import 'package:agro_lab_app/pages/hasil_page.dart';
import 'package:agro_lab_app/pages/histori_eksperimen_page.dart';
import 'package:agro_lab_app/pages/compare_scenario_page.dart';
import 'package:agro_lab_app/pages/panduan_riset_page.dart';
import 'package:agro_lab_app/pages/splash_page.dart';
import 'package:agro_lab_app/pages/login_page.dart';

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
        useMaterial3: true,
      ),
      home: const AppEntryFlow(),
    );
  }
}

class AppEntryFlow extends StatefulWidget {
  const AppEntryFlow({super.key});

  @override
  State<AppEntryFlow> createState() => _AppEntryFlowState();
}

class _AppEntryFlowState extends State<AppEntryFlow> {
  bool _showSplash = true;
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return SplashPage(
        onContinue: () {
          setState(() => _showSplash = false);
        },
      );
    }

    if (!_isLoggedIn) {
      return LoginPage(
        onLogin: () {
          setState(() => _isLoggedIn = true);
        },
      );
    }

    return const MainNavigationContainer();
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

  void _openExperimentSelection() {
    _pushCustomPage(
      PilihKomoditasPage(
        onSelectTanaman: _openSetupExperiment,
      ),
    );
  }

  void _openSetupExperiment(Map<String, dynamic> tanaman) {
    _pushCustomPage(
      SetupEksperimenPage(
        tanamanData: tanaman,
        onBack: _openExperimentSelection,
        onStartSimulation: () => _openSimulationResult(tanaman),
      ),
    );
  }

  void _openSimulationResult(Map<String, dynamic> tanaman) {
    _pushCustomPage(
      HasilSimulasiPage(
        onBack: () => _openSetupExperiment(tanaman),
        onRestart: _openExperimentSelection,
      ),
    );
  }

  void _openCompareScenario() {
    _pushCustomPage(
      CompareScenarioPage(
        onBack: () => _navigateToTab(2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> basePages = [
      DashboardPage(onStartExperiment: _openExperimentSelection),
      PilihKomoditasPage(onSelectTanaman: _openSetupExperiment),
      HistoriEksperimenPage(
        onCompare: _openCompareScenario,
        onStartNewExperiment: _openExperimentSelection,
      ),
      const PanduanRisetPage(),
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
        onTap: _navigateToTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Jelajah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_rounded),
            label: 'Eksperimen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Riset',
          ),
        ],
      ),
    );
  }
}
