import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/apimodule/api_service.dart';
import 'package:getx_api/model/model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<ProductModel>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
