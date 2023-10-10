import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/reusable_components.dart';
class SearchApp extends StatelessWidget {
   const SearchApp({super.key});
  @override
  Widget build(BuildContext context) {
    var result=TextEditingController();
    return BlocConsumer<NewsApp,AppNewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
        appBar: AppBar(titleSpacing: 20.0,foregroundColor: Colors.grey),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: result,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  NewsApp.get(context).getSearch(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Search"),
                  prefixIcon: Icon(Icons.search_sharp),
                ),
                validator: (String? value) {
                  if(value!.isEmpty)
                  {
                  return "Search Must Not Be Empty";
                  }
                  else
                  {
                    return null;
                  }
                },
              ),
            ),
            Expanded(child: buildNews(NewsApp.get(context).search,context,search: true)),
          ],
        ),
      );
      },
    );
  }
}