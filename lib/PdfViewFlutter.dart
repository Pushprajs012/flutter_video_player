// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:vdo_player/providers/PdfProviderFlutter.dart';
//
//
// class PdfViewerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final pdfProvider = Provider.of<PdfProviderFlutter>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               '${pdfProvider.currentPage} / ${pdfProvider.totalPages}',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         ],
//       ),
//       body: pdfProvider.isLoading
//           ? Center(child: CircularProgressIndicator())
//           : pdfProvider.url != null
//           ? SfPdfViewer.network(
//         pdfProvider.url!,
//         onDocumentLoaded: (PdfDocumentLoadedDetails details) {
//           pdfProvider.updatePage(1,7);
//         },
//         onPageChanged: (PdfPageChangedDetails details) {
//           pdfProvider.updatePage(details.newPageNumber, pdfProvider.totalPages);
//         },
//       )
//           : Center(child: Text("No PDF URL provided")),
//     );
//   }
// }
