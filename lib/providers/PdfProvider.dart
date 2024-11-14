


import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class PdfProvider extends ChangeNotifier {

  PdfController? _pdfController;
  bool _isloding=true;


  PdfController? get pdfController => _pdfController;
  bool get isLoding => _isloding;

  Future<void>  loadpdf(String url) async{
    _isloding =true;
    notifyListeners();

    try {
    final filedata= await InternetFile.get(url);
    _pdfController= PdfController(document: PdfDocument.openData(filedata));
    }
    catch (e){

    }
    _isloding=false;
    notifyListeners();
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

}