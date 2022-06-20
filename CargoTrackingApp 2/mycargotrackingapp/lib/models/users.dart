class User {
   String email;
   String password;
   String kadmin; 
   
  User({
    required this.email,
    required this.password,
    required this.kadmin,
  });

  Map<String, dynamic> toJson()=>{

    'K_email':email,
    'K_password':password,
    'K_yetki':kadmin,
  };
}