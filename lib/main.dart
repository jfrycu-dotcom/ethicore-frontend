import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/app_data.dart'; // Impor data global terpusat
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/reading_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/vocabulary_screen.dart';
import 'screens/reflection_screen.dart';
import 'screens/ai_analysis_screen.dart';
import 'screens/splash_screen.dart'; // 1. Tambahkan impor ini
import 'screens/register_screen.dart'; // 2. Tambahkan impor ini
import 'screens/forgot_password_screen.dart';
import 'screens/profile_screen.dart'; // Tambahkan baris ini

// Mengubah main menjadi async agar bisa menunggu proses loading memory HP selesai
void main() async {
  // Wajib dipanggil jika ada proses async sebelum runApp() dijalankan
  WidgetsFlutterBinding.ensureInitialized();

  // Memuat data progres dari memori internal HP
  await AppData.init();

  runApp(const EthicLearnApp());
}

class EthicLearnApp extends StatelessWidget {
  const EthicLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EL-AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4A90E2),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A90E2),
          background: const Color(0xFFF8FAFC),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/reading': (context) => const ReadingScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/vocabulary': (context) => const VocabularyScreen(),
        '/reflection': (context) => const ReflectionScreen(),
        '/ai_analysis': (context) => const AiAnalysisScreen(),
      },
    );
  }
}
