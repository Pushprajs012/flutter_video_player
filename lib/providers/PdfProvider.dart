


import 'package:flutter/cupertino.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class PdfProvider extends ChangeNotifier {
  String? url;
  PdfController? _pdfController;
  bool _isloding = true;

  int currentPage = 1;
  int totalPages = 0;

  PdfController? get pdfController => _pdfController;
  bool get isLoding => _isloding;

  // PDF लोड करने का तरीका
  Future<void> loadpdf() async {
    _isloding = true;
    notifyListeners();

    try {
      if (url == null) {
        throw "URL is null";
      }
      String httpurl = url!.replaceAll("myapp", "http");
      print("PDF URL: $httpurl");

      final filedata = await InternetFile.get(httpurl);
      _pdfController = PdfController(document: PdfDocument.openData(filedata));

      // इस कोड में हम डॉक्यूमेंट लोड होने के बाद पेज की संख्या सेट कर रहे हैं
    } catch (e) {
      print("Error loading PDF: ${e.toString()}");
    }

    _isloding = false;
    notifyListeners();
  }

  // PdfView widget में onDocumentLoaded और onPageChanged कॉलबैक का उपयोग
  void onDocumentLoaded(PdfDocument document) {
    totalPages = document.pagesCount;
    notifyListeners();
  }

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }

  // Previous page पर जाएं
  void previousPage() {
    if (currentPage > 1) {
      _pdfController?.jumpToPage(currentPage - 1);
    }
  }

  // Next page पर जाएं
  void nextPage() {
    if (currentPage < totalPages) {
      _pdfController?.jumpToPage(currentPage + 1);
    }
  }

  // पेज को अपडेट करें
  void updatePage(int page) {
    currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  // PDF URL सेट करें
  void setPdfUrl(String deepLink) {
    url = deepLink;
  }
}
