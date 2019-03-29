import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_auth/firebase_auth.dart';
class accept extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => inputInfo();
}
TextEditingController name=new TextEditingController();
TextEditingController _smsCodeController =new TextEditingController();
//TextEditingController _smsCodeController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();

class inputInfo extends State<accept> {
  String verificationId;

  /// Sends the code to the specified phone number.
//  Future<void> _sendCodeToPhoneNumber() async {
//    final PhoneVerificationCompleted verificationCompleted = (FirebaseUser user) {
//      setState(() {
//        print('Inside _sendCodeToPhoneNumber: signInWithPhoneNumber auto succeeded: $user');
//      });
//    };
//
//    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
//      setState(() {
//        print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');}
//      );
//    };
//
//    final PhoneCodeSent codeSent =
//        (String verificationId, [int forceResendingToken]) async {
//      this.verificationId = verificationId;
//      print("code sent to " + _phoneNumberController.text);
//    };
//
//    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//        (String verificationId) {
//      this.verificationId = verificationId;
//      print("time out");
//    };
//
//    await FirebaseAuth.instance.verifyPhoneNumber(
//        phoneNumber: _phoneNumberController.text,
//        timeout: const Duration(seconds: 5),
//        verificationCompleted: verificationCompleted,
//        verificationFailed: verificationFailed,
//        codeSent: codeSent,
//        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//  }
  @override
  Widget build(BuildContext context) {
    return  Card(
          color: Colors.indigo[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //name
              Container(
                height: 50.0,
                width: 300.0,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  autofocus: false,
                  textAlign: TextAlign.right,
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "الاسم",
                    border: InputBorder.none,
                  ),
                ),
              ),

              //home
              Container(
                height: 50.0,
                width: 300.0,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child:TextField(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  autofocus: false,
                  controller: _smsCodeController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "المنطقة/اقرب نقطة دالة",
                    border: InputBorder.none,

                  ),
                ),
              ),
              //phon number
              Container(
                height: 50.0,
                width: 300.0,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  autofocus: false,
                  textAlign: TextAlign.right,
                  maxLength: 11,
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "رقم الهاتف",
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: 150.0,
                margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                child: RaisedButton(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Text(
                    "ارسال",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 25.0,color: Colors.white),
                  ),
                  color: Colors.indigoAccent[200],
                 //////// //ACtion///////////////////
                    //onPressed: () =>_sendCodeToPhoneNumber(),
                   onPressed:check,
                ),
              ),
            ],
          ),


    );
  }

void check(){
    if (name.text!=""&&_smsCodeController.text!=""&&_phoneNumberController.text!=""){
      if(_phoneNumberController.text.length<11){
      Fluttertoast.showToast(msg:"رقم الهاتف غير كامل",gravity: ToastGravity.BOTTOM);
}
      else
        _showDialog() ;
    }
  else  if (name.text!=""&&_smsCodeController.text!=""&&_phoneNumberController.text!=""){
      Fluttertoast.showToast(msg:"أدخل المعلومات المطلوبة",gravity: ToastGravity.BOTTOM);

    }
else   Fluttertoast.showToast(msg:"احد الحقول فارغة",gravity: ToastGravity.BOTTOM);


}

// user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
         backgroundColor: Colors.indigo[50],
          title: Text("أدخل رمز التأكيد",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 30.0,
                color: Colors.black,
                fontWeight:FontWeight.w500 ) ,),
    content:  Container(
    height: 50.0,
    width: 300.0,
    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
  padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
  decoration: ShapeDecoration(
      color: Colors.white,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0))),
  child: TextField(
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    autofocus: false,
    maxLength: 4,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.numberWithOptions(),
    decoration: InputDecoration(
      border: InputBorder.none,

    ),
  ),
),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

                Container(
                  height: 40.0,
                  width: 110.0,
//                  margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  child: RaisedButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text(
                      "تأكيد",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 25.0,color: Colors.white),
                    ),
                    color: Colors.indigoAccent[200],
                    //////// //ACtion///////////////////
                    onPressed: () =>Navigator.pushNamed(context, "department"),
                  ),),
//                Container(
//                  height: 40.0,
//                  width: 110.0,
//                  margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
//                  child: RaisedButton(
//                    shape: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(30.0)),
//                    child: Text(
//                      "رجوع",
//                      textAlign: TextAlign.center,
//                      textDirection: TextDirection.rtl,
//                      style: TextStyle(fontSize: 22.0,color: Colors.white),
//                    ),
//                    color: Colors.red,
//                    //////// //ACtion///////////////////
//                    onPressed: () => Navigator.of(context).pop(),
//
//                  ),),
//

          ],
        );
      },
    );
  }

  }



//    else if(name.text==""){
////      Fluttertoast.showToast(msg:"ادخل الاسم",gravity: ToastGravity.CENTER);
////    }
////    else    if(address.text==""){
////      Fluttertoast.showToast(msg:"ادخل العنوان",gravity: ToastGravity.CENTER);
////    }
////    else    if(phone.text==""){
////      Fluttertoast.showToast(msg:"ادخل رقم الهاتف",gravity: ToastGravity.CENTER);
////
////    }