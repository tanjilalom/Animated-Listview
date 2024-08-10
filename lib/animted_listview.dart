import 'package:flutter/material.dart';

class AnimatedListView extends StatefulWidget {
  const AnimatedListView({super.key});

  @override
  State<AnimatedListView> createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startanimation = false;

  List<String> texts = [
    "Monetization",
    "Pie Chart",
    "Flag",
    "Notification",
    "Savings",
    "Cloud",
    "Nightlight",
    "Assignment",
    "Location",
    "Settings",
    "Rocket",
    "Backpack",
    "Person"
        "Done",
    "Search",
    "Extension",
    "Bluetooth",
    "Favorite",
    "Lock",
    "Bookmark",
  ];

  List<IconData> icons = [
    Icons.monetization_on,
    Icons.pie_chart,
    Icons.flag,
    Icons.notifications,
    Icons.savings,
    Icons.cloud,
    Icons.nightlight_round,
    Icons.assignment,
    Icons.location_pin,
    Icons.settings,
    Icons.rocket,
    Icons.backpack,
    Icons.person,
    Icons.done_all,
    Icons.search,
    Icons.extension,
    Icons.bluetooth,
    Icons.favorite,
    Icons.lock,
    Icons.bookmark,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      setState(() {
        startanimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF222431),
      body: SafeArea(
        child: SingleChildScrollView(
          //physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'L I S T',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  return item(index);
                },
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index){
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 50)),
      transform: Matrix4.translationValues(startanimation ? 0 : screenWidth, 0, 0),
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}. ${texts[index]}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            icons[index],
          )
        ],
      ),
    );
  }



}
