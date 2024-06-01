import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_hris/components/custom_components.dart';
import 'package:mobile_hris/controllers/attendance_ctrl.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String? _timeString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceCtrl>(
      init: AttendanceCtrl(),
      builder: (attendCtrl) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Live Attendance',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                _timeString!,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Waktu Lokal Indonesia',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: attendCtrl.attendData != {} &&
                            attendCtrl.attendData['end_time'] != null
                        ? [
                            Colors.grey,
                            Colors.grey,
                          ]
                        : [Color(0xFF7F1E1C), Color(0xFF3B1F4C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: MaterialButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    // Handle clock-in action
                    if (attendCtrl.attendData != {} &&
                        attendCtrl.attendData['end_time'] != null) {
                      Get.snackbar(
                          'Attendance', 'You have already clocked out');
                    } else if (attendCtrl.attendData != {} &&
                        attendCtrl.attendData['start_time'] != null) {
                      showCustomDialog(
                        context,
                        'Are you sure you want to clock out?',
                        () => attendCtrl.handleClockOut(),
                      );
                    } else {
                      // Clock in
                      attendCtrl.openCameraAndHandleAttend();
                    }
                  },
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Icon(Icons.logout, color: Colors.white, size: 48),
                      SizedBox(height: 8),
                      Text(
                        attendCtrl.attendData != {} &&
                                attendCtrl.attendData['start_time'] != null
                            ? 'CLOCK OUT'
                            : 'CLOCK IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInfoColumn(
                      Icons.access_time,
                      'Clock In time',
                      attendCtrl.attendData != {} &&
                              attendCtrl.attendData['start_time'] != null
                          ?
                          // get only HH:mm from the time
                          attendCtrl.attendData['start_time']
                                  .toString()
                                  .split(':')[0] +
                              ':' +
                              attendCtrl.attendData['start_time']
                                  .toString()
                                  .split(':')[1]
                          : '--:--'),
                  _buildInfoColumn(
                      Icons.exit_to_app,
                      'Clock out time',
                      attendCtrl.attendData != {} &&
                              attendCtrl.attendData['end_time'] != null
                          ?
                          // get only HH:mm from the time
                          attendCtrl.attendData['end_time']
                                  .toString()
                                  .split(':')[0] +
                              ':' +
                              attendCtrl.attendData['end_time']
                                  .toString()
                                  .split(':')[1]
                          : '--:--'),
                  _buildInfoColumn(Icons.timelapse, 'Duration',
                      attendCtrl.getDurationTimeFromStartTimeAndEndTime()),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${attendCtrl.address ?? '--'}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 36, color: Colors.red),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}
