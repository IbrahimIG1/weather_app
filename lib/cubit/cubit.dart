import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/state.dart';
import 'package:weather/model/current_model.dart';
import 'package:weather/model/five_days.dart';
import 'package:weather/remote/dio_helper.dart';


class AppCubit extends Cubit<CubitState> {
  AppCubit() : super(InitState());
  static AppCubit get(context) => BlocProvider.of(context);
  Current? currentWeather;
  Future getData(String city) async {
    DioHelper.getCurrentWeather(
            '${DioHelper().baseUrl}/weather?q=$city&lang=ar&units=metric&appid=846381df4263bf9e37bfbd93565a764b')
        .then((value) {
      currentWeather = Current.fromJson(value.data!);
      emit(GetWeatherDataSuccess());
    }).catchError((error) {
      print('Error In Get Data ${error.toString()}');
      emit(GetWeatherDataError());
    });
  }

  FiveDaysModel? fiveDaysModel;
  List <FiveDaysModel>fiveDaysList = [];
  Future getDataFIveDays(String city) async {
    topFiveCity.forEach((element) {
      DioHelper.getCurrentWeather(
              '${DioHelper().baseUrl}/forecast?q=$city&lang=ar&units=metric&appid=846381df4263bf9e37bfbd93565a764b')
          .then((value) {
        fiveDaysList.add(value.data!);
      }).catchError((error) {
        print('Error In Get Five Days ${error.toString()}');
        emit(GetWeatherFiveDaysError());
      });
    });
    // DioHelper.getCurrentWeather(
    //         '${DioHelper().baseUrl}/forecast?q=$city&lang=ar&units=metric&appid=846381df4263bf9e37bfbd93565a764b')
    //     .then((value) {
    //   fiveDaysModel = FiveDaysModel.fromJson(value.data!);
    //   emit(GetWeatherFiveDaysSuccess());
    // }).catchError((error) {
    //   print('Error In Get Five Days ${error.toString()}');
    //   emit(GetWeatherFiveDaysError());
    // });
  }

// Function To Get Data Which Searched For It By City Name //
  void getSearchResult(String city) {
    //  It Take City Name From TextEdittingController From Seach Bar //
    //But The City Name In URL And Get Data //
    DioHelper.getCurrentWeather(
            '${DioHelper().baseUrl}/weather?q=$city&lang=ar&units=metric&appid=846381df4263bf9e37bfbd93565a764b')
        .then((value) {
      getData(city); // Get New City Data
      emit(GetSearchResaultSuccess());
    }).catchError((error) {
      print('Error In Get Search Result ${error.toString()}');
      emit(GetSearchResaultError());
    });
  }

  List dataTopFiveCity =
      []; // This List to Save Five City Data(topFiveCity) In It //
  List<String> topFiveCity = [
    'London',
    'Tokyo',
    'cairo',
    'Paris',
    'New York',
  ];

  // Function To Get Five City Data //
  Future getFiveCityData() async {
    // This ForEach To Replach Name City In Link To Get Weather Data For The Five City //
    topFiveCity.forEach((element) {
      DioHelper.getCurrentWeather(
              '${DioHelper().baseUrl}/weather?q=$element&lang=ar&units=metric&appid=846381df4263bf9e37bfbd93565a764b')
          .then((value) {
        // Save Data Which Come From Api In List(dataTopFiveCity) To Can Be Access In UI //
        dataTopFiveCity.add(value.data!);
      }).catchError((error) {
        print('Error In Get Five city Data ${error.toString()}');
        emit(GetWeatherDataError());
      });
    });
  }
}
