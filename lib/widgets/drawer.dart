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
                image: DecorationImage(
                  image: AssetImage('assets/images/card_bg.png'),
                  fit: BoxFit.fill,
                  opacity: 0.9,
                ),
              ),
              accountEmail: Text(
                "siddheshdesai777@gmail.com",
                style: TextStyle(
                  color: Colors.amber[50],
                  fontSize: 13,
                ),
              ),
              accountName: Text(
                "Siddhesh Desai",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xff56B149),
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Color(0xff56B149),
              ),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.airplane_ticket,
              color: Color(0xff56B149),
            ),
            title: Text(
              "My Tickets",
              style: TextStyle(
                color: Color(0xff56B149),
              ),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person_2,
              color: Color(0xff56B149),
            ),
            title: Text(
              "My Profile",
              style: TextStyle(
                color: Color(0xff56B149),
              ),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Color(0xff56B149),
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Color(0xff56B149),
              ),
              textScaleFactor: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
