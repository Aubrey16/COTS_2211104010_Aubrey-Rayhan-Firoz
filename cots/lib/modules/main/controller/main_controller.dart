import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;
  var searchText = ''.obs;

  void updateSearchText(String value) {
    searchText.value = value;
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
