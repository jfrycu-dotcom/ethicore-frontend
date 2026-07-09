import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedAnswerIndex = -1;
  final String _question =
      "Berdasarkan materi Digital Empathy yang telah kamu baca, apa faktor utama yang seringkali menyebabkan seseorang mudah melakukan cyberbullying atau menulis komentar kasar di media sosial?";
  final List<String> _options = [
    "Keterbatasan kecepatan jaringan internet di daerah mereka.",
    "Hilangnya batasan empati karena terhalang oleh layar kaca and tidak melihat ekspresi wajah korban.",
    "Mahalnya harga perangkat gadget dan kuota internet saat ini.",
  ];

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
                      'AI Quiz Interactive',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pertanyaan 1 dari 1:',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _question,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1E293B),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 25),
                          ..._options
                              .asMap()
                              .entries
                              .map(
                                (entry) =>
                                    _buildOptionCard(entry.key, entry.value),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- BARIS TOMBOL NAVIGASI BAWAH ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol Back menuju Reading
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

                      // Tombol Next menuju Vocabulary
                      OutlinedButton(
                        onPressed: _selectedAnswerIndex != -1
                            ? () {
                                Navigator.pushNamed(context, '/vocabulary');
                              }
                            : null,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: _selectedAnswerIndex != -1
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
                                color: _selectedAnswerIndex != -1
                                    ? const Color(0xFF4A90E2)
                                    : Colors.grey[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              color: _selectedAnswerIndex != -1
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

  Widget _buildOptionCard(int index, String optionText) {
    bool isSelected = _selectedAnswerIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedAnswerIndex = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF4A90E2).withOpacity(0.1)
              : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF4A90E2)
                : const Color(0xFFCBD5E1),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF4A90E2) : Colors.grey,
                  width: 2,
                ),
                color: isSelected
                    ? const Color(0xFF4A90E2)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? const Color(0xFF4A90E2)
                      : const Color(0xFF334155),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStep('Reading', true),
        _buildLine(),
        _buildStep('Quiz', true),
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
