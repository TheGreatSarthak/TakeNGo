class Profile {
  String id;
  final String name;
  final String mail;
  final int mobile;

  Profile({
    this.id = '',
    required this.name,
    required this.mail,
    required this.mobile,
  });

  Map<String, dynamic> toJson() => {
          'id': id,
          'name': name,
          'mail': mail,
          'mobile': mobile,
        };
}
