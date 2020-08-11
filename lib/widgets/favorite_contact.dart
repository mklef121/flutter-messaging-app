
import 'package:flutter/material.dart';
import 'package:messenger_app/models/message_model.dart' show favContacts;

class FavouriteContact extends StatefulWidget {
  @override
  _FavouriteContactState createState() => _FavouriteContactState();
}

class _FavouriteContactState extends State<FavouriteContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Favorite Contacts", style: TextStyle(
                        color: Colors.blueGrey, fontSize: 15.0,fontWeight: FontWeight.bold,letterSpacing: 1.0
                      )),
                      IconButton(icon: Icon(Icons.more_horiz,color: Colors.blueGrey), onPressed: (){})
                    ],
                  ),
                ),

                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.blue,

                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.only(left:10.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: favContacts.length,
                    itemBuilder: ( BuildContext context, int count){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(radius: 29.0,backgroundImage: AssetImage(favContacts[count].imageUrl)),
                            SizedBox(height:6.0),
                            Text(favContacts[count].name, style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600
                            ),),
                          ],
                        ),
                      );
                    }
                  ),
                )
              ],
    );
  }
}