/// Model for longitude & location.
class Position {
  Position({
    required this.longitude,
    required this.latitude,
  });

  double latitude;
  double longitude;

  factory Position.fromJson(Map json) {
    double long = double.parse(json['longitude']);
    double lat = double.parse(json['latitude']);
    return Position(
      longitude: long,
      latitude: lat,
    );
  }

  @override
  String toString() {
    return 'Latitude: $latitude\nLongitude: $longitude';
  }
}
