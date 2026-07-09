import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Mengatur timer 3 detik, lalu pindah ke halaman Login
    Timer(const Duration(seconds: 3), () {
      // pushReplacementNamed digunakan agar pengguna tidak bisa menekan tombol back ke Splash Screen
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A90E2), // Background biru utama
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo EL-AI
            Image.asset(
              'assets/images/logo.png', // Pastikan path ini sesuai dengan gambar logomu
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            // Nama Aplikasi
            const Text(
              'Ethic Learn',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Membentuk Karakter di Dunia Digital',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 50),
            // Indikator Loading berputar
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
