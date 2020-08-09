
import 'package:messenger_app/models/user_model.dart';

class Message{

  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread
  });
}

//Me the current user
final currenUser  = new User(
  id:1,
  name: "Miracool",
  imageUrl: "assets/images/miracool.jpg"
);

//Other users

final james  = new User(
  id:2,
  name: "James",
  imageUrl: "assets/images/miracool.jpg"
);


final utibe  = new User(
  id:3,
  name: "Utibe",
  imageUrl: "assets/images/miracool.jpg"
);

final ediong  = new User(
  id:4,
  name: "Ediong",
  imageUrl: "assets/images/miracool.jpg"
);

final emmanuel  = new User(
  id:4,
  name: "Emmanuel",
  imageUrl: "assets/images/miracool.jpg"
);


//Favorite contacts

final  List<User> favContacts = [james,utibe,ediong,emmanuel];

