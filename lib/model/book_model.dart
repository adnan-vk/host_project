class Bookmodel {
  String? id;
  String? bookname;
  String? author;
  String? description;
  int? price;
  String? category;
  String? image;
  List wishlist;
  Bookmodel(
      {this.id,
      required this.bookname,
      required this.author,
      required this.description,
      required this.price,
      this.image,
      required this.category,
      required this.wishlist});

  factory Bookmodel.fromjson(String id, Map<String, dynamic> json) {
    return Bookmodel(
        id: id,
        author: json['authour'],
        bookname: json['name'],
        description: json['description'],
        category: json['category'],
        price: json['price'],
        image: json['image'],
        wishlist: List<String>.from(json['wishlist']));
  }

  Map<String, dynamic> tojson() {
    return {
      'authour': author,
      'name': bookname,
      'description': description,
      "category": category,
      'price': price,
      'image': image,
      'wishlist': wishlist
    };
  }
}
