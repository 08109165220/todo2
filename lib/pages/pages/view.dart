import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'album.dart';
import 'logic.dart';

class PagesPage extends StatelessWidget {
  final logic = Get.put(PagesLogic());
  final state = Get.find<PagesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
          body:FutureBuilder<List<Album>>(
            future: logic.Getallphotos(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(height: 250,
                      width: double.infinity,
                      child: Card(

                        shadowColor: Colors.blue,
                        color: Colors.white,

                        child: ListTile(
                          leading: FadeInImage(
                              placeholder: AssetImage(
                                  "assets/icons8-google-images-64.png"),
                              image: NetworkImage(snapshot.data![index]!.Url.toString()
                              )
                          ),
                          title: Text(snapshot.data![index].tittle.toString()),
                          subtitle: NeumorphicText(
                            snapshot.data![index].album.toString(),

                            style: NeumorphicStyle(
                              depth: 4, //customize depth here
                              color: Colors.blue, //customize color here
                            ),
                            textStyle: NeumorphicTextStyle(
                              fontSize: 18, //customize size here
                              // AND others usual text style properties (fontFamily, fontWeight, ...)
                            ),
                          ),
                          trailing: NeumorphicIcon(
                            Icons.add_circle,
                            size: 80,
                          ),
                        ),
                      ),
                    );
                  },);
              }
              else{return Center(child: CircularProgressIndicator());}
          },)
    );
  }
}
