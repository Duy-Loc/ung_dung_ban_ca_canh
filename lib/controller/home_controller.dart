import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/utils/core/app_service.dart';



class HomeController extends GetxController {
  var count = 0.obs;

  increment() => count++;

  decrement() => count--;

  FetchClient apiService  =  FetchClient() ;  

  handleFetchFishes({required int page , required int pageSize , int? categoryId}) async {
    String path = categoryId != null  ? '/products?Page=$page&PageSize=$pageSize&CategoryId=$categoryId' : '/products?Page=$page&PageSize=$pageSize' ;   
    var response =  await apiService.getData(path:path) ;  
    return response  ;  
  }


  handleCreateFishes({required }) async {
     
  }


}
