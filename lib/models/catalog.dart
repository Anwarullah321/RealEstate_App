
class UserModel{
  final int id;
  final String name;
  final String desc;
  final String type;
  final String price;
  final String image;
  UserModel({required this.id, required this.name, required this.desc,
    required this.type, required this.price, required this.image
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      type: map['type'] as String,
      price: map['price'] as String,
      image: map['image'] as String,
    );
  }

}
