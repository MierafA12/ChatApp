class ChatUser {
  final String uid;
  final String fullName;
  final String email;
  final String phone;

  ChatUser({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'phone': phone,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
