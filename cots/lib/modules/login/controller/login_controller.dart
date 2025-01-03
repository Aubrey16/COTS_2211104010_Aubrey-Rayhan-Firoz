import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneNumber = ''.obs;

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }
}
