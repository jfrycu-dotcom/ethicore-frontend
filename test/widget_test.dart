import 'package:flutter_test/flutter_test.dart';
import 'package:ethica_learn/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // 1. Kita ganti MyApp() menjadi EthicLearnApp() sesuai nama class utama kita
    await tester.pumpWidget(const EthicLearnApp());

    // 2. Kita hapus logika "counter" bawaan Flutter karena aplikasi kita sudah berubah.
    // Sebagai gantinya, kita suruh sistem mengecek apakah ada teks 'Log In' di layar.
    expect(find.text('Log In'), findsWidgets);
  });
}
