import 'package:flutter/material.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/models/message_model.dart'
    show Message, currentUser, messages;

class ChartScreen extends StatefulWidget {
  final User user;
  ChartScreen({this.user});

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          title: Center(
              child: Text(widget.user.name,
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
          actions: [
            IconButton(
                icon: Icon(Icons.more_horiz),
                iconSize: 20.0,
                color: Colors.white,
                onPressed: () {}),
          ],
        ),
        body: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, count) {
                            final message = messages[count];
                            final isMe = messages[count].sender == currentUser;
                            return BuildMessage(message: message, isMe: isMe);
                          }),
                    ),
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 70.0,
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.image,
                        color:Colors.red,
                      ), 
                      onPressed: (){}
                    ),
                    Expanded(
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              hintText: "Enter Message ...",
                              ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color:Colors.red,
                      ), 
                      onPressed: (){}
                    )
                  ],
                )
              
              ),
            ],
          ),
        ));
  }
}

class BuildMessage extends StatefulWidget {
  final Message message;
  final bool isMe;

  const BuildMessage({Key key, this.message, this.isMe}) : super(key: key);

  @override
  _BuildMessageState createState() => _BuildMessageState();
}

class _BuildMessageState extends State<BuildMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: this.widget.isMe ? MainAxisAlignment.end :MainAxisAlignment.start,
              children: [
              buildChatContainer(context),
              this.widget.isMe ? Text("") :
              IconButton(
                icon: this.widget.message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border) ,
                color: this.widget.message.isLiked ? Colors.red : Colors.blueGrey,
                onPressed: (){
                  this.setState(() {
                    this.widget.message.isLiked = !this.widget.message.isLiked;
                  });
                  
                }
                )
            ]);
  }

  Container buildChatContainer(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                    color: this.widget.isMe ? Theme.of(context).accentColor: Color(0xFFFFEFEE),
                    borderRadius: this.widget.isMe
                        ? BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0))
                        : BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0))),
                margin: this.widget.isMe
                    ? EdgeInsets.only(top: 8.0, bottom: 8.0)
                      : EdgeInsets.only(top: 8.0, bottom: 8.0),
                width: MediaQuery.of(context).size.width * 0.75,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.message.time, style: TextStyle()),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(widget.message.text),
                  ],
                ));
  }
}
