/// id : 0
/// firstName : "Daenerys"
/// lastName : "Targaryen"
/// fullName : "Daenerys Targaryen"
/// title : "Mother of Dragons"
/// family : "House Targaryen"
/// image : "daenerys.jpg"
/// imageUrl : "https://thronesapi.com/assets/images/daenerys.jpg"

class Results {
  Results({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.fullName, 
      this.title, 
      this.family, 
      this.image, 
      this.imageUrl,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    title = json['title'];
    family = json['family'];
    image = json['image'];
    imageUrl = json['imageUrl'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? title;
  String? family;
  String? image;
  String? imageUrl;
Results copyWith({  int? id,
  String? firstName,
  String? lastName,
  String? fullName,
  String? title,
  String? family,
  String? image,
  String? imageUrl,
}) => Results(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  fullName: fullName ?? this.fullName,
  title: title ?? this.title,
  family: family ?? this.family,
  image: image ?? this.image,
  imageUrl: imageUrl ?? this.imageUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['fullName'] = fullName;
    map['title'] = title;
    map['family'] = family;
    map['image'] = image;
    map['imageUrl'] = imageUrl;
    return map;
  }

}