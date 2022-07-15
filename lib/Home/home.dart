import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/Home/ui_classes.dart/image_background.dart';
import 'package:weather/Home/ui_classes.dart/other_city_ui/card.dart';
import 'package:weather/Home/ui_classes.dart/weather_card/card_weather.dart';
import 'package:weather/cubit/cubit.dart';
import 'package:weather/cubit/state.dart';


class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  Color txtColor = Colors.black38;
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent.withOpacity(.1),),
      // drawer: const Drawer(),
      body: BlocProvider(
        create: (context) => AppCubit()
          ..getData('جنزور')
          ..getFiveCityData(),
        child: BlocConsumer<AppCubit, CubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context).currentWeather;
            if (cubit != null &&
                AppCubit.get(context).dataTopFiveCity.length >0) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.red,
                      width: double.infinity,
                      //height Conrtol Weather Card(Up And Down) Because this is Father Container it contains (Image-SearchBar Container) And Weather Card
                      height: heightMQ * .46,
                      child: Stack(children: [
                       
                        imageBackground(
                            heightMQ: heightMQ,
                            widthMQ: widthMQ,
                            searchController: searchController,
                            pressed: () {
                              if (searchController.text != null &&
                                  searchController.text != '')
                                AppCubit.get(context)
                                    .getSearchResult(searchController.text);
                              searchController.text = '';
                            }),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            child: OverflowBox(
                                // OverflowBox To Give Size Without Follow The Parent Size
                                minWidth: 0.0,
                                maxWidth: MediaQuery.of(context).size.width,
                                minHeight: 0.0,
                                maxHeight:
                                    (MediaQuery.of(context).size.height / 3.2),
                                alignment: Alignment.bottomCenter,
                                child: weatherCard(
                                    cityname: cubit.name!,
                                    windSpeed: "wind ${cubit.wind!.speed!} m/s",
                                    description: cubit.weather![0].description!
                                        .toString(),
                                    temp: "${cubit.mainW!.temp!.ceil()} °C",
                                    tempMin: "${cubit.mainW!.tempMin!.ceil()} °C",
                                    tempMax: "${cubit.mainW!.tempMax!.ceil()} °C",
                                    context: context)),
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(
                          'Other City'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: txtColor),
                        ),
                      ),
                    ),
                    Container(
                      height: heightMQ * .2,
                      // List View To Show Five City horizontal Scroll View //
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                                width: widthMQ * .35,
                                child: otherCityCard(
                                    // Get Data From The (dataTopFiveCity)List //
                                    cityname: AppCubit.get(context)
                                        .dataTopFiveCity[index]['name'],
                                    temp:
                                        "${AppCubit.get(context).dataTopFiveCity[index]['main']['temp']}",
                                    context: context,
                                    txt: (AppCubit.get(context)
                                                .dataTopFiveCity[index]
                                            ['weather'][0]['description'])
                                        .toString()));
                          },
                          separatorBuilder: (context, index) =>
                              VerticalDivider(width: 1),
                          itemCount: 5),
                    ),
                    Container(
                              width: MediaQuery.of(context).size.width,
                              height: 240,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  // series: <ChartSeries<FiveDayData, String>>[
                                  //   SplineSeries<FiveDayData, String>(
                                  //     dataSource: controller.fiveDaysData,
                                  //     xValueMapper: (FiveDayData f, _) =>
                                  //         f.dateTime,
                                  //     yValueMapper: (FiveDayData f, _) =>
                                  //         f.temp,
                                  //   ),
                                  // ],
                                ),
                              ),
                            ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
