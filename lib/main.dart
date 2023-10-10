import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/HomeLayout.dart';
import 'package:newapp/cache/cache.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/dioHelper/dio.dart';

void main()async
{
WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await Cache.init();
  return runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    BlocProvider(
      create: (context) => NewsApp()..getBusiness()..put(),
      child: BlocConsumer<NewsApp,AppNewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          bool? mode=NewsApp.get(context).isDark;
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:const HomeLayout(),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              titleSpacing: 20.0,
              actionsIconTheme: IconThemeData(color: Colors.black),
              // backwardsCompatibility:false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white
                ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
            ),
            primarySwatch: Colors.deepOrange,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              )
            )
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 67, 66, 66),
            appBarTheme: const AppBarTheme(
              titleSpacing: 20.0,
              actionsIconTheme: IconThemeData(color: Colors.white),
              // backwardsCompatibility:false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor:  Color.fromARGB(255, 67, 66, 66)
                ),
              backgroundColor:  Color.fromARGB(255, 67, 66, 66),
              elevation: 0.0,
              titleTextStyle: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor:  Color.fromARGB(255, 67, 66, 66),
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
            ),
            primarySwatch: Colors.deepOrange,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              )
            )
          ),
          themeMode: (mode==false)? ThemeMode.light:ThemeMode.dark,
        );
        },
      ),
    );
  }
}