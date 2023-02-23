import 'package:flutter/material.dart';
import 'package:kickgo/main.dart';
import 'package:kickgo/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/card_bg.png'),
                  fit: BoxFit.fill,
                  opacity: 0.9,
                ),
              ),
              accountEmail: Text(
                MyApp.email,
                style: TextStyle(
                  color: Colors.amber[50],
                  fontSize: 15,
                ),
              ),
              accountName: Text(
                MyApp.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              currentAccountPicture: const Icon(
                Icons.account_box,
                color: Colors.black,
                size: 75,
              ),
            ),
          ),
          ListTile(
            selected: true,
            selectedTileColor: Colors.grey[200],
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            leading: const Icon(
              Icons.home,
              color: Color(0xff56B149),
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                color: Color(0xff56B149),
              ),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.profileRoute);
            },
            leading: const Icon(
              Icons.person_2,
              color: Color(0xff56B149),
            ),
            title: const Text(
              "My Profile",
              style: TextStyle(
                color: Color(0xff56B149),
              ),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.aboutRoute);
            },
            leading: const Icon(
              Icons.info,
              color: Color(0xff56B149),
            ),
            title: const Text(
              "About Us",
              style: TextStyle(
                color: Color(0xff56B149),
              ),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            onTap: () {
              MyApp.userId = "";
              MyApp.name = "";
              MyApp.email = "";
              Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);
            },
            leading: const Icon(
              Icons.logout,
              color: Color(0xff56B149),
            ),
            title: const Text(
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
