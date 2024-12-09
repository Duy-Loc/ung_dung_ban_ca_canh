
import 'package:get/get.dart';

import '../../screen/home/home_screen.dart';
import 'routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.root,
      showCupertinoParallax: false,
      transition: Transition.fadeIn,
      page: () =>  HomeScreen(),
      
    ),
    // GetPage(
    //   name: Routes.editTabs,
    //   showCupertinoParallax: false,
    //   transition: Transition.fadeIn,
    //   page: () => const EditTabsScreen(),
    // ),
    // GetPage(
    //   name: Routes.focusProduct,
    //   showCupertinoParallax: false,
    //   transition: Transition.fadeIn,
    //   page: () => FocusProductScreen(
    //     items: Get.arguments,
    //   ),
    // ),
    // GetPage(
    //   name: Routes.cartTracking,
    //   showCupertinoParallax: false,
    //   transition: Transition.fadeIn,
    //   page: () => const CartTrackingScreen(),
    // ),
    // GetPage(
    //   name: Routes.cartTrackingDetail,
    //   showCupertinoParallax: false,
    //   transition: Transition.fadeIn,
    //   page: () => CartTrackingDetailScreen(),
    // ),
    // GetPage(
    //   name: Routes.cartOrderedReview,
    //   showCupertinoParallax: false,
    //   transition: Transition.fadeIn,
    //   page: () => CartOrderedReviewScreen(
    //     model: Get.arguments,
    //   ),
    // ),
  ];
}
