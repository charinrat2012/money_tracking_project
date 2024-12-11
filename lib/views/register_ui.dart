// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_element, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, prefer_is_empty, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_tracking_project/models/user.dart';
import 'package:money_tracking_project/services/call_api.dart';


class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {

  TextEditingController userFullNameCtrl = TextEditingController(text: '');
  TextEditingController userBirthDateCtrl = TextEditingController(text: '');
  TextEditingController userNameCtrl = TextEditingController(text: '');
  TextEditingController userPasswordCtrl = TextEditingController(text: '');


  bool passStatus = true;

  File? _imageSelected;

  String _image64Selected = '';

  String? _BirthDateSelected;

 
//open camera method
  Future<void> _openCamera() async {
    final XFile? _picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (_picker != null) {
      setState(() {
        _imageSelected = File(_picker.path);
        _image64Selected = base64Encode(_imageSelected!.readAsBytesSync());
      });
    }
  }

//open gallery method
  Future<void> _openGallery() async {
    final XFile? _picker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (_picker != null) {
      setState(() {
        _imageSelected = File(_picker.path);
        _image64Selected = base64Encode(_imageSelected!.readAsBytesSync());
      });
    }
  }


//Method showWaringDialog
  showWaringDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'คำเตือน',
          ),
        ),
        content: Text(
          msg,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ตกลง',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//Method showCompleteDialog
  Future showCompleteDialog(context, msg) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'ผลการทำงาน',
          ),
        ),
        content: Text(
          msg,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ตกลง',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Future<void> _openBirthdayCalendar() async {
    final DateTime? _picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (_picker != null) {
      setState(() {
        userBirthDateCtrl.text = convertToThaiDate(_picker);
        _BirthDateSelected = _picker.toString().substring(0, 10);
      });
    }
  }

                         
  convertToThaiDate(date) {
    String day = date.toString().substring(8, 10);
    String year = (int.parse(date.toString().substring(0, 4)) + 543).toString();
    String month = '';
    int monthTemp = int.parse(date.toString().substring(5, 7));
    switch (monthTemp) {
      case 1:
        month = 'มกราคม';
        break;
      case 2:
        month = 'กุมภาพันธ์';
        break;
      case 3:
        month = 'มีนาคม';
        break;
      case 4:
        month = 'เมษายน';
        break;
      case 5:
        month = 'พฤษภาคม';
        break;
      case 6:
        month = 'มิถุนายน';
        break;
      case 7:
        month = 'กรกฎาคม';
        break;
      case 8:
        month = 'สิงหาคม';
        break;
      case 9:
        month = 'กันยายน';
        break;
      case 10:
        month = 'ตุลาคม';
        break;
      case 11:
        month = 'พฤศจิกายน';
        break;
      default:
        month = 'ธันวาคม';
    }

    return day + ' ' + month + ' พ.ศ. ' + year;
  }

//--------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3E7C78),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white),
                      onPressed: () {
                        
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'ลงทะเบียน',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.065,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.045,
                          ),
                          child: Text(
                            'ข้อมูลผู้ใช้งาน',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                          ),
                        ),
//select profile image
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.015,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //open camera
                                    ListTile(
                                      onTap: () {
                                        _openCamera().then(
                                          (value) => Navigator.pop(context),
                                        );
                                      },
                                      leading: Icon(
                                        Icons.camera_alt,
                                        color: Colors.red,
                                      ),
                                      title: Text(
                                        'Open Camera...',
                                      ),
                                    ),

                                    Divider(
                                      color: Colors.grey,
                                      height: 5.0,
                                    ),

                                    //open gallery
                                    ListTile(
                                      onTap: () {
                                        _openGallery().then(
                                          (value) => Navigator.pop(context),
                                        );
                                      },
                                      leading: Icon(
                                        Icons.browse_gallery,
                                        color: Colors.blue,
                                      ),
                                      title: Text(
                                        'Open Gallery...',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 4, color: Color(0xFF3E7C78)),
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                      image: _imageSelected == null
                                          ? AssetImage(
                                              'assets/images/person.png',
                                            )
                                          : FileImage(_imageSelected!),
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
//Textfield Fullname
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                            top: MediaQuery.of(context).size.height * 0.015,
                          ),
                          child: TextField(
                            controller: userFullNameCtrl,
                            decoration: InputDecoration(
                              labelText: 'ชื่อ-สกุล',
                              labelStyle: TextStyle(
                                color: Color(0xFF3E7C78),
                              ),
                              hintText: 'ป้อนชื่อ-สกุล',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF3E7C78),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF3E7C78),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
//TextField Birthdate
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                            top: MediaQuery.of(context).size.height * 0.015,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: userBirthDateCtrl,
                                  readOnly: true,
                                  enabled: true,
                                  decoration: InputDecoration(
                                    labelText: 'วัน-เดือน-ปี เกิด',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF3E7C78),
                                    ),
                                    hintText: 'เลือกวันที่ --->',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF3E7C78),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF3E7C78),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        _openBirthdayCalendar();
                                      },
                                      icon: ImageIcon(
                                          AssetImage(
                                            'assets/icons/calendar.png',
                                          ),
                                          color: Color(0xFF3E7C78),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.029),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
//Textfield username
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                            top: MediaQuery.of(context).size.height * 0.015,
                          ),
                          child: TextField(
                            controller: userNameCtrl,
                            decoration: InputDecoration(
                              labelText: 'ชื่อผู้ใช้',
                              labelStyle: TextStyle(
                                color: Color(0xFF3E7C78),
                              ),
                              hintText: 'ป้อนชื่อผู้ใช้',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF3E7C78),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF3E7C78),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
//Textfield password
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                            top: MediaQuery.of(context).size.height * 0.025,
                          ),
                          child: TextField(
                            controller: userPasswordCtrl,
                            obscureText: passStatus,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passStatus = !passStatus;
                                  });
                                },
                                icon: Icon(
                                  passStatus == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              labelText: 'รหัสผ่าน',
                              labelStyle: TextStyle(
                                color: Color(0xFF3E7C78),
                              ),
                              hintText: 'ป้อนรหัสผ่าน',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF3E7C78),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF3E7C78),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
//Register button
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                            top: MediaQuery.of(context).size.height * 0.03,
                            bottom: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                             
                              if (_imageSelected == null) {
                                showWaringDialog(context,
                                    'กรุณาถ่ายรูป/อัปโหลดรูปโปรไฟล์ด้วย');
                              } else if (userFullNameCtrl.text.trim().length ==
                                  0) {
                                showWaringDialog(context, 'กรุณาป้อนชื่อ-สกุล');
                              } else if (_BirthDateSelected == '' ||
                                  _BirthDateSelected == null) {
                                showWaringDialog(context, 'กรุณาเลือกวันเกิด');
                              } else if (userNameCtrl.text.trim().length == 0) {
                                showWaringDialog(
                                    context, 'กรุณาป้อนชื่อผู้ใช้');
                              } else if (userPasswordCtrl.text.trim().length ==
                                  0) {
                                showWaringDialog(context, 'กรุณาป้อนรหัสผ่าน');
                              } else {
                              
                                User user = User(
                                  userFullName: userFullNameCtrl.text,
                                  userBirthDate: userBirthDateCtrl.text,
                                  userName: userNameCtrl.text,
                                  userPassword: userPasswordCtrl.text,
                                  userImage: _image64Selected,
                                );
                                //Call API
                                CallAPI.callregisterAPI(user).then((value) {
                                  if (value.message == '1') {
                                    showCompleteDialog(
                                            context, 'สมัครสมาชิกสําเร็จOvO')
                                        .then(
                                            (value) => Navigator.pop(context));
                                  } else {
                                    showCompleteDialog(
                                        context, 'มีบางอย่างผิดพลาด');
                                  }
                                });
                              }
                            },
                            child: Text(
                              'เข้าใช้งาน',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3E7C78),
                              fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.8,
                                MediaQuery.of(context).size.height * 0.07,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
