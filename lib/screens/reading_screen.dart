import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A90E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading:
            false, // Menyembunyikan tombol back bawaan di atas
        title: const Text(
          'Digital Empathy',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: _buildStepper(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF4A90E2),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Reading Session',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Pernahkah kamu menyadari seberapa besar dampak satu komentar kecil di media sosial? Di era digital ini, layar kaca seringkali membuat kita lupa bahwa ada manusia nyata di balik setiap nama pengguna.\n\n'
                        'Digital Empathy atau empati digital adalah kemampuan untuk memahami dan merasakan emosi orang lain saat berinteraksi secara online. Ini bukan sekadar tentang bersikap sopan, tetapi tentang kemampuan menempatkan diri kita pada posisi orang lain sebelum kita menekan tombol kirim.\n\n'
                        'Banyak kasus cyberbullying terjadi bukan karena niat jahat yang murni, melainkan karena hilangnya batasan empati saat berhadapan dengan layar. Ketika kita tidak bisa melihat ekspresi wajah atau mendengar nada suara lawan bicara, sangat mudah untuk meremehkan dampak dari kata-kata kita.\n\n'
                        'Oleh karena itu, membangun empati digital adalah langkah krusial pertama dalam membentuk karakter yang bertanggung jawab di dunia maya. Ini dimulai dari hal sederhana: memikirkan dua kali sebelum membagikan sesuatu yang berpotensi menyakiti orang lain.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 1.6,
                          color: const Color(0xFF334155),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- BARIS TOMBOL NAVIGASI BAWAH ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol Back menuju Dashboard
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tombol Next menuju Quiz
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/quiz');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF4A90E2),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Color(0xFF4A90E2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF4A90E2),
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStep('Reading', true),
        _buildLine(),
        _buildStep('Quiz', false),
        _buildLine(),
        _buildStep('Vocabulary', false),
        _buildLine(),
        _buildStep('Reflection', false),
        _buildLine(),
        _buildStep('AI', false),
      ],
    );
  }

  Widget _buildStep(String title, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: isActive ? Colors.white : Colors.white54,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white54,
            fontSize: 9,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Expanded(
      child: Container(
        height: 1,
        color: Colors.white54,
        margin: const EdgeInsets.only(left: 2, right: 2, bottom: 12),
      ),
    );
  }
}
