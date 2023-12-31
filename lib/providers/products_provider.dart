import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/firebase/products_service.dart';
import 'package:ecommerce_app/data/models/product/product_model.dart';
import 'package:flutter/material.dart';

import '../data/models/universal_data.dart';
import '../utils/ui_utils/loading_dialog.dart';

class ProductsProvider with ChangeNotifier {
  ProductsProvider(
    this.productService,
  );

  final ProductService productService;

  TextEditingController ProductsNamecontroller = TextEditingController();
  TextEditingController ProductsCountcontroller = TextEditingController();
  TextEditingController ProductsPricecontroller = TextEditingController();
  TextEditingController ProductsCurrencycontroller = TextEditingController();
  TextEditingController ProductsDesccontroller = TextEditingController();

  Future<void> addProducts({
    required BuildContext context,
    required ProductModel productModel,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await ProductService.addProduct(productModel: productModel);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> updateProducts({
    required BuildContext context,
    required ProductModel productModel,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await ProductService.updateProduct(productModel: productModel);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> deleteProducts({
    required BuildContext context,
    required String productsId,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await ProductService.deleteProduct(productId: productsId);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Stream<List<ProductModel>> getProducts() =>
      FirebaseFirestore.instance.collection("products").snapshots().map(
            (event1) => event1.docs
                .map((doc) => ProductModel.fromJson(doc.data()))
                .toList(),
          );

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    notifyListeners();
  }
}
