import 'package:get/get.dart';
import 'package:getxapi/api_module/api_services.dart';
import 'package:getxapi/product_module/models/product_model.dart';

class ProductController extends GetxController {

  RxList<Product> productList = <Product>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async{
    productList.value =await ApiService.productData();


  }
}