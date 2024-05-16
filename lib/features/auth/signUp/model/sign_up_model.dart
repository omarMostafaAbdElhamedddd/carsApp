
class Sign_in_model {

  late String email;
  late String password;
  late String name ;


  Sign_in_model({required this.email, required this.password , required this.name});


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name' : name ,
    };
  }
}
