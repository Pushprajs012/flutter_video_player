

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';
import 'package:vdo_player/providers/PdfProvider.dart';

class PdfViewer extends StatefulWidget {
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pdfProvider = Provider.of<PdfProvider>(context, listen: false);
      pdfProvider.loadpdf();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pdfProvider = Provider.of<PdfProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PDF'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${pdfProvider.currentPage} / ${pdfProvider.totalPages}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (pdfProvider.currentPage > 1) {
                pdfProvider.previousPage();
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              if (pdfProvider.currentPage < pdfProvider.totalPages) {
                pdfProvider.nextPage();
              }
            },
          ),
        ],
      ),
      body: pdfProvider.isLoding
          ? Center(child: CircularProgressIndicator())
          : pdfProvider.pdfController == null
          ? Center(child: Text("Failed to load PDF"))
          : PdfView(
        controller: pdfProvider.pdfController!,
        onDocumentLoaded: pdfProvider.onDocumentLoaded,
        onPageChanged: pdfProvider.onPageChanged,
      ),
    );
  }
}
