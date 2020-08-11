import 'package:flutter/material.dart';
import 'package:messenger_app/widgets/category_selector.dart';
import 'package:messenger_app/widgets/favorite_contact.dart';
import 'package:messenger_app/widgets/recent_chats.dart';

Widget appBody(BuildContext context) {
  return Column(
            children: [
                CategorySelector(),
                chatContainer(context)
              ]
        );
}

Widget chatContainer(BuildContext context) {
  return Expanded(
            child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)
                            )
                        ),
                    child: Column(
                      children: [
                        FavouriteContact(),
                        RecentChart(),
                      ],
                    ),
                )
        );
}
