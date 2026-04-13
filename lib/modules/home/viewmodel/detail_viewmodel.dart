import 'package:get/get.dart';

class DetailViewModel extends GetxController {
  RxInt quantity = 2.obs;

  RxInt selectedSizeIndex = 1.obs;

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
