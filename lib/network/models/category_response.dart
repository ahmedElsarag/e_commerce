class CategoryResponse {
  bool? status;
  String? message;
  Data? data;

  CategoryResponse({this.status, this.message, this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CategoryDataBean>? data;

  Data(
      {this.data,});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryDataBean>[];
      json['data'].forEach((v) {
        data!.add(CategoryDataBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryDataBean {
  int? id;
  String? name;
  String? image;

  CategoryDataBean({this.id, this.name, this.image});

  CategoryDataBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}