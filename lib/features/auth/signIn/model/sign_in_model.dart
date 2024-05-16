
class Sign_in_model {

  late String email;
  late String password;


  Sign_in_model({required this.email, required this.password});


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
