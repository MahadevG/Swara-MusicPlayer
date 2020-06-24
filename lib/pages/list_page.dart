import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swara/core/const.dart';
import 'package:swara/models/music_model.dart';
import 'package:swara/widgets/custom_button.dart';

import 'detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<MusicModel> _list;
  int _playId;

  @override
  void initState(){
    _playId =4;
    _list= MusicModel.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(
          "Music",
          style: TextStyle(color: AppColors.styleColor),
        ),
      ),
      //body: CustomButtonWidget(child: Icon(Icons.favorite),),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomButtonWidget(
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.styleColor,
                        size: 30,
                      ),
                      size: 60, onTap: (){},
                    ),
                    CustomButtonWidget(
                      image: "assets/logo.jpg",
                      //size: 160,
                      size: MediaQuery.of(context).size.width *.41,
                      borderwidth:5,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>DetailPage(),
                          )
                        );
                      },
                      // To give remove the logo border set isActive =false
                      //isActive: true,
                    ),
                    CustomButtonWidget(
                      child: Icon(
                        Icons.menu,
                        color: AppColors.styleColor,
                        size: 30,
                      ),
                      size: 60, onTap: () {  },
                    ),
                  ],
                ),
              ),

              /**
               * Contains code realted to the list of all songs and its properties ie.. bottom container
               */
              Expanded(
                child: ListView.builder(
                  physics:BouncingScrollPhysics() ,
                  itemCount: _list.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>DetailPage(),
                            )
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 5000),
                        /*
                        To highlight the current playing track p below decoration widget
                         */
                        decoration: BoxDecoration(
                          color: _list[index].id == _playId ? AppColors.activeColor : AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(18),
                        child: Row(
                          //To bring all the fetched data to one side
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_list[index].title,
                                  style: TextStyle(
                                    color: AppColors.styleColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(_list[index].album,
                                  style: TextStyle(
                                    color: AppColors.styleColor.withAlpha(100),
                                    fontSize: 16,
                                  ),
                                ),
                              ],

                            ),

                            /**
                             * Play and pause functionality here
                             */
                            CustomButtonWidget(
                              size: 50,
                              child: Icon(
                                _list[index].id == _playId ? Icons.pause : Icons.play_arrow,
                                color:_list[index].id == _playId ? Colors.white :AppColors.styleColor,
                              ),
                              isActive: _list[index].id == _playId,
                              onTap: () {
                                setState(() {
                                  _playId=_list[index].id;
                                });
                              },
                            ),

                          ],

                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainColor.withAlpha(0),
                    AppColors.mainColor
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
