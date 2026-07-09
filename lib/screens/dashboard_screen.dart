import 'package:flutter/material.dart';
import '../services/app_data.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int progressPercentage = (AppData.todayProgress * 100).toInt();

    return Scaffold(
      backgroundColor: const Color(0xFF4A90E2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: 35,
                              height: 35,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Ethic Learn',
                              style: TextStyle(
                                color: Color(0xFF4A90E2),
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/profile'),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFF4A90E2),
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Halo M. Jefri!',
                      style: TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Today Progress',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$progressPercentage%',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: AppData.todayProgress,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      color: Colors.white,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildModuleCard(
                      'Digital Empathy',
                      'Memahami, merasakan, dan menghargai emosi orang lain saat berinteraksi di dunia maya.',
                      AppData.getModuleStatus('Digital Empathy', 'Continue'),
                      context,
                    ),
                    _buildModuleCard(
                      'Digital Responsibility',
                      'Menjaga keamanan data pribadi dan bertanggung jawab penuh atas segala aksi digital.',
                      AppData.getModuleStatus(
                        'Digital Responsibility',
                        'Lock 🔒',
                      ),
                      context,
                    ),
                    _buildModuleCard(
                      'Critical Thinking',
                      'Mampu memfilter informasi, mengenali hoax, dan berpikir logis sebelum merespons berita.',
                      AppData.getModuleStatus('Critical Thinking', 'Lock 🔒'),
                      context,
                    ),
                    _buildModuleCard(
                      'Digital Citizenship',
                      'Memahami hak, kewajiban, tata krama, dan hukum yang berlaku dalam ruang siber.',
                      AppData.getModuleStatus('Digital Citizenship', 'Lock 🔒'),
                      context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    String title,
    String description,
    String status,
    BuildContext context,
  ) {
    bool isButtonEnabled = status != 'Lock 🔒';
    Color buttonColor = status == 'Done'
        ? Colors.green
        : (status == 'Continue' ? const Color(0xFF4A90E2) : Colors.grey[400]!);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              height: 1.4,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      // --- KODE YG BERUBAH: Menyimpan nama modul lalu membuka materi ---
                      AppData.currentActiveModule = title;
                      Navigator.pushNamed(context, '/reading');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                disabledBackgroundColor: Colors.grey[400],
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                status == 'Done' ? 'Done ✓' : status,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
