import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shyakapro/homeUi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class app extends StatelessWidget {
  final Department department;
  app({Key key, @required this.department}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String n=department.name ;
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          n,
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: new ListView(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            new Container(
              height: 200.0,
              child:
              new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('cloths').where("dept",isEqualTo: n).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('');
                  return new Carousel(
                    showIndicator: false,
                    boxFit: BoxFit.cover,
                    autoplayDuration: Duration(milliseconds: 7000),
                    animationDuration: Duration(milliseconds: 1500),
                    images: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return  new NetworkImage( (document['img'])
                      );

                    },).toList( ),

                  );
                },
              ),
            ),


            new Container(
              padding: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
              color: Colors.white,
              child: new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('cloths').where("dept",isEqualTo: n).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('');
                  return new GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1 / 2,
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return InkWell(
                        child:  Container(
                          margin: EdgeInsets.all(5.0),
                          height: 300.0,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                height: 230.0,
                                width: 200.0,
                                child: new ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image(
                                    image: NetworkImage(
                                      document['img'].toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              new Text(
                                document['name'],
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w700),
                              ),
                              new Text(
                                document['price'],
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
//                        onTap: () =>Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => MyApp(product: new Product( document['name']))),
//
//                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
