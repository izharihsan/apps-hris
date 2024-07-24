import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_hris/components/custom_components.dart';
import 'package:mobile_hris/controllers/overtime_ctrl.dart';
import 'package:mobile_hris/controllers/reimbursement_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddReimbursementScreen extends StatefulWidget {
  @override
  _AddReimbursementScreenState createState() => _AddReimbursementScreenState();
}

class _AddReimbursementScreenState extends State<AddReimbursementScreen> {
  final _formKey = GlobalKey<FormState>();
  var selectedDate = null;
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReimbursementCtrl>(
      init: ReimbursementCtrl(),
      builder: (reimbursementCtrl) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Submit Reimbursement',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _titleCtrl,
                    onChanged: (value) => reimbursementCtrl.setTitle(value),
                    decoration: InputDecoration(
                      labelText: 'Reimbursement Name',
                      hintText: 'Masukan nama reimbursement',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter start time';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionCtrl,
                    onChanged: (value) => reimbursementCtrl.setNote(value),
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Masukan deskripsi reimbursement',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a note';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _amountCtrl,
                    onChanged: (value) => reimbursementCtrl.setAmount(value),
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      prefixText: 'Rp. ',
                      hintText: 'Masukan jumlah reimbursement',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter end time';
                      }
                      return null;
                    },
                  ),

                  // Spacer(),
                  SizedBox(height: 16),
                  // container dotted border for image picker
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lampiran',
                          textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context)),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                reimbursementCtrl.beforeImage.value.path == ''
                                    ? 'No image selected'
                                    : reimbursementCtrl.beforeImage.value.path,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textScaler: TextScaler.linear(
                                    ScaleSize.textScaleFactor(context)),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                reimbursementCtrl.pickBeforeImage();
                              },
                              child: Text(
                                'Select Image',
                                textScaler: TextScaler.linear(
                                    ScaleSize.textScaleFactor(context)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                        ),
                        child: Text(
                          'Cancel',
                          textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context)),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle save action
                            showCustomDialog(context,
                                'Anda yakin ingin mengajukan reimbursement?',
                                () {
                              reimbursementCtrl.handleSubmit();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Submit',
                          textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context)),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
