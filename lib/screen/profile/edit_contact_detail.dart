import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_hris/controllers/edit_profile_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';

class EditContactDetailScreen extends StatefulWidget {
  @override
  _EditContactDetailScreenState createState() =>
      _EditContactDetailScreenState();
}

class _EditContactDetailScreenState extends State<EditContactDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _alamatCtrl =
      TextEditingController(text: Get.arguments['alamat'] ?? 'JL. Sudirman');
  String _province = Get.arguments['province_id'];
  String? _city = Get.arguments['city_id'];
  String? _district = Get.arguments['district_id'];
  String? _village = Get.arguments['village_id'];
  final TextEditingController _kodePosCtrl =
      TextEditingController(text: Get.arguments['kode_pos'] ?? '12345');
  final TextEditingController _phoneCtrl =
      TextEditingController(text: Get.arguments['telpon'] ?? '08123456789');
  final TextEditingController _rtRw =
      TextEditingController(text: Get.arguments['rt_rw'] ?? '001/001');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileCtrl>(
      init: EditProfileCtrl(),
      builder: (editCtrl) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Edit Contact Details'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _province,
                  decoration: InputDecoration(
                    labelText: 'Provinsi',
                    border: OutlineInputBorder(),
                  ),
                  items: editCtrl.provinces.map((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'],
                      child: Text(value['name']),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _province = newValue!;
                      editCtrl.getCities(newValue);
                      _city = null;
                      _district = null;
                      _village = null;
                    });
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _city,
                  decoration: InputDecoration(
                    labelText: 'Kota/Kabupaten',
                    border: OutlineInputBorder(),
                  ),
                  items: editCtrl.cities.map((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'],
                      child: Text(value['name']),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _city = newValue!;
                      editCtrl.getDistricts(newValue);
                      _district = null;
                      _village = null;
                    });
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _district,
                  decoration: InputDecoration(
                    labelText: 'Kecamatan',
                    border: OutlineInputBorder(),
                  ),
                  items: editCtrl.districts.map((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'],
                      child: Text(value['name']),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _district = newValue!;
                      editCtrl.getVillages(newValue);
                      _village = null;
                    });
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _village,
                  decoration: InputDecoration(
                    labelText: 'Kelurahan',
                    border: OutlineInputBorder(),
                  ),
                  items: editCtrl.villages.map((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'],
                      child: Text(value['name']),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _village = newValue!;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _kodePosCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Kode Pos',
                    border: OutlineInputBorder(),
                    hintText: 'Kode Pos',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _rtRw,
                  decoration: InputDecoration(
                    labelText: 'RT/RW',
                    border: OutlineInputBorder(),
                    hintText: 'RT/RW',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _alamatCtrl,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(),
                    hintText: 'Detail Alamat',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneCtrl,
                  decoration: InputDecoration(
                    labelText: 'No. Telp',
                    border: OutlineInputBorder(),
                    hintText: 'No. Telp',
                  ),
                ),
                SizedBox(height: 32),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var data = {
                              'province_id': _province,
                              'city_id': _city,
                              'district_id': _district,
                              'village_id': _village,
                              'kode_pos': _kodePosCtrl.text,
                              'rt_rw': _rtRw.text,
                              'telpon': _phoneCtrl.text,
                              'alamat': _alamatCtrl.text,
                            };
                            editCtrl.editContactDetail(data);
                          }
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 228, 228, 228),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: blueDeepColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
