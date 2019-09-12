import 'package:flutter/material.dart';

class MyTiles extends StatelessWidget {
  final TileItemModel tileItemModel;
  MyTiles({this.tileItemModel});

  Widget _tileContainer(TileItemModel tileModel, BuildContext context){
    return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromRGBO(47, 53, 66, 1.0),
          border: Border.all(width: 1.3, color: Colors.redAccent),
          ),
        child: Center(
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(tileModel.icon, size: 49, color: Color.fromRGBO(75, 101, 132,1.0),),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    tileModel.label,
                    style: TextStyle(color: Colors.white, fontSize: 67, fontWeight: FontWeight.w300),
                    
                  ),
                  Text(
                    tileModel.value,
                    style: TextStyle(color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: _tileContainer(tileItemModel, context),
    );
  }
}

List<List<dynamic>> items = [
  [
    'Humidity',
    Icons.bubble_chart,
    '46 %'
  ],
  
  [
    'Temperature',
    Icons.wifi_tethering,
    '24 `'
  ],
  [
    'Electricity',
    Icons.bubble_chart,
    '24 kWh'
  ],
  [
    'Air Quality',
    Icons.bubble_chart,
    '83 %'
  ],
  [
    'Something',
    Icons.bubble_chart,
    '46 %'
  ],

];

class TileItemModel{
  final IconData icon;
  final String label;
  final String value;
  TileItemModel({this.icon, this.label, this.value});
}

List<TileItemModel> getTileItems(){
    List<TileItemModel> tileItems = List();
   items.map((item){
     tileItems.add(TileItemModel(label: item[2], icon: item[1], value: item[0]));
   }).toList();
   return tileItems;
 }

 List<MyTiles> tiles(){
   List<MyTiles> _tiles = List();
   getTileItems().map((tile){
   _tiles.add(MyTiles(tileItemModel: tile,));
   }).toList();
   return _tiles;
 }


