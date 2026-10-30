class Jeepney {
  String route;
  int seats;
  double _farePrice; 

  Jeepney(this.route, this.seats, this._farePrice);

  double get farePrice => _farePrice;

  set farePrice(double newPrice) {
    if (newPrice > 0) {
      _farePrice = newPrice;
    }
  }

  void startEngine() {
    print('The jeepney on route "$route" is starting its engine.');
  }

  void displayDetails() {
    print('Route: $route | Seats: $seats | Current Fare: ₱$_farePrice');
  }
}

void main() {
  print('Running Week 9 Console OOP Program\n');

  List<Jeepney> jeepneyFleet = [
    Jeepney('Quirino - Quiapo', 20, 15.0),
    Jeepney('SM Manila - Baclaran', 18, 20.0),
  ];

  for (int i = 0; i < jeepneyFleet.length; i++) {
    print('--- Jeepney Instance #${i + 1} ---');
    jeepneyFleet[i].startEngine();
    jeepneyFleet[i].displayDetails();
    print('');
  }

  print('Updating fare price via encapsulation setter...');
  jeepneyFleet[0].farePrice = 16.0;
  print('New updated fare for Jeepney #1 (Quirino - Quiapo): ₱${jeepneyFleet[0].farePrice}');
}