import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/business.dart';
import 'package:newapp/cache/cache.dart';
import 'package:newapp/dioHelper/dio.dart';
import 'package:newapp/science.dart';
import 'package:newapp/sport.dart';

import 'states.dart';
class NewsApp extends Cubit<AppNewsStates>
{
  NewsApp():super(InitialApp());

  static NewsApp get(context) => BlocProvider.of(context);

  List<Widget> screens =const[
    Business(),
    Sport(),
    Science()
  ];
  int currentIndex=0;
  void getIndex(int index)
  {
    currentIndex=index;
    if(currentIndex==1 && sport.isEmpty)
    {
      getSport();
    }
    else if(currentIndex==2 && science.isEmpty)
    {
      getScience();
    }
    emit(NavBarIndex());
  }
  List<dynamic> business=[];
  void getBusiness()
  {
    emit(BusinessLoad());
     DioHelper.getData("v2/top-headlines",
    {
    "country":"eg",
    "category":"business",
    "apikey":"525feca1aa7c4a6eafbf97c00eb672f9"
    }
    ).then((value){
    business=value.data["articles"];
    // print(business[0]["title"]);
    emit(BusinessData());
    }).catchError((error){
      // ignore: avoid_print
      print(error.toString());
      emit(BusinessError(error.toString()));
    });
  }

   List<dynamic> sport=[];
  void getSport()
  {
    emit(SportLoad());
     DioHelper.getData("v2/top-headlines",
    {
    "country":"eg",
    "category":"sports",
    "apikey":"525feca1aa7c4a6eafbf97c00eb672f9"
    }
    ).then((value){
    sport=value.data["articles"];
    // print(business[0]["title"]);
    emit(SportData());
    }).catchError((error){
      // ignore: avoid_print
      print(error.toString());
      emit(SportError(error.toString()));
    });
  }

    List<dynamic> science=[];
  void getScience()
  {
    emit(ScienceLoad());
     DioHelper.getData("v2/top-headlines",
    {
    "country":"eg",
    "category":"science",
    "apikey":"525feca1aa7c4a6eafbf97c00eb672f9"
    }
    ).then((value){
    science=value.data["articles"];
    // print(business[0]["title"]);
    emit(ScienceData());
    }).catchError((error){
      // ignore: avoid_print
      print(error.toString());
      emit(ScienceError(error.toString()));
    });
  }

bool? isDark=false;
//used to save theme in the memory cache
void darkMode()
{
  isDark=!isDark!;
 Cache.putData("isDark",isDark!).then((value)
   {
    // print("The value is $value");
    emit(ModeChange());
   }
  );
}
//used to get the value from memory cache and initialize the cache
void put()
{
  if(Cache.getData("isDark")==null)
  {
    Cache.putData("isDark",false);
  }
 isDark= Cache.getData("isDark");
 emit(GetModeChange());
}

    List<dynamic> search=[];
  void getSearch(String value)
  {
    emit(SearchLoad());
     DioHelper.getData("v2/everything",
    {
    "q":value,
    "apikey":"525feca1aa7c4a6eafbf97c00eb672f9"
    }
    ).then((value){
    search=value.data["articles"];
    // print("the result =>${search=value.data["articles"]}");
    emit(SearchData());
    }).catchError((error){
      // ignore: avoid_print
      print(error.toString());
      emit(SearchError(error.toString()));
    });
  }
}