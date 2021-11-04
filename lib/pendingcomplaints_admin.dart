import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/alerts_admin.dart';
import 'package:hostelite/complaintAdmin.dart';
import 'package:hostelite/edit_profile_Admin.dart';
import 'package:hostelite/home_screen_Admin.dart';
import 'package:hostelite/rejected_complaints.dart';

class PendingComplaints extends StatefulWidget {



  const PendingComplaints({Key  key}) : super(key: key);

  @override
  _PendingComplaintsState createState() => _PendingComplaintsState();
}

class _PendingComplaintsState extends State<PendingComplaints> {


  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          title: Text('View Complaints',
            style: TextStyle(
              color: Color(0xff4E4E4E),
            ),),


          backgroundColor: Color(0xffFE96FA),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Text('Status : ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),),
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff4BB227)),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return ViewComplaintsAdmin();
                                  }
                              ),
                            );
                          },
                          child: const Text('Sorted',
                            style: TextStyle(

                                color: Color(0xff4BB227)
                            ),),
                        ),
                        Spacer(),
                        VerticalDivider(
                          color: Colors.green,
                          thickness: 2, width: 2,
                        ),
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary:  Colors.red,
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),

                          ),
                          onPressed: null,
                          child: const Text('Pending',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 4,
                                color: Color(0xffFBC02D)
                            ),
                          ),
                        ),
                        Spacer(),
                        VerticalDivider(
                          color: Colors.lightBlue,
                          thickness: 2, width: 4,
                        ),

                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),


            ),

            SizedBox(height: 20,),


            SizedBox(height: 20,),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Exits").snapshots(),


              builder: (context, snapshots) {
                if (!snapshots.hasData){
                  return CircularProgressIndicator();
                }


                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshots.data.size,
                    itemBuilder: (context, index){
                      return Container(

                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15,0,15,0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Ramesh Kumar',
                                            style: TextStyle(
                                                color: Color(0xff565656),
                                                fontSize: 15
                                            ),),
                                          Text('Room No. 087',
                                            style: TextStyle(
                                                fontSize: 12
                                            ),),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(DateTime.now().day.toString()+'.'+DateTime.now().month.toString()+'.'+DateTime.now().year                     .toString(),
                                        style: TextStyle(
                                            color: Color(0xff9F9F9F)
                                        ),)
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 5,),
                                  Image(
                                    image: AssetImage('assets/home_Screen_Student/2720490 1.png'),
                                  ),
                                  SizedBox(height: 5,),
                                  Text('Title of Issue',

                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff1A1919),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text('Sir I went to purchase a book , but while returning it satrted raining . So there was                              no any options left for me then waiting at  the store until the rain stopped.'),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        DateTime.now().toString(),
                                        style: TextStyle(
                                            color: Color(0xff9F9F9F)
                                        ),)
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      MaterialButton(onPressed: () {},
                                        color: Color(0xffDFFED4),

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius. circular(10.0),
                                            side: BorderSide(color: Color(0xff4BB227))
                                        ),
                                        child: Text('Mark Sorted',
                                            style:TextStyle(
                                                color: Color(0xff4BB227)
                                            )),

                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),



          ],
        ),
      ),
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[300],
          ),

        ),
        height: 45,
        width: 380,
        child: Row(
          children: <Widget>[
            Spacer(),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return HomeScreenAdmin( );
                      }
                  ),
                );
              },
              child: Icon(

                Icons.home_filled,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.graphic_eq,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return Alerts();
                      }
                  ),
                );
              },
              child: Icon(
                Icons.add_alert,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return EditProfileAdmin();
                      }
                  ),
                );
              },
              child: Icon(
                Icons.person,
              ),
            ),
            Spacer(),


          ],
        ),
      ),

    );
  }
}
