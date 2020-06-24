import 'package:flutter/material.dart';
import 'package:swara/core/const.dart';
import 'package:swara/widgets/custom_button.dart';
import 'package:swara/widgets/progress_widget.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin{
double _value ;
  AnimationController _controller;
  var isPlay;

  @override
  void initState(){
    _controller =AnimationController(vsync: this, duration: Duration(microseconds: 250));
    isPlay =false;
    _value = 0.9 ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      /**
       * Contains Back button and menu button details
       */
      body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Back navigator button
                  CustomButtonWidget(
                    size: 50,
                    onTap:(){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.styleColor,
                    ),
                  ),
                  //Menu button
                  Text("PLAYING NOW",
                    style: TextStyle(
                      color: AppColors.styleColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  CustomButtonWidget(
                    size: 50,
                    onTap: (){},
                    child: Icon(
                      Icons.menu,
                      color: AppColors.styleColor,
                    ),
                  )
                ],
              ),
            ),
            /** The big logo in playpage**/
            Padding(
              padding: EdgeInsets.all(18),
            ),
            CustomButtonWidget(
              image: "assets/logo.jpg",
              size: MediaQuery.of(context).size.width *.7,
              borderwidth:5,
/*              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>DetailPage(),
                    )
                );
              },*/
              // To give remove the logo border set isActive =false
              //isActive: true,
            ),

            /** detail of current playing track  **/
            Text("Flume",
              style: TextStyle(
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              )
            ),

            Text("Flume -Kucca",
                style: TextStyle(
                  color: AppColors.styleColor.withAlpha(90),
                  fontSize: 16,
                )
            ),

            /** Bottom backword,forword and play pause button**/
            Expanded(
              child: SizedBox(
                //height: MediaQuery.of(context).size.width *.1,
              ),
            ),

             /** progress bar goes here **/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomProgressWiget(
                value: _value,
                labelStart: '1:21',
                labelEnd: '2:46',
              ),
            ),
             Expanded(child: SizedBox(),),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 42),
               //padding: const EdgeInsets.fromLTRB(30, 96, 32, 0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /**Rewind button**/
                    CustomButtonWidget(
                      size: 70,
                      onTap: (){
                        setState(() {
                          if(_value > 0.3){
                            _value -=.1;
                          }
                        });
                      },
                      child: Icon(
                        Icons.fast_rewind,
                        color: AppColors.styleColor,
                      ),
                      borderwidth: 5,
                    ),
                    /*** Play pause button**/
                    CustomButtonWidget(
                      size: 80,
                      onTap: () {
                        if (_controller.value == 0.0){
                          _controller.forward();
                          setState(() {
                            isPlay = false;
                          });
                        }else{
                          _controller.reverse();
                          setState(() {
                            isPlay = true;
                          });
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.pause_play,
                        progress:_controller,
                        color: isPlay ? Colors.white : AppColors.styleColor ,
                      ),
                      isActive: isPlay,
                      borderwidth: 5,
                    ),
                    /**Forword button**/
                    CustomButtonWidget(
                      size: 70,
                      onTap: (){
                        setState(() {
                          if(_value < .9){
                            _value+=.1;
                          }

                        });
                      },
                      child: Icon(
                          Icons.fast_forward,
                        color: AppColors.styleColor,
                      ),
                      borderwidth: 5,
                    ),
                  ],
                ),
             ),
            /** Sized box to allign the bottom 3 buttons**/
            SizedBox(
              height: 30,
            )
          ],
        ),
    );
  }
}
