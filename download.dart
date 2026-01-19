Stream<int> downloadFile() async* {
  for (int progress = 0; progress <= 100; progress += 10) {
    await Future.delayed(Duration(seconds: 1));
    yield progress;
  }
}

void main() async {
  print("Download started...");

  await for (int progress in downloadFile()) {
    print("Download progress: $progress%");
  }

  print("Download completed!");
}