import 'dart:convert';
import 'package:http/http.dart' as http;

class GrammarService {
  static Future<List<Map<String, dynamic>>> checkErrors(String text) async {
  final response = await http.post(
    Uri.parse("https://api.languagetool.org/v2/check"),
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
    body: "text=$text&language=fr",
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<Map<String, dynamic>> errors = [];

    for (var match in data["matches"]) {
      String ruleId = match["rule"]["id"] ?? "";
      
      // 🔥 Exclure certaines erreurs spécifiques de l'API
      if (ruleId != "MOT_PEU_FRÉQUENT" && ruleId != "CASSE") {
        errors.add({
          "offset": match["offset"],
          "length": match["length"],
          "message": match["message"],
        });
      }
    }
    return errors;
  }
  return [];
  }
}
