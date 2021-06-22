class Login {
  final String success;
  final String? message;
  final String? token;

  Login({required this.success, required this.message, required this.token});

  factory Login.fromJSON(Map<String, dynamic> json){
    return Login(
      success:json["success"]!,
      message:json["message"],
      token:json["token"]
    );
  }
}

