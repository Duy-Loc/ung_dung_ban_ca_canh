import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/model/fish_product.dart';
import 'package:ung_dung_ban_ca_canh/utils/core/app_service.dart';

class HomeController extends GetxController {
  var count = 0.obs;

  increment() => count++;

  decrement() => count--;
  RxList<FishModel> fishesAnc = <FishModel>[].obs;
  RxBool isloadingFish = false.obs;
  FetchClient apiService = FetchClient();

  handleFetchFishes(
      {required int page, required int pageSize, int? categoryId}) async {
    if (page == 1) {
      isloadingFish.value = true;
    }
    String path = categoryId != null
        ? '/products?Page=$page&PageSize=$pageSize&CategoryId=$categoryId'
        : '/products?Page=$page&PageSize=$pageSize';
    final response = await apiService.getData(
      path: path,
    );
    isloadingFish.value = false;
    List<FishModel> fishes = [];
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      fishes =
          List<FishModel>.from(response.data.map((x) => FishModel.fromJson(x)));
    }
    if (page == 1) {
      fishesAnc.value = fishes;
    } else {
      fishesAnc.value = [...fishesAnc, ...fishes];
    }
  }

  handleCreateFishes({required}) async {}
}
