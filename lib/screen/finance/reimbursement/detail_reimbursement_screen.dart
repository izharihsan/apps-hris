import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_hris/components/custom_components.dart';
import 'package:mobile_hris/controllers/detail_overtime_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';

class ReimbursementDetailScreen extends StatefulWidget {
  const ReimbursementDetailScreen({super.key});

  @override
  State<ReimbursementDetailScreen> createState() =>
      _ReimbursementDetailScreenState();
}

class _ReimbursementDetailScreenState extends State<ReimbursementDetailScreen> {
  var id = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detail Reimbursement'),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.grey),
          // ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reimbursement Name',
                style: TextStyle(color: Colors.grey),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Text(
                Get.arguments['title'].toString(),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 8),
              Text(
                'Tanggal Submit',
                style: TextStyle(color: Colors.grey),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Text(
                Get.arguments['date'].toString(),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                'Description',
                style: TextStyle(color: Colors.grey),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Text(
                Get.arguments['description'].toString(),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                'Amount',
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                '${Get.arguments['amount'] ?? '-'}',
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Divider(),
              Text(
                'Status',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Get.arguments['status'] == 'approved'
                      ? Colors.green.withOpacity(0.2)
                      : Get.arguments['status'] == 'rejected'
                          ? Colors.red.withOpacity(0.2)
                          : Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  Get.arguments['status'] == 'approved'
                      ? 'Approved'
                      : Get.arguments['status'] == 'rejected'
                          ? 'Rejected'
                          : 'Pending',
                  style: TextStyle(
                    color: Get.arguments['status'] == 'approved'
                        ? Colors.green
                        : Get.arguments['status'] == 'rejected'
                            ? Colors.red
                            : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaler:
                      TextScaler.linear(ScaleSize.textScaleFactor(context)),
                ),
              ),
              Divider(),
              Text(
                'Response Note',
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                Get.arguments['response_note'] ?? '-',
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              Divider(),
              Text(
                'Lampiran Reimbursement',
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Get.arguments['attachment'] == null
                  ? Text('No Image')
                  : Image.network(
                      '$publicUrl/image/reimbursement/${Get.arguments['attachment']}',
                      // width: 100,
                      // height: 100,
                    ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
