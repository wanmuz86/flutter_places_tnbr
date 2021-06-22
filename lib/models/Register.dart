class Register {
  final String message;
  Register({required this.message});

  factory Register.fromJson(Map<String,dynamic> json){
    return Register(
      message: json["message"]
    );
  }
}