import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/reusable_components.dart';

class  Sport extends StatelessWidget {
  const Sport ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsApp,AppNewsStates>(
        listener: (context, state) => NewsApp(),
        builder: (context, state){
          var list=NewsApp.get(context).sport;
          return buildNews(list,context);
        } ,
    );
  }
}