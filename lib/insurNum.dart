import 'package:flutter/material.dart';
class insurNum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[50],
      child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("أدخل رمز التأكيد",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 35.0,
                color: Colors.black,
                fontWeight:FontWeight.w500 ) ,),
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
              maxLength: 4,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: InputBorder.none,

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
                  "تأكيد",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 25.0,color: Colors.white),
                ),
                color: Colors.indigoAccent[200],
                //////// //ACtion///////////////////
                onPressed: () =>Navigator.pushNamed(context, "department"),

            ),
          ),
        ],
      ),

    );  }}