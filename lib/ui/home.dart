// Created by Sanjeev Sangral on 19/09/21.
import 'package:flutter/material.dart';
import 'package:game_tv/model/api_response.dart';
import 'package:game_tv/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    Size size = MediaQuery.of(context).size;
    if(homeProvider.apiResponse == null){
      homeProvider.tvListApiCall(context, _scaffoldKey);
    }
    print('Build call...');
    return Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 60.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu_outlined),
                  Text('Flyingwolf',style: TextStyle(fontWeight: FontWeight.bold),),
                  Container()
                ],
              ),
              homeProvider.apiResponse == null ? Center(child: CircularProgressIndicator()):
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.0),
                      itemCount: homeProvider.apiResponse.data.tournaments.length,
                      itemBuilder: (context, index){
                        return _buildCard(homeProvider.apiResponse.data.tournaments[index],size);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }

  Widget _buildCard(Tournaments tournaments, Size size){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0),),
        child: Stack(
          children: [
            SizedBox(
                height: 200.0,
                width: size.width,
                child: Image.network(tournaments.coverUrl,fit:BoxFit.fill)),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.white,
                  child: ListTile(
                    title: Text(tournaments.gameName, overflow: TextOverflow.ellipsis,),
                    subtitle: Text(tournaments.name, overflow: TextOverflow.ellipsis),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
