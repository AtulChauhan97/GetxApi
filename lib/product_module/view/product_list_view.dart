import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapi/api_module/api_services.dart';
import 'package:getxapi/app_widget_module/widget_module.dart';
import 'package:getxapi/common_module/app_color.dart';
import 'package:getxapi/common_module/app_string.dart';
import 'package:getxapi/product_module/controller/product_controller.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purpleColor,
          centerTitle: true,
          title: Text(
            AppString.productList,
            style: TextStyle(color: AppColor.grey200),
          ),
        ),
        body: FutureBuilder(
          future: ApiService.productData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Obx(
                () => ListView.builder(
                    itemCount: productController.productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            title:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(productController.productList[index].name),
                                    Text(productController.productList[index].brand),
                                    Text(productController.productList[index].currency),
                                  ],
                                ),
                            leading: Text(
                              productController.productList[index].id
                                  .toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            trailing: Text(
                                productController.productList[index].price),
                          ),
                          const Divider(),
                          AppWidget.containerWidget(),
                        ],
                      );
                    }),
              );
            }
          },
        ));
  }
}
