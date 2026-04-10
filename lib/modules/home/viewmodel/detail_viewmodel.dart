import 'package:get/get.dart';

class DetailViewModel extends GetxController {
  // Reactive quantity counter
  RxInt quantity = 2.obs;

  // Reactive selected size index (0=10", 1=14", 2=16")
  RxInt selectedSizeIndex = 1.obs;

  // Reactive favorite toggle
  RxBool isFavorite = false.obs;

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void selectSize(int index) {
    selectedSizeIndex.value = index;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
