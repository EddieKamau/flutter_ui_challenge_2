import 'package:challenge_07/tiles.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  double currentPage = 0;

  List<MyTiles> _tileItems(){
    return tiles();
  }

  @override
  Widget build(BuildContext context) {

  PageController _controller = PageController(initialPage: 0, );
  _controller.addListener((){
      setState(() {
        currentPage = _controller.page;
      });
    });

    
    return Material(
      child: Align(
        alignment: Alignment.center,
        child: Container(       

          color: Color.fromRGBO(75, 101, 132,1.0),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Stack(
                children: <Widget>[
                  TileController(currentPage),
                  PageView.builder(
                    controller: _controller,
                    itemCount: _tileItems().length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      return Container();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TileController extends StatefulWidget {
  final double pageNo;
  TileController(this.pageNo);
  @override
  _TileControllerState createState() => _TileControllerState();
}

class _TileControllerState extends State<TileController> {



    Widget myCard(index){
    double delta = index - widget.pageNo;
    bool isOnTop = delta < 0;
    double absDelta = isOnTop ? -delta : delta;

    return Positioned.directional(
        top: isOnTop ? 0 : 70 *absDelta*(1-absDelta/10),
        bottom: isOnTop ? 70 *absDelta*(1-absDelta/10) : 0,
        start: 0,
        end: 0,
        textDirection: TextDirection.ltr,
        child: Transform.scale(
          scale: 1.0 - (absDelta/10) ,
          child: Center(
            child: tiles()[index]
          ),
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
  List<Widget> cardList = List();
  List<Widget> topCardList = List();
  List<Widget> bottomCardList = List();
    

    for (int i = 0; i < tiles().length; ++i){
      double delta = i - widget.pageNo;
      bool isOnTop = delta < 0;
      Widget cardItem = myCard(i);
      if(i != widget.pageNo.floor()){
        isOnTop ? topCardList.add(cardItem) : bottomCardList.add(cardItem);
      }
    }
    cardList.addAll(topCardList);
    cardList.addAll(bottomCardList.reversed);
    cardList.add(myCard(widget.pageNo.toInt()));

    return Stack(
      children: cardList,
    );
  }
}
