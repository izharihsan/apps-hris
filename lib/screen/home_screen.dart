import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_hris/components/custom_components.dart';
import 'package:mobile_hris/controllers/home_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeCtrl2 = Get.put(HomeCtrl());
    homeCtrl2.getUserAttendance();
    return GetBuilder<HomeCtrl>(
      init: HomeCtrl(),
      builder: (homeCtrl) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: blueDeepColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          selectedLabelStyle: TextStyle(color: blueDeepColor),
          elevation: 20,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, primaryColor2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,\n${GetStorage().read('user_name') ?? 'Employee'}!',
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "it's " + homeCtrl.getTimeNow().toString(),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset(
                        'assets/home_illus.svg',
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Card(
                      color: Color(0xff003049),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${homeCtrl.dayString.toUpperCase()} \n${homeCtrl.dateNumber}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textScaler: TextScaler.linear(
                                        ScaleSize.textScaleFactor(context))),
                                Column(
                                  children: [
                                    Text('Clock In',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textScaler: TextScaler.linear(
                                            ScaleSize.textScaleFactor(
                                                context))),
                                    Text(
                                      homeCtrl2.attendData != {} &&
                                              homeCtrl2.attendData[
                                                      'start_time'] !=
                                                  null
                                          ?
                                          // get only HH:mm from the time
                                          homeCtrl2.attendData['start_time']
                                                  .toString()
                                                  .split(':')[0] +
                                              ':' +
                                              homeCtrl2.attendData['start_time']
                                                  .toString()
                                                  .split(':')[1]
                                          : '--:--',
                                      textScaler: TextScaler.linear(
                                          ScaleSize.textScaleFactor(context)),
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Clock Out',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textScaler: TextScaler.linear(
                                            ScaleSize.textScaleFactor(
                                                context))),
                                    Text(
                                      homeCtrl2.attendData != {} &&
                                              homeCtrl2
                                                      .attendData['end_time'] !=
                                                  null
                                          ?
                                          // get only HH:mm from the time
                                          homeCtrl2.attendData['end_time']
                                                  .toString()
                                                  .split(':')[0] +
                                              ':' +
                                              homeCtrl2.attendData['end_time']
                                                  .toString()
                                                  .split(':')[1]
                                          : '--:--',
                                      textScaler: TextScaler.linear(
                                          ScaleSize.textScaleFactor(context)),
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor: Color(0xff669BBC)),
                                    onPressed: () {
                                      Get.toNamed('/attendance');
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/alarm.svg',
                                            width: 50),
                                        SizedBox(height: 3),
                                        Text('Absen',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            textScaler: TextScaler.linear(
                                                ScaleSize.textScaleFactor(
                                                    context))),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFeatureIcon(Icons.assignment,
                                'Attendance\nRecord', context),
                            _buildFeatureIcon(Icons.account_balance_wallet,
                                'Finance', context),
                            _buildFeatureIcon(
                                Icons.timelapse, 'Time Off', context),
                            _buildFeatureIcon(
                                Icons.payment, 'Payslip', context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Staffing',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildListTile('Overtimes', Icons.timer, Colors.blue,
                        context, '/overtimes'),
                    _buildListTile('Schedule', Icons.schedule, primaryColor,
                        context, '/schedules'),
                    _buildListTile(
                      'Reimbursement',
                      Icons.receipt_long,
                      Colors.green,
                      context,
                      '/reimbursements',
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData iconData, String label, context) {
    return Column(
      children: [
        // icon with circle background
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(height: 4),
        Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context))),
      ],
    );
  }

  Widget _buildListTile(
      String title, IconData icon, Color iconColor, context, routeName) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          // Handle navigation or action
          Get.toNamed(routeName);
        },
      ),
    );
  }
}
