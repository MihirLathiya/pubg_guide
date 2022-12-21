import 'package:get/get.dart';

class BottomController extends GetxController {
  RxInt selectedPage = 0.obs;

  selectItem(index) {
    selectedPage.value = index;
    update();
  }
}
