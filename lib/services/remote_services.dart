import 'package:http/http.dart' as http;
import 'package:e_shop/models/product.dart';

class RemoteServices {
  static final Base_Url = "https://makeup-api.herokuapp.com";
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var response = await http
        .get(Uri.parse("$Base_Url/api/v1/products.json?brand=maybelline"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
