import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ventracom/src/controllers/controller.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.nunito(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: GetBuilder<Controller>(
            builder: (_) {
              return Column(
                children: [
                  CircleAvatar(
                    maxRadius: 100,
                    backgroundColor:
                        controller.isDark ? Color(0xff64FEDA) : Colors.red[100],
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      "Profile Settings",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(
                    color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text(
                      "Privacy Settings",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(
                    color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      "About Us",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(
                    color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
                  ),
                  ListTile(
                    leading: controller.isDark
                        ? Icon(Icons.dark_mode)
                        : Icon(Icons.light_mode),
                    title: Text(
                      "Dark Mode",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Switch(
                        value: controller.isDark,
                        onChanged: (state) {
                          controller.changeTheme(state);
                        }),
                  ),
                  Divider(
                    color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
