import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shyakapro/dep_ui.dart';
class Product {
  final String name;
  Product(this.name);
}
class Department {
  final String name;
  Department(this.name);
}
class Home extends StatelessWidget {

  var price = ["18\$", "20\$", "10\$", "25\$", "10\$", "30\$", "35\$", "24\$"];

  BuildContext get context => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "شياكة",
            style: TextStyle(fontSize: 25.7),
          ),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, "serch"),
            ),
          ],
        ),
        //القائمه الجانبيه
        drawer: Text("hello"),

        ////////////////////////////
        body: new ListView(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            /////////////////////////////سلايدر/////////////////
            new Container(
              height: 200.0,
             child:
             new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('cloths').snapshots(),
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




            /////////////////////////////الاقسام//////////// ///
            Container(
              color: Colors.white,
              height: 95.0,
              padding: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
              child: new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('department').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('');
                  return new ListView(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemExtent: 80.0,
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return InkWell(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    document['img'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            new Text(
                              document['name'],
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                              textDirection: TextDirection.rtl,
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        onTap: () =>Navigator.push(context, new MaterialPageRoute(builder: (context) =>
                        new app(department: new Department( document['name'])))),
//                            Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => app()),
//
//                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Divider(
              height: 4.0,
              color: Colors.black26,
            ),









///////////////////////////////////////المنتجات المعروضه للبيع///////////////
            new Container(
              padding: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
              color: Colors.white,
              child: new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('cloths').snapshots(),
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
          ],
        ),
      ),
    );
  }

}
