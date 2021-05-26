import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/appColor.dart';
import 'package:getx_api/appString.dart';
import 'package:getx_api/model/model.dart';
import 'package:getx_api/product_controller.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.productList),
      ),
      body: Obx(() {
        if (productController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            productController.productList[index].imageLink,
                            width: 150,
                            height: 100,
                            fit: BoxFit.fill,
                            color: AppColor.purpleColor,
                            colorBlendMode: BlendMode.color,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productController.productList[index].name,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              productController.productList[index].brand,
                              style:
                                  TextStyle(fontSize: 14, color: AppColor.grey),
                            ),
                            Text(
                              productController.productList[index].category,
                              style:
                                  TextStyle(fontSize: 14, color: AppColor.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: AppColor.grey200,
                    height: 2,
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}
