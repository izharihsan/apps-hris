import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_hris/components/custom_components.dart';
import 'package:mobile_hris/controllers/profile_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';
import 'package:mobile_hris/screen/auth/login_screen.dart';

class ProfileInformationScreen extends StatefulWidget {
  @override
  State<ProfileInformationScreen> createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  // dispose
  @override
  void dispose() {
    Get.delete<ProfileCtrl>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileCtrl2 = Get.put(ProfileCtrl());
    profileCtrl2.getUserData();
    return GetBuilder<ProfileCtrl>(
      init: ProfileCtrl(),
      builder: (profileCtrl) => Scaffold(
        bottomNavigationBar:
            customBottomNavigationBar(context: context, currentIndex: 3),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile_img.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${profileCtrl.userdata['name'] ?? 'Employee'}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context)),
                        ),
                        Text(
                          '${profileCtrl.userdata['email'] ?? ''}',
                          style: TextStyle(color: Colors.grey),
                          textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context)),
                        ),
                      ],
                    ),
                    // Spacer(),
                    IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.camera_alt, color: Colors.red),
                      onPressed: () {
                        // Add functionality to change profile picture
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Personal details card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Personal details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaler: TextScaler.linear(
                                  ScaleSize.textScaleFactor(context)),
                            ),
                            Spacer(),
                            IconButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                // Get.snackbar(
                                //     'Personal Details', 'Fitur segera hadir');
                                // Add functionality to edit personal details
                                Get.toNamed('/profile/edit/personal',
                                    arguments: {
                                      'name': profileCtrl.userdata['name'],
                                      'birth_date':
                                          profileCtrl.userdata['employee']
                                              ['tanggal_lahir'],
                                      'status_pernikahan':
                                          profileCtrl.userdata['employee']
                                              ['status_pernikahan'],
                                      'bod': profileCtrl.userdata['employee']
                                          ['tanggal_lahir'],
                                      'gender': profileCtrl.userdata['employee']
                                          ['jenis_kelamin'],
                                      'employee_id': profileCtrl
                                              .userdata['employee']['id'] ??
                                          '',
                                      'nationality': 'Indonesia',
                                    });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow('Nama Lengkap',
                            '${profileCtrl.userdata['name'] ?? ''}', context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'ID Karyawan',
                            '${profileCtrl.userdata['employee']?['id'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Sisa Cuti',
                            '${profileCtrl.userdata['employee']?['sisa_cuti'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Kewarganegaraan', 'Indonesia', context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Status Pernikahan',
                            '${profileCtrl.userdata['employee']?['status_pernikahan'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Tanggal Lahir',
                            '${profileCtrl.userdata['employee']?['tanggal_lahir'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Jenis Kelamin',
                            '${profileCtrl.userdata['employee']?['jenis_kelamin'] ?? ''}',
                            context),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Contact details card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Contact details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaler: TextScaler.linear(
                                  ScaleSize.textScaleFactor(context)),
                            ),
                            Spacer(),
                            IconButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                // Add functionality to edit contact details
                                Get.toNamed('/profile/edit/contact',
                                    arguments: {
                                      'alamat': profileCtrl.userdata['alamat'],
                                      'province_id':
                                          profileCtrl.userdata['employee']
                                                  ['province']?['id'] ??
                                              '',
                                      'city_id':
                                          profileCtrl.userdata['employee']
                                                  ['city']?['id'] ??
                                              '',
                                      'district_id':
                                          profileCtrl.userdata['employee']
                                                  ['district']?['id'] ??
                                              '',
                                      'village_id':
                                          profileCtrl.userdata['employee']
                                                  ['village']?['id'] ??
                                              '',
                                      'kode_pos':
                                          profileCtrl.userdata['employee']
                                                  ['kode_pos'] ??
                                              '',
                                      'rt_rw':
                                          '${profileCtrl.userdata['employee']?['rt'] ?? ''}/${profileCtrl.userdata['employee']?['rw'] ?? ''}',
                                      'telpon': profileCtrl.userdata['employee']
                                          ['telpon'],
                                    });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow('Alamat',
                            '${profileCtrl.userdata['alamat'] ?? ''}', context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Provinsi',
                            '${profileCtrl.userdata['employee']?['province']?['name'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Kota/Kab',
                            '${profileCtrl.userdata['employee']?['city']?['name'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Kecamatan',
                            '${profileCtrl.userdata['employee']?['district']?['name'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Kelurahan',
                            '${profileCtrl.userdata['employee']?['village']?['name'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Kode Pos',
                            '${profileCtrl.userdata['employee']?['kode_pos'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'RT/RW',
                            '${profileCtrl.userdata['employee']?['rt'] ?? ''}/${profileCtrl.userdata['employee']?['rw'] ?? ''}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Telpon',
                            '${profileCtrl.userdata['employee']?['telpon'] ?? ''}',
                            context),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),
                // Account bank details card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Account bank details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaler: TextScaler.linear(
                                  ScaleSize.textScaleFactor(context)),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        _buildDetailRow(
                            'Nama Bank',
                            '${profileCtrl.userdata['employee']?['bank_account'] == null ? '' : profileCtrl.userdata['employee']?['bank_account']?['bank_name']}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'No Rekening',
                            '${profileCtrl.userdata['employee']?['bank_account'] == null ? '' : profileCtrl.userdata['employee']?['bank_account']?['account_number']}',
                            context),
                        Divider(height: 2),
                        _buildDetailRow(
                            'Atas Nama',
                            '${profileCtrl.userdata['employee']?['bank_account'] == null ? '' : profileCtrl.userdata['employee']?['bank_account']?['account_name']}',
                            context),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),
                // Schedules details card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Jadwal Kerja',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaler: TextScaler.linear(
                                  ScaleSize.textScaleFactor(context)),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // foreach from profileCtrl.scheduleData
                        profileCtrl.scheduleData.length > 0
                            ? Column(
                                children: [
                                  for (var schedule
                                      in profileCtrl.scheduleData.entries)
                                    Column(
                                      children: [
                                        _buildDetailRow(
                                            '${schedule.value['day']}',
                                            '${schedule.value['shift']['start_time'].toString().substring(0, 5)} - ${schedule.value['shift']['end_time'].toString().substring(0, 5)}',
                                            context),
                                        Divider(height: 2),
                                      ],
                                    )
                                ],
                              )
                            : Text('No schedule data found'),
                      ],
                    ),
                  ),
                ),

                // button width 100 wrap with column for document management, family, and education with arrow right icon
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed('/profile/document');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Document Management',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context)),
                      ),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  ),
                ),

                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed('/profile/family');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Keluarga',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context)),
                      ),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  ),
                ),

                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed('/profile/education');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pendidikan',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context)),
                      ),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  ),
                ),

                // signout button
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to sign out
                    showLogoutDialog(
                        context, "Are you sure you want to sign out?");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: redHiglightColor, // Dark red color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: primaryColor),
                      SizedBox(width: 8),
                      Text(
                        'SIGN OUT',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context)),
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
          ),
          Text(value),
        ],
      ),
    );
  }
}
