// import 'package:flutter/material.dart';
//
// class PdfProviderFlutter extends ChangeNotifier {
//   String? url;
//   bool _isLoading = true;
//
//   int currentPage = 1;
//   int totalPages = 0;
//
//   bool get isLoading => _isLoading;
//
//   Future<void> setPdfUrl(String deepLink) async {
//     _isLoading = true;
//     notifyListeners();
//
//     try {
//       url = deepLink.replaceAll("myapp", "http");
//       print("Processed PDF URL: $url");
//
//       _isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       print("Error processing deep link URL: $e");
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   void updatePage(int page, int total) {
//     currentPage = page;
//     totalPages = total;
//     notifyListeners();
//   }
// }
