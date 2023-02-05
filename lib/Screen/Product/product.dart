import 'package:flutter/material.dart';
import '../../Services/ProductHelper.dart';
import '../../models/productModel.dart';
import 'component/ProductCard.dart';
import 'component/product_details.dart';
class Product extends StatefulWidget {
  const Product({Key?key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // List<ProductModel> product = [
  //   ProductModel(details: "Numeric Flashcard For Kids is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more. \n or-less normal distribution of letters, as opposed to using 'Content here, content here, making it look like readable English. ",img: "assets/images/moon.jpg",name: "Numeric Flashcard For Kids",price: "3.87 KWD",id: "${ProductHelper.productHelper.firestore.collection('product').doc('id')}"),
  //   ProductModel(details: "The Earth Ceramic Coffee Mug is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more. \n or-less normal distribution of letters, as opposed to using 'Content here, content here, making it look like readable English. ",img: "assets/images/moon.jpg",name: "The Earth Ceramic Coffee Mug",price: "280 KWD",id: "${ProductHelper.productHelper.firestore.collection('product').doc('id')}"),
  // ];
  Future awaitProduct() async {
    await ProductHelper.productHelper.getProduct2();
  }
  add(){
  ProductHelper.productHelper.addProduct(ProductModel(
      details: "Numeric Flashcard For Kids2 is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more. \n or-less normal distribution of letters, as opposed to using 'Content here, content here, making it look like readable English. ",
      img: "assets/images/moon.jpg",
      name: "Numeric Flashcard For Kids2",
      price: "3.87 KWD",
      id: "1"));
  ProductHelper.productHelper.addProduct(ProductModel(
      details: "Numeric Flashcard For Kids1 is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more. \n or-less normal distribution of letters, as opposed to using 'Content here, content here, making it look like readable English. ",
      img: "assets/images/moon.jpg",
      name: "Numeric Flashcard For Kids1",
      price: "3.87 KWD",
      id: "2"));
  ProductHelper.productHelper.addProduct(ProductModel(
      details: "Numeric Flashcard For Kids3 is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more. \n or-less normal distribution of letters, as opposed to using 'Content here, content here, making it look like readable English. ",
      img: "assets/images/moon.jpg",
      name: "Numeric Flashcard For Kids3",
      price: "3.87 KWD",
      id: "3"));
  ProductHelper.productHelper.addProduct(ProductModel(
      details: "Numeric Flashcard For Kids4 is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more. \n or-less normal distribution of letters, as opposed to using 'Content here, content here, making it look like readable English. ",
      img: "assets/images/moon.jpg",
      name: "Numeric Flashcard For Kids4",
      price: "3.87 KWD",
      id: "4"));

  }

  //init state order the data at  before the ui created
  @override
  void initState() {
    super.initState();
    // add();
    awaitProduct();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          child:  ProductHelper.productHelper.ProductList.isEmpty  ? Column(
            children: [
              // Center(child: CircularProgressIndicator(),),
              ElevatedButton(onPressed: (){
                setState(() {  });

              }, child: Text('refresh'))
            ],
          ): ListView.builder(
            itemCount: ProductHelper.productHelper.ProductList.length,
            itemBuilder: (context,index){
              return
                              ProductCard(
                                image: ProductHelper.productHelper.ProductList[index].img!,
                                category:ProductHelper.productHelper.ProductList[index].name!,
                                body: ProductHelper.productHelper.ProductList[index].price!,
                                press: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProductDetails(name:ProductHelper.productHelper.ProductList[index].name! ,
                                      price:ProductHelper.productHelper.ProductList[index].price! ,
                                      about: ProductHelper.productHelper.ProductList[index].details!,
                                      img: ProductHelper.productHelper.ProductList[index].img!,
                                    );
                                  }));
                                },
                              );
            },
    //       children: [
    //     Container(
    //       child: Column(
    //         children: [
    //           Container(
    //             padding:
    //             const EdgeInsets.only(top: 30,left: 20),
    //             alignment: Alignment.centerLeft,
    //           ),
    //           SingleChildScrollView(
    //             scrollDirection: Axis.horizontal,
    //             child: Column(
    //               children: [
    //                 ElevatedButton(onPressed: (){
    //
    //                   ProductHelper.productHelper.addProduct(    ProductModel(details: "Numeric Flashcard For Kids is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more. \n or-less normal distribution of letters, as opposed to using 'Content here, content here, making it look like readable English. ",img: "assets/images/moon.jpg",name: "Numeric Flashcard For Kids",price: "3.87 KWD"),
    //                   );
    //                 }, child: Text("add")),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //                 ProductCard(
    //                   image: "assets/images/moon.jpg",
    //                   category: "The Earth Ceramic Coffee Mug",
    //                   body: "280 KWD",
    //                   press: () {},
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //               ),
    // ),

      //
      // ],
    ),
        ),
    );
  }

}


