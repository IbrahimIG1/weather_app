import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class UiDesign extends StatelessWidget {
  UiDesign({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    Color txtColor = Colors.black38;
    return Scaffold(
      //appBar: AppBar(title: Text('Ui Design')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // color: Colors.red,
              width: double.infinity,
              height: heightMQ * .55,
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: heightMQ * .40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black26, BlendMode.darken),
                          image:
                              AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                          fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Container(
                    padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                    width: widthMQ * .9,
                    child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          label: Text(
                            'Search'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // color: Colors.black,
                    child: OverflowBox(
                      minWidth: 0.0,
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: 0.0,
                      maxHeight: (MediaQuery.of(context).size.height / 3),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: double.infinity,
                        height: double.infinity,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'London'.toUpperCase(),
                                  style: TextStyle(
                                      color: txtColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Day/month',
                                  style: TextStyle(
                                      color: txtColor,
                                      fontWeight: FontWeight.normal),
                                ),
                                Divider(),
                                Container(
                                  // padding: EdgeInsets.all(10),
                                  child: Row(
                                    
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'overcast clouds',
                                            style: TextStyle(
                                                color: txtColor, fontSize: 22),
                                          ),
                                          Text(
                                            '16 C',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  color: txtColor,
                                                ),
                                          ),
                                          Text(
                                            'min: 14C /max: 17c',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: txtColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                // color: Colors.red,
                                                width: 100,
                                                height: 100,
                                                child: LottieBuilder.asset(
                                                  'assets/anims/cloudy.json',
                                                )),
                                            Text('Wind: 33.3')
                                          ]),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(child: Text('data'),)
          ],
        ),
      ),
    );
  }
}
