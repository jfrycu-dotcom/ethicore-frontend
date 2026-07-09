import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static late SharedPreferences _prefs;

  // --- VARIABEL BARU: Menyimpan nama modul yang sedang diklik ---
  static String currentActiveModule = 'Digital Empathy';

  static double get todayProgress => _prefs.getDouble('todayProgress') ?? 0.0;
  static set todayProgress(double value) =>
      _prefs.setDouble('todayProgress', value);

  static String getModuleStatus(String moduleName, String defaultStatus) {
    return _prefs.getString('status_$moduleName') ?? defaultStatus;
  }

  static Future<void> setModuleStatus(String moduleName, String status) async {
    await _prefs.setString('status_$moduleName', status);
  }

  static Future<void> checkDailyReset() async {
    String todayDate = DateTime.now().toString().split(' ')[0];
    String lastOpenedDate = _prefs.getString('lastOpenedDate') ?? todayDate;

    if (todayDate != lastOpenedDate) {
      await _prefs.setDouble('todayProgress', 0.0);
      await _prefs.setString('status_Digital Empathy', 'Continue');
      await _prefs.setString('status_Digital Responsibility', 'Lock 🔒');
      await _prefs.setString('status_Critical Thinking', 'Lock 🔒');
      await _prefs.setString('status_Digital Citizenship', 'Lock 🔒');
    }
    await _prefs.setString('lastOpenedDate', todayDate);
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await checkDailyReset();
  }
}
