import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_hris/core/constant.dart';

class OvertimeScreen extends StatefulWidget {
  @override
  State<OvertimeScreen> createState() => _OvertimeScreenState();
}

class _OvertimeScreenState extends State<OvertimeScreen> {
  final List<OvertimeRequest> overtimeRequests = [
    OvertimeRequest(
      message: 'I have to finish the project',
      date: '2022-12-13',
      duration: '1 hour 32 minutes',
      status: 'Approved',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Overtime',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overtime',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            ),
            SizedBox(height: 8),
            Text(
              'List of demand letter',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Ajukan Lembur" button press
                    Get.toNamed('/overtimes/add');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    'Ajukan Lembur',
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
                itemCount: overtimeRequests.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildOvertimeCard(overtimeRequests[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOvertimeCard(OvertimeRequest request) {
    Color statusColor;
    if (request.status == 'Approved') {
      statusColor = Colors.green;
    } else if (request.status == 'Rejected') {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.grey;
    }

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () => _showOvertimeDetails(context, request),
        contentPadding: EdgeInsets.all(16),
        title: Text(
          request.message.toString(),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(request.date,
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
                request.status,
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

  void _showOvertimeDetails(BuildContext context, OvertimeRequest request) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.grey),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overtime Request',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Text(
                'Date',
                style: TextStyle(color: Colors.grey),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Text(
                request.date,
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                'Message',
                style: TextStyle(color: Colors.grey),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              SizedBox(height: 8),
              Text(
                request.message,
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                'Start Time',
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                '-',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                'End Time',
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                '-',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                'Status',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: request.status == 'Approved'
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  request.status,
                  style: TextStyle(
                    color: request.status == 'Approved'
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
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
                '-',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class OvertimeRequest {
  final String date;
  final String message;
  final String duration;
  final String status;

  OvertimeRequest({
    required this.date,
    required this.message,
    required this.duration,
    required this.status,
  });
}
