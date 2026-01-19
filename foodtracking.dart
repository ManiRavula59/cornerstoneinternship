class FoodOrder {
  bool isCancelled = false;

  Future<void> confirmOrder() async {
    print("Placing order...");
    await Future.delayed(Duration(seconds: 2));
    print("Order confirmed");
  }

  Stream<String> orderStatus() async* {
    List<String> statuses = [
      "Food is being prepared",
      "Out for delivery",
      "Delivered"
    ];

    for (String status in statuses) {
      if (isCancelled) {
        yield "Order cancelled";
        break;
      }
      await Future.delayed(Duration(seconds: 2));
      yield status;
    }
  }

  void cancelOrder() {
    isCancelled = true;
  }
}

void main() async {
  FoodOrder order = FoodOrder();

  await order.confirmOrder();

  await for (String status in order.orderStatus()) {
    print(status);

    if (status == "Food is being prepared") {
      // order.cancelOrder(); // test cancel
    }
  }
}