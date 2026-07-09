import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/app_data.dart';

class AiAnalysisScreen extends StatelessWidget {
  const AiAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A90E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                      'AI Character Analysis',
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
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: const Color(0xFFE2E8F0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.auto_awesome,
                                      color: Color(0xFF4A90E2),
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Gemini AI Insight',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4A90E2),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Berdasarkan refleksi dan jawaban kuis yang kamu berikan, kamu memiliki pemahaman yang sangat baik tentang pentingnya memanusiakan pengguna lain di dunia maya. Pertahankan sikap kehati-hatianmu sebelum berkomentar!',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    height: 1.5,
                                    color: const Color(0xFF334155),
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Karakteristik Digitalmu:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 15),
                          _buildAnimatedTraitBar(
                            'Digital Empathy',
                            0.85,
                            const Color(0xFF4A90E2),
                          ),
                          _buildAnimatedTraitBar(
                            'Digital Responsibility',
                            0.70,
                            const Color(0xFF38BDF8),
                          ),
                          _buildAnimatedTraitBar(
                            'Critical Thinking',
                            0.60,
                            const Color(0xFF818CF8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      OutlinedButton(
                        onPressed: () async {
                          // --- KODE YG BERUBAH: Logika Pembuka Gembok Berantai ---
                          String current = AppData.currentActiveModule;

                          if (AppData.getModuleStatus(current, 'Continue') !=
                              'Done') {
                            AppData.todayProgress =
                                AppData.todayProgress + 0.25;
                            await AppData.setModuleStatus(current, 'Done');

                            // Jika modul 1 selesai, buka modul 2
                            if (current == 'Digital Empathy') {
                              await AppData.setModuleStatus(
                                'Digital Responsibility',
                                'Continue',
                              );
                            }
                            // Jika modul 2 selesai, buka modul 3
                            else if (current == 'Digital Responsibility') {
                              await AppData.setModuleStatus(
                                'Critical Thinking',
                                'Continue',
                              );
                            }
                            // Jika modul 3 selesai, buka modul 4
                            else if (current == 'Critical Thinking') {
                              await AppData.setModuleStatus(
                                'Digital Citizenship',
                                'Continue',
                              );
                            }
                          }

                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/dashboard',
                              (route) => false,
                            );
                          }
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
                              'Finish',
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

  Widget _buildAnimatedTraitBar(String label, double percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF334155),
                ),
              ),
              Text(
                '${(percentage * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: const Duration(seconds: 2),
            builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value,
                backgroundColor: color.withOpacity(0.2),
                color: color,
                minHeight: 10,
                borderRadius: BorderRadius.circular(10),
              );
            },
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
        _buildStep('Quiz', true),
        _buildLine(),
        _buildStep('Vocabulary', true),
        _buildLine(),
        _buildStep('Reflection', true),
        _buildLine(),
        _buildStep('AI', true),
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
