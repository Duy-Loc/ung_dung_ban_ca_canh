import 'package:intl/intl.dart';

String formatCurrency(num amount) {
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'vi_VN', // Định dạng theo ngôn ngữ Việt Nam
    symbol: 'VND',   // Thêm ký hiệu tiền tệ
    decimalDigits: 0, // Không hiển thị phần thập phân
  );
  return formatter.format(amount);
}