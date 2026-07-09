import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({super.key});

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  // Controller untuk mengambil teks yang diketik oleh siswa
  final TextEditingController _reflectionController = TextEditingController();
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    // Mendengarkan setiap ketikan siswa untuk mengaktifkan/menonaktifkan tombol Next
    _reflectionController.addListener(() {
      setState(() {
        _isTextEmpty = _reflectionController.text.trim().isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _reflectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A90E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading:
            false, // Menghapus tombol back bawaan di atas
        title: const Text(
          'Digital Empathy',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Indikator Stepper (Reading, Quiz, Vocabulary, & Reflection sekarang AKTIF)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: _buildStepper(),
          ),
          const SizedBox(height: 10),

          // Kontainer Putih Utama
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
                      'Reflection',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Bagian Input Teks Refleksi
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tuliskan Pemahamanmu:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Apa satu hal baru yang telah kamu pelajari atau pahami setelah melewati tahap reading, quiz, dan kosakata tadi?',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Kotak Input Esai (Multiline)
                          TextField(
                            controller: _reflectionController,
                            maxLines:
                                6, // Membuat kotak input vertikal memanjang ke bawah
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText:
                                  'Contoh: Saya belajar banyak tentang digital empathy, bahwa kita harus memikirkan dampak tulisan kita sebelum mengirimkannya...',
                              hintStyle: GoogleFonts.inter(
                                fontSize: 13,
                                color: Colors.grey[400],
                                fontStyle: FontStyle.italic,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color(0xFF4A90E2),
                                  width: 2,
                                ),
                              ),
                              fillColor: const Color(0xFFF8FAFC),
                              filled: true,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFF334155),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- TOMBOL NAVIGASI BAWAH BERDAMPINGAN ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol BACK Kustom di bagian bawah
                      OutlinedButton(
                        onPressed: () => Navigator.pop(
                          context,
                        ), // Kembali ke halaman kosakata
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

                      // Tombol NEXT (Hanya aktif jika input teks tidak kosong)
                      OutlinedButton(
                        onPressed: !_isTextEmpty
                            ? () {
                                // Nanti diarahkan ke halaman AI Character Analysis
                                print(
                                  'Isi refleksi: ${_reflectionController.text}',
                                );
                                Navigator.pushNamed(context, '/ai_analysis');
                              }
                            : null,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: !_isTextEmpty
                                ? const Color(0xFF4A90E2)
                                : Colors.grey[300]!,
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
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                color: !_isTextEmpty
                                    ? const Color(0xFF4A90E2)
                                    : Colors.grey[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              color: !_isTextEmpty
                                  ? const Color(0xFF4A90E2)
                                  : Colors.grey[400],
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

  // Stepper diubah: 'Reflection' sekarang berstatus TRUE (Aktif)
  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStep('Reading', true),
        _buildLine(),
        _buildStep('Quiz', true),
        _buildLine(),
        _buildStep('Vocabulary', true),
        _buildLine(),
        _buildStep('Reflection', true),
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
