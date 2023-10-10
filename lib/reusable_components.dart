import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newapp/webview.dart';

Widget itemBuilder(list,context) => InkWell(
  onTap: () {
    navigateTo(context, WebViewScreen(url: list["url"]));
  },
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              width: 120.0,
  
              height: 120.0,
  
              decoration: BoxDecoration(
  
                borderRadius: BorderRadiusDirectional.circular(10.0),
  
                image: DecorationImage(image: NetworkImage(list["urlToImage"] ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'),
  
                //'https://www.thaqfny.com/wp-content/uploads/2023/08/5116370994.jpg'
  
                fit:BoxFit.cover,
  
                ),
  
              )
  
            ),
  
           const SizedBox(width: 20.0,),
  
            Expanded(
  
              child: SizedBox(height: 120.0,
  
                child: Column(
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                   children: [
  
                     Expanded(
  
                       child: Text(
  
                         list["title"],
  
                         maxLines: 3,
  
                         overflow: TextOverflow.ellipsis,
  
                         style: Theme.of(context).textTheme.bodyLarge,
  
                       ),
  
                     ),
  
                     Text(
  
                       list["publishedAt"],
  
                       style: const TextStyle(
  
                         color: Colors.grey,
  
                       ),
  
                     )
  
                   ],
  
                )
  
                ),
  
            )
  
          ],
  
         ),
  
      ),
);

    Widget hr()=>  Padding(
      padding:  const EdgeInsetsDirectional.only(start:20.0),
      child:Container(
        color: Colors.black38,
         width: double.infinity,
        height: 1.0,
      ),
    );

    Widget buildNews(list,context,{search=false})=>ConditionalBuilder(
      condition:list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder:(context, index) => itemBuilder(list[index],context),
       separatorBuilder: (context, index) =>hr(),
        itemCount:list.length
        ),
      fallback:(context) =>search? Container() : const Center(child:CircularProgressIndicator()),
      );

      void navigateTo(context , widget)=>Navigator.push(context, MaterialPageRoute(builder:(context) =>widget));

      Widget formfield({
  required TextEditingController controller,
  var sumbit,
  var change,
  required var validate,
  required TextInputType type,
  required String label,
  required Icon prefix,
  var suffix,
  bool ispassword = false,
}) =>
    TextFormField(
      validator: validate,
      onChanged: change,
      controller: controller,
      onFieldSubmitted: sumbit,
      keyboardType: type,
      obscureText: ispassword,
      decoration: InputDecoration(
        // ignore: unnecessary_string_interpolations
        labelText: '$label',
        border: const OutlineInputBorder(),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );