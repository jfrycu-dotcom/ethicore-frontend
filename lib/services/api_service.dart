import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/unit_model.dart'; // Mengimpor cetakan data yang kita buat tadi

class ApiService {
  // PENTING: Ganti 192.168.x.x dengan IP Address komputermu (hasil dari ipconfig/ifconfig)
  final String baseUrl = "http://10.0.2.2:8000/api";

  Future<List<Unit>> fetchUnits() async {
    final response = await http.get(Uri.parse('$baseUrl/units'));

    if (response.statusCode == 200) {
      // Mengubah JSON string menjadi List objek Unit
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((unit) => Unit.fromJson(unit)).toList();
    } else {
      throw Exception('Gagal mengambil data dari server');
    }
  }
}
