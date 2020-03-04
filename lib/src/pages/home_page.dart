import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas de cine'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
            onPressed: (){},
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              _swiperTarjetas()
            ],
          )
        )
    );
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if(snapshot.hasData){
          return CardSwiper(peliculas: snapshot.data);
        }else{
          return Container(
              child: Center(
                child: CircularProgressIndicator()
              )
            );
        }
      }
    );
  }
}