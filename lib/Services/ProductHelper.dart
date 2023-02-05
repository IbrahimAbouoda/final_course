import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/productModel.dart';


class ProductHelper{
  ProductHelper._();
  static ProductHelper productHelper = ProductHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String ProductCollectionName = 'Product';

  Future addProduct(ProductModel product) async {
    firestore.collection(ProductCollectionName).add(product.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getProduct() async {
    QuerySnapshot<Map<String, dynamic>> allProduct =
    await firestore.collection(ProductCollectionName).get();
    print('all product ...');
    return allProduct;
  }

  List<ProductModel> ProductList = [];

  getProduct2() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await ProductHelper.productHelper.getProduct();
    ProductList.clear();
    print('called 2');
    for (var element in snapshot.docs) {
      ProductList.add(ProductModel.fromJson(element.data()));
    }
    print('called3');
  }
}