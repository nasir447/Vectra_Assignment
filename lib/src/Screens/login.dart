import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventracom/src/controllers/controller.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width) *
              0.05,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset("assets/logo.jpeg"),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      controller.isDark ? Color(0xff1D2226) : Colors.white54,
                  focusedBorder: OutlineInputBorder(
                    // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: controller.isDark ? Colors.white : Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      controller.isDark ? Color(0xff1D2226) : Colors.white54,
                  focusedBorder: OutlineInputBorder(
                    // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: controller.isDark ? Colors.white : Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                decoration: BoxDecoration(
                  color: controller.isDark ? Color(0xff64FEDA) : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password? ",
                  style: TextStyle(
                    fontSize: 18,
                    color: controller.isDark ? Color(0xff64FEDA) : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
