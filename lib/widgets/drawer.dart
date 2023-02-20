import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/D4D03AQGEQz_LSVgnMQ/profile-displayphoto-shrink_400_400/0/1664269945043?e=1682553600&v=beta&t=ZuUiPqdP8HL1of_cJjuHuSpY3zELfO2oYccDF2jpbAw";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Color(0xffffc107),
              ),
              accountEmail: Text("siddheshdesai777@gmail.com"),
              accountName: Text("Siddhesh Desai"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xffffc107),
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Color(0xffffc107),
              ),
              textScaleFactor: 1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.airplane_ticket,
              color: Color(0xffffc107),
            ),
            title: Text(
              "My Tickets",
              style: TextStyle(
                color: Color(0xffffc107),
              ),
              textScaleFactor: 1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person_2,
              color: Color(0xffffc107),
            ),
            title: Text(
              "My Profile",
              style: TextStyle(
                color: Color(0xffffc107),
              ),
              textScaleFactor: 1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Color(0xffffc107),
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Color(0xffffc107),
              ),
              textScaleFactor: 1,
            ),
          ),
        ],
      ),
    );
  }
}
