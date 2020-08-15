import 'package:flutter/material.dart';
import 'package:messenger_app/models/message_model.dart';
import 'package:messenger_app/screens/chat_message_screen.dart';

class RecentChart extends StatefulWidget {
  @override
  _RecentChartState createState() => _RecentChartState();
}

class _RecentChartState extends State<RecentChart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), 
              topRight: Radius.circular(30.0)
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, int count) {
                // final chatIsFromMe = chats[count].sender ==
                return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context){
                                  return ChartScreen(user:chats[count].sender);
                                }
                              )
                            );
                            // print("fucking tapped");
                          },
                          child: messageRow(context, count)
                      );
              }),
        ),
      ),
    );
  }

  Widget messageRow(context, int count) {
    final Message chat = chats[count];
    return Container(
      margin: EdgeInsets.only(top:5.0,bottom:5.0,right:15.0),
      padding: EdgeInsets.symmetric(vertical:10.0,horizontal:10.0),
      decoration: BoxDecoration(
        color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage(chat.sender.imageUrl),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.sender.name,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Text(
                      chats[count].text,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(children: [
            Text(chat.time,
                 style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                  ),
            ), 
            SizedBox(
              height: 5.0,
            ),
            chat.unread ? Container(
                  width: 40.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("new",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                          ),
                      ),
                  ),
            ): Text("")
            ])
        ],
      ),
    );
  }
}
