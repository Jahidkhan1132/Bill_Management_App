// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'package:open_filex/open_filex.dart';
//
// class PrintBillScreen extends StatelessWidget {
//   final Map<String, dynamic> bill;
//
//   const PrintBillScreen({Key? key, required this.bill}) : super(key: key);
//
//   Future<void> _generateAndPreviewPDF(BuildContext context) async {
//     final pdf = pw.Document();
//
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(
//                 'Invoice',
//                 style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text('Customer: ${bill['customerName']}',
//                   style: pw.TextStyle(fontSize: 16)),
//               pw.Text('Contact: ${bill['customerContact']}',
//                   style: pw.TextStyle(fontSize: 16)),
//               pw.Text('Date: ${bill['date']}',
//                   style: pw.TextStyle(fontSize: 16)),
//               pw.Divider(),
//               pw.Text('Items:',
//                   style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//               pw.Table(
//                 border: pw.TableBorder.all(),
//                 children: [
//                   pw.TableRow(
//                     children: [
//                       pw.Text('Item', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.Text('Quantity',
//                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.Text('Unit Price',
//                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.Text('Total', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                     ],
//                   ),
//                   ...bill['items'].map<pw.TableRow>((item) {
//                     return pw.TableRow(
//                       children: [
//                         pw.Text(item['itemName']),
//                         pw.Text(item['quantity'].toString()),
//                         pw.Text('₹${item['unitPrice'].toStringAsFixed(2)}'),
//                         pw.Text('₹${item['totalPrice'].toStringAsFixed(2)}'),
//                       ],
//                     );
//                   }).toList(),
//                 ],
//               ),
//               pw.Divider(),
//               pw.Text('Total Amount: ₹${bill['totalAmount'].toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 10),
//               pw.Text('Status: ${bill['status']}',
//                   style: pw.TextStyle(
//                     fontSize: 16,
//                     color: bill['status'] == 'Paid'
//                         ? PdfColor.fromInt(0xFF008000) // Green for Paid
//                         : PdfColor.fromInt(0xFFFF0000), // Red for Unpaid
//                   )),
//             ],
//           );
//         },
//       ),
//     );
//
//     try {
//       final output = await getTemporaryDirectory();
//       final file = File('${output.path}/bill_${bill['customerName']}.pdf');
//       await file.writeAsBytes(await pdf.save());
//
//       // Preview the PDF
//       await OpenFilex.open(file.path);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error generating PDF: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bill Details'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Customer: ${bill['customerName']}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text('Contact: ${bill['customerContact']}'),
//             Divider(),
//             Text(
//               'Items:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: bill['items'].length,
//                 itemBuilder: (context, index) {
//                   final item = bill['items'][index];
//                   return ListTile(
//                     title: Text(item['itemName']),
//                     subtitle: Text('Quantity: ${item['quantity']}'),
//                     trailing: Text('₹${item['totalPrice'].toStringAsFixed(2)}'),
//                   );
//                 },
//               ),
//             ),
//             Divider(),
//             Text(
//               'Total Amount: ₹${bill['totalAmount'].toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () => _generateAndPreviewPDF(context),
//                 child: Text('Generate & Preview Bill'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
