class HomeResponse{
  bool? status;
  String? message;
  HomeDataBean? data;

  HomeResponse.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = HomeDataBean.fromJson(json['data']);
  }
}

class HomeDataBean{
  List<BannerData>? banners = [];
  List<ProductData>? products = [];
  String? ad;

  HomeDataBean.fromJson(Map<String,dynamic> json){
    json['banners'].forEach((element)=>banners?.add(BannerData.fromJson(element)));
    json['products'].forEach((element)=>products?.add(ProductData.fromJson(element)));
    ad = json['add'];
  }
}

class BannerData{
  int? id;
  String? image;

  BannerData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}

class ProductData{

  int? id;
  num? price;
  num? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  bool? isFav;
  bool? inCart;

  ProductData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    isFav = json['in_favorites'];
    inCart = json['in_cart'];
  }
}