import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';
import 'package:vdo_player/providers/PdfProvider.dart';

class Pdfviewer extends StatelessWidget {
  final  String url;
  Pdfviewer({required  this.url});



  @override
  Widget build(BuildContext context) {
    final pfdProvider=Provider.of<PdfProvider>(context);

    Future<void> secureScreen() async{
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
    secureScreen();
    return Scaffold(body: pfdProvider.isLoding ?
      Center(child: CircularProgressIndicator(),)
      : Center(child: Text("Fail to load Pdf"),),
    floatingActionButton: FloatingActionButton(
    onPressed: () => pfdProvider.loadpdf(url),
    child: Icon(Icons.refresh),

      ));

  }
}
