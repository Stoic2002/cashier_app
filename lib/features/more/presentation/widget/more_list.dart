import 'package:flutter/material.dart';

class MoreList extends StatelessWidget {
  const MoreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: double.infinity,
      child: ListView(
        children: [
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.edit_outlined),
              title: Text('Edit Profile'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.location_on_outlined),
              title: Text('My Address'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.shopping_basket_outlined),
              title: Text('My Orders'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.electric_bolt_sharp),
              title: Text('My Wishlist'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.chat_bubble_outline),
              title: Text('Chat with us'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.phone_outlined),
              title: Text('Talk to our Support'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.mail_outline),
              title: Text('Mail to us'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.facebook_rounded),
              title: Text('Message to facebook page'),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10),
              leading: Icon(Icons.logout_outlined),
              title: Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}
