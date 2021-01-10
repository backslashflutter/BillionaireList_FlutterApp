import 'package:billionaire_list/jsonData.dart';
import 'package:http/http.dart' as http;

class ServiceJson {
  static const String url =
      "https://forbes400.herokuapp.com/api/forbes400?limit=20";

  static Future<List<Billionaire>> getBillionaire() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        // if the data is fetched successfully
        final List<Billionaire> billioniareList =
            billionaireFromJson(response.body);
        return billioniareList;
      } else {
        return getBillionaire();
      }
    } catch (e) {
      return getBillionaire();
    }
  }
}
