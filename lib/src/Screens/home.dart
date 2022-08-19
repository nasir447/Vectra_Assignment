import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:ventracom/src/controllers/controller.dart';

class Home extends StatelessWidget {
  var count = 0.obs;
  final controller = Get.put(Controller());

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.nunito(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<Controller>(
        builder: (_) {
          return controller.noData
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: Text(
                    "No Data Available",
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                    ),
                  )),
                )
              : Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(top: 20),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    //height: MediaQuery.of(context).size.height * 0.75,
                    child: LiquidSwipe.builder(
                      itemCount: controller.animals.length,
                      itemBuilder: (context, index) {
                        return Card1(index: index);
                      },
                      positionSlideIcon: 0.8,
                      slideIconWidget: Icon(Icons.arrow_back_ios),
                      // onPageChangeCallback: pageChangeCallback,
                      waveType: WaveType.liquidReveal,
                      // liquidController: liquidController,
                      fullTransitionValue: 880,
                      enableSideReveal: true,
                      enableLoop: false,
                      ignoreUserGestureWhileAnimating: true,
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          count++;
          Get.isDarkMode
              ? Get.changeTheme(ThemeData.dark())
              : Get.changeTheme(ThemeData.light());
        },
      ));
}

class Card1 extends StatelessWidget {
  int index;
  final controller = Get.put(Controller());
  Card1({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: CachedNetworkImage(
              imageUrl: controller.animals[index].image!,
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 0.85,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: controller.isDark ? Color(0xff64FEDA) : Colors.red,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
          ),
          ListTile(
            title: Text(
              "Name: ",
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              controller.animals[index].name!,
              // textAlign: TextAlign.end,
              maxLines: 1,
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
          ),
          ListTile(
            title: Text(
              "Habitat: ",
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              controller.animals[index].habitat!,
              // textAlign: TextAlign.end,
              maxLines: 1,
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            color: controller.isDark ? Color(0xff64FEDA) : Colors.grey,
          ),
          ListTile(
            title: Text(
              "Diet: ",
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              controller.animals[index].diet!,
              // textAlign: TextAlign.end,
              maxLines: 3,
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
