class ProductModel {
  String? id, price, name, img,details;

  ProductModel({this.id, this.price, this.name, this.img,this.details});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['price'] = this.price;
    data['img'] = this.img;
    return data;
  }

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    img = json['img'];
  }
}
