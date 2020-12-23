import 'package:flutter/material.dart';
import 'package:spotify/CardInfo.dart';
import 'package:palette_generator/palette_generator.dart';

class AlbumInfo extends StatelessWidget {
  final CardInfo cardInfo;
  final int num;
  final PaletteGenerator palette;
  final Color c;
  AlbumInfo(this.cardInfo, this.num, this.c, this.palette);

  String sOrA (){
    if (cardInfo.playlist == false){
      if (cardInfo.songs.length>1) {
        return 'EP BY ';
      }
      return 'SINGLE BY ';
    }
    else{
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                backgroundColor: c.withOpacity(0.2),
                floating: true,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: palette.darkVibrantColor?.color
                ),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: 24,
                    ),
                    child: Icon(Icons.more_vert),
                  )
                ],
              ),
            ];
          },
          body: ListView(
            padding: const EdgeInsets.only(top:0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height:330,
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(colors: [c, c.withOpacity(0.9),c.withOpacity(0.8), c.withOpacity(0.7), c.withOpacity(0.55), c.withOpacity(0.4), c.withOpacity(0.35), c.withOpacity(0.2)],
                              begin: const FractionalOffset(0.0, 1.0),
                              end: const FractionalOffset(0.0, 0.0),
                              tileMode: TileMode.clamp
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Hero(
                                tag: cardInfo.cardTitle+ num.toString(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  child: Image(
                                    image: cardInfo.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              cardInfo.cardTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                              color: palette.darkVibrantColor?.color
                              ),)
                          ),
                          SizedBox(height: 10,),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                sOrA()+ cardInfo.artist,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: palette.darkVibrantColor?.color
                                ),)
                          )
                        ],
                      ),
                    ],
                  ),

                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    decoration: BoxDecoration(
                      color: c
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2.3,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0) //         <--- border radius here
                      ),
                    ),
                  ),
                  Center(
                    child: FractionalTranslation(
                        translation: Offset(0, -0.5),
                        child: FloatingActionButton.extended(
                          backgroundColor: palette.darkVibrantColor?.color,
                          foregroundColor: palette.lightVibrantColor?.color,
                          label: const Text('  SHUFFLE PLAY  ', style: TextStyle(
                            fontWeight: FontWeight.w600
                          ),),
                          onPressed: (){
                            debugPrint('button');
                          },
                        )
                    ),
                  )
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cardInfo.songs.length,
                  padding: const EdgeInsets.only(left: 23.5),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          child: ListTile(
                            leading: Text(cardInfo.songs[index],
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Icon(Icons.more_vert),
                            contentPadding: const EdgeInsets.only(left: 8, right: 23.5),
                          ),
                          onTap: (){
                            debugPrint('nice');
                          },
                        )
                      ],
                    );
                  }
              )

            ],
          )
      ),
//      bottomNavigationBar: BottomAppBar(
//        elevation: 0,
//        child: Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children: <Widget>[
//            Image(
//                image: AssetImage('assets/images/home.png'),
//                width: 26,
//                height: 55,
//                color: Colors.greenAccent[400]),
//            Image(
//                image: AssetImage('assets/images/compass.png'),
//                width: 26,
//                height: 55,
//                color: Colors.grey),
//            Image(
//                image: AssetImage('assets/images/search.png'),
//                width: 26,
//                height: 55,
//                color: Colors.grey),
//            Image(
//                image: AssetImage('assets/images/book-open.png'),
//                width: 26,
//                height: 55,
//                color: Colors.grey),
//          ],
//        ),
//      ),
    );
  }
  Future<Color> nice () async{
    return palette.lightVibrantColor.color.withOpacity(0.5);
  }
}