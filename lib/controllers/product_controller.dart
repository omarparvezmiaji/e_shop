import 'package:get/state_manager.dart';
import 'package:e_shop/models/product.dart';
import 'package:e_shop/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;

  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  // void fetchProducts() async {
  //   try {
  //     isLoading(true);
  //     var products = await RemoteServices.fetchProducts();
  //     if (products != null) {
  //       productList.value = products;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
