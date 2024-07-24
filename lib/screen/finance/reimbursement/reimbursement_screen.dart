import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_hris/controllers/overtime_ctrl.dart';
import 'package:mobile_hris/controllers/reimbursement_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';

class ReimbursementScreen extends StatefulWidget {
  @override
  State<ReimbursementScreen> createState() => _ReimbursementScreenState();
}

class _ReimbursementScreenState extends State<ReimbursementScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReimbursementCtrl>(
      init: ReimbursementCtrl(),
      builder: (reimbursementCtrl) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Reimbursement',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reimbursement',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Text(
                'List of reimbursement request',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Ajukan Lembur" button press
                      Get.toNamed('/reimbursement/add');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      'Ajukan Reimbursement',
                      style: TextStyle(color: Colors.white),
                      textScaler:
                          TextScaler.linear(ScaleSize.textScaleFactor(context)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: reimbursementCtrl.reimbursementData.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return reimbursementCtrl.reimbursementData.isEmpty
                        ? Center(
                            child: Text(
                              'No overtime request',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              textScaler: TextScaler.linear(
                                  ScaleSize.textScaleFactor(context)),
                            ),
                          )
                        : _buildReimbursementCard(
                            reimbursementCtrl.reimbursementData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReimbursementCard(request) {
    Color statusColor;
    if (request['status'] == 'approved') {
      statusColor = Colors.green;
    } else if (request['status'] == 'rejected') {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.orange;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: mutedColor.withOpacity(0.25)),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () => Get.toNamed('/reimbursement/detail', arguments: request),
        contentPadding: EdgeInsets.all(16),
        title: Text(
          request['title'].toString().split('T')[0],
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(request['amount'].toString(),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context))),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                request['status'].toString(),
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
            ),
          ],
        ),
        // trailing: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     SizedBox(height: 8),
        //     IconButton(
        //       icon: Icon(Icons.delete, color: primaryColor),
        //       onPressed: () {
        //         // Handle delete action
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
