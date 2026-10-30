abstract class FareCalculator {
  double computeTotalFare(int distanceKm);
}

mixin GPSUnit {
  void trackLocation() {
    print('GPS active: Broadcasting real-time coordinates to dispatch.');
  }
}

class Vehicle {
  String route;
  int passengerCapacity;
  double _fare;

  Vehicle(this.route, this.passengerCapacity, this._fare);

  double get fare => _fare;

  set fare(double value) {
    if (value > 0) {
      _fare = value;
    }
  }

  void runEngine() {
    print('Vehicle on route "$route" starting up...');
  }

  void showInfo() {
    print('Route: $route | Capacity: $passengerCapacity | Base Fare: ₱$_fare');
  }
}

class TraditionalJeepney extends Vehicle implements FareCalculator {
  TraditionalJeepney(String route, int capacity, double fare) 
      : super(route, capacity, fare);

  @override
  void runEngine() {
    print('Traditional Jeep for "$route" starts');
  }

  @override
  double computeTotalFare(int distanceKm) {
    return fare + (distanceKm * 2.0);
  }
}

class ModernJeepney extends Vehicle with GPSUnit implements FareCalculator {
  ModernJeepney(String route, int capacity, double fare) 
      : super(route, capacity, fare);

  @override
  void runEngine() {
    print('Modern e-Jeep for "$route" powers on quietly');
  }

  @override
  double computeTotalFare(int distanceKm) {
    return fare + (distanceKm * 2.5);
  }
}

void main() {
  List<Vehicle> myFleet = [
    TraditionalJeepney('Quirino - Quiapo', 20, 15.0),
    ModernJeepney('SM Manila - Baclaran', 18, 20.0),
  ];

  for (var v in myFleet) {
    v.showInfo();
    v.runEngine();
    
    if (v is FareCalculator) {
      print('Calculated Fare for 5km: ₱${(v as FareCalculator).computeTotalFare(5)}\n');
    }
  }

  ModernJeepney modernJeep = myFleet[1] as ModernJeepney;
  modernJeep.trackLocation();
}