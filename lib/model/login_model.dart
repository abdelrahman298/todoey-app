class LoginModel {
  bool? status;
  String? message;
  //لا تنسى ان النوع هنا هو نفس نوع الكلاس اللى تحت بتاع
  //LoginUserModel
  LoginUserModel? data;


  LoginModel.fromJson( Map<String, dynamic> json){
    status=json['status'];
    message = json['message'];
    //لو ال داتا مش
    // null
    // ابعتها لل
    // LoginUserModel
    data = json['data'] != null ? LoginUserModel.fromJson(json['data']) : null;
  }
}

class LoginUserModel{

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  // LoginUserModel ({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.image,
  //   this.points,
  //   this.credit,
  //   this.token,
  // });


  LoginUserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}



// "id": 11153,
// "name": "abdo mohamed",
// "email": "abdo10@gmail.com",
// "phone": "753951",
// "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
// "points": 0,
// "credit": 0,
// "token": "XXbR1TPuTO1AYtgyHbzkiWad7yy8wAJAvyVlgYY8KsFx8GSiivsRF4o2OD0LeTXBIDmhqg"