class Delivery {
  String id;
  final String title;
  final int weight;
  final int quantity;
  final String pickup;
  final String destination;

  Delivery({
    this.id = '',
    required this.title,
    required this.weight,
    required this.quantity,
    required this.pickup,
    required this.destination,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'weight': weight,
        'quantity': quantity,
        'pickup': pickup,
        'destination': destination,
      };

  static Delivery fromJson(Map<String, dynamic> json) => Delivery(
        id: json['id'],
        title: json['title'],
        weight: json['weight'],
        quantity: json['quantity'],
        pickup: json['pickup'],
        destination: json['destination'],
      );
}
