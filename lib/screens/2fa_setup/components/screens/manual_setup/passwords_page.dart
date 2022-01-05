//Import the files needed for widgets
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Import the file components where other widgets are stored separetly
import 'components/main_body.dart';               //Main Body widget
import 'components/top_app_bar.dart';             //Top App Bar Widget

//Set main class of this Page
class TwoFAManual extends StatelessWidget {
  const TwoFAManual({Key? key}) : super(key: key);

  static String routeName = "/twofaManual";  //Setting the route name to "/" makes it the default page so the app starts here

  @override                                                             
  Widget build(BuildContext context) {
    
    //Start Widget Sequence but change the navigation bar color first                                  
    return AnnotatedRegion<SystemUiOverlayStyle>(                       
      value: SystemUiOverlayStyle.light.copyWith(                       
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,  
      ),
      
      //Create the main scaffold (main page widget, house for all other widgets)
      child: const Scaffold(

      //Enable widgets get behind top and bottom App Bar, so they dont clip through                                                      
      extendBodyBehindAppBar: true,   //Behind top App Bar
      
      //Imported Widgets                                                      
      appBar: TopAppBar(),                                                                                                           
      body: MainBody(),                                                         
    ),
    );
  }
}