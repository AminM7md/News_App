import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/tabs/tab_widget.dart';
import 'package:news_app/model/Category.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot){
        ///in loading case
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(
            color: AppColors.primaryLightColor,
          )
          );
          ///in client error case
        }else if(snapshot.hasError){
          return Column(
            children: [
              Text("Something went wrong"),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryLightColor,
                    foregroundColor: AppColors.whiteColor,
                  ),
                  onPressed: (){
                    ApiManager.getSources(widget.category.id);
                    setState(() {

                    });
                  },
                  child: Text("Try Again")
              ),
            ],
          );
        }
        ///server(response) => success , error
        // if(snapshot.data == null){
        //   return Text("No data available");
        // }
        if(snapshot.data!.status != "ok"){
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: (){
                    ApiManager.getSources(widget.category.id);
                    setState(() {

                    });
                  },
                  child: Text("Try Again")
              ),
            ],
          );
        }
        ///in success case
        var sourceList = snapshot.data!.sources!;
        // if(sourceList == null){
        //   return Text("No sources available");
        // }
        return TabWidget(sourcesList: sourceList);
      },

    );
  }
}
