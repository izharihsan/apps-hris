import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_hris/controllers/edit_profile_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';

class EditPersonalDetailsScreen extends StatefulWidget {
  @override
  _EditPersonalDetailsScreenState createState() =>
      _EditPersonalDetailsScreenState();
}

class _EditPersonalDetailsScreenState extends State<EditPersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController =
      TextEditingController(text: '${Get.arguments['name'] ?? 'John Doe'}');
  final TextEditingController _employeeIdController =
      TextEditingController(text: '${Get.arguments['employee_id'] ?? '123'}');
  final TextEditingController _birthDateController =
      TextEditingController(text: '${Get.arguments['bod'] ?? '01-01-2000'}');
  String _nationality = '${Get.arguments['nationality']}';
  String _gender = '${Get.arguments['gender']}';
  String _maritalStatus = '${Get.arguments['status_pernikahan']}';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileCtrl>(
      init: EditProfileCtrl(),
      builder: (editCtrl) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Edit Personal Details'),
        ),
        body: Container(
          // margin: EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _employeeIdController,
                  decoration: InputDecoration(
                    labelText: 'Employee ID',
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey,
                  ),
                  readOnly: true,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _nationality,
                  decoration: InputDecoration(
                    labelText: 'Nationality',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['Indonesia', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _nationality = newValue!;
                    });
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _maritalStatus,
                  decoration: InputDecoration(
                    labelText: 'Marital Status',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      <String>['Menikah', 'Belum Menikah'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _maritalStatus = newValue!;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  readOnly: true,
                  controller: _birthDateController,
                  decoration: InputDecoration(
                    labelText: 'Birth of Date',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    // DateTime? pickedDate = await showDatePicker(
                    //   context: context,
                    //   initialDate: DateTime.now(),
                    //   firstDate: DateTime(2000),
                    //   lastDate: DateTime(2101),
                    // );
                    // if (pickedDate != null) {
                    //   String formattedDate =
                    //       "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                    //   setState(() {
                    //     _birthDateController.text = formattedDate;
                    //   });
                    // }
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['LAKI', 'PEREMPUAN'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
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
                            editCtrl.editPersonalDetail({
                              'name': _firstNameController.text,
                              'status_pernikahan': _maritalStatus,
                              'jenis_kelamin': _gender,
                            });
                          }
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                          textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context)),
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
                          textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context)),
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
