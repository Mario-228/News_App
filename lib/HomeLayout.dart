// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:newapp/business.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/reusable_components.dart';
// import 'package:newapp/science.dart';
import 'package:newapp/search.dart';
// import 'package:newapp/sport.dart';
// import 'package:newapp/dioHelper/dio.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsApp,AppNewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, const SearchApp());
              }, icon:const Icon( Icons.search)),
              const SizedBox(width: 10.0,),
              IconButton(onPressed: 
              (){
                 NewsApp.get(context).darkMode();
                 NewsApp.get(context).getBusiness();
                 NewsApp.get(context).getSport();
                 NewsApp.get(context).getScience();
              //   if(NewsApp.get(context).currentIndex==0)
              //  {navigateTo(context,const Business());}
              //  if(NewsApp.get(context).currentIndex==1)
              //  {navigateTo(context,const Sport());}   
              //  if(NewsApp.get(context).currentIndex==2)
              //  {navigateTo(context,const Science());}            
               },
               icon:const Icon(Icons.brightness_4_outlined),
               )
            ],
          ),
          body: NewsApp.get(context).screens[NewsApp.get(context).currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        currentIndex: NewsApp.get(context).currentIndex,
      onTap: (value) 
      {
        NewsApp.get(context).getIndex(value);
      },
      items: 
      const [
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: "Business",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports),
          label: "Sports",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: "Science",
        ),
      ]),
    );
      },
    );
  }
}

//BaseUrl => https://newsapi.org/
//mehtod => v2/everything?
//Query =>  q=tesla&from=2023-07-12&sortBy=publishedAt&apiKey=525feca1aa7c4a6eafbf97c00eb672f9