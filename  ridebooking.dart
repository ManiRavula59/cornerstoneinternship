class Ride {
  bool isCancelled = false;

  Future<String> findDriver() async {
    await Future.delayed(Duration(seconds: 3));
    return "Driver Kumar assigned";
  }

  Stream<String> rideStatus() async* {
    List<String> updates = [
      "Driver arriving",
      "Ride started",
      "Ride in progress",
      "Ride completed"
    ];

    for (String status in updates) {
      if (isCancelled) {
        yield "Ride cancelled";
        break;
      }
      await Future.delayed(Duration(seconds: 2));
      yield status;
    }
  }

  void cancelRide() {
    isCancelled = true;
  }
}

void main() async {
  Ride ride = Ride();

  print("Searching for driver...");
  String driver = await ride.findDriver();
  print(driver);

  Stream<String> statusStream = ride.rideStatus();

  await for (String status in statusStream) {
    print(status);

    if (status == "Ride started") {
      // Uncomment to test cancellation
      // ride.cancelRide();
    }
  }
}