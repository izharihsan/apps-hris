import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              '22:10',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Waktu Indonesia Barat',
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
                  colors: [Color(0xFF7F1E1C), Color(0xFF3B1F4C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: MaterialButton(
                shape: CircleBorder(),
                onPressed: () {
                  // Handle clock-in action
                },
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Icon(Icons.logout, color: Colors.white, size: 48),
                    SizedBox(height: 8),
                    Text(
                      'CLOCK IN',
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
                _buildInfoColumn(Icons.access_time, 'Clock In time', '--:--'),
                _buildInfoColumn(Icons.exit_to_app, 'Clock out time', '--:--'),
                _buildInfoColumn(Icons.timelapse, 'Duration', '--:--'),
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
                        'Gg. Satria II, Sokayasa, RT04/RW01, Kec. Purwokerto Tim.,\nKabupaten Banyumas, Jawa Tengah 53146. H7C5+RX',
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
          ],
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
}
