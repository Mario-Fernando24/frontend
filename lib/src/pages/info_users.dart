import 'package:flutter/material.dart';
import 'package:tuaplicacion/src/controllers/controllerUsuario.dart';

class InfoUsuario extends StatefulWidget {
  @override
  _InfoUsuarioState createState() => _InfoUsuarioState();
}

class _InfoUsuarioState extends State<InfoUsuario> {
  UsuarioController controllerUsuario = new UsuarioController();
  var response;
  String title;
  String first;
  String last;
  String foto;
  String phone;
  String street;
  String email;
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text('Usuario'),
      ),
      drawer: drawerm(),
      body: ListView(
        padding: EdgeInsets.all(1.0),
        children: <Widget>[_head(), _body()],
      ),
    );
  }

  Widget _head() {
    return Card(
      //sombra de la tarjeta
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0)),
      //las tarjetas lo principal es el child ya que puedo colocar cualquier cosa
      child: Column(
        children: <Widget>[
          Container(
            child: ListTile(
                tileColor: Colors.tealAccent[700],
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(foto.toString() ?? 'Nombre de usuario'),
                  radius: 25.0,
                ),
                title: Column(children: <Widget>[
                  Text(
                    title.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    first.toString() + ' ' + last.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ])),
          ),
          Container(
            color: Colors.tealAccent[700],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Column(children: <Widget>[
                    Text(
                      '112',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Contacto',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ]),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Column(children: <Widget>[
                    Text(
                      '48',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Favoritos',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ]),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Column(children: <Widget>[
                    Text(
                      '12',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Grupos',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ]),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerm() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Mario Muñoz',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://scontent.fclo8-1.fna.fbcdn.net/v/t1.6435-9/82657309_10221699486696864_8736089120742309888_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeGGOHtCIQmWqfscB306NrbF_9toYhxTPo__22hiHFM-j1R-upVCe3s4itDEXjsqQrw&_nc_ohc=KngamSKBOh0AX_7c8zg&_nc_ht=scontent.fclo8-1.fna&oh=ab514c26659cd52c55f0f24423fce8e4&oe=619A69F1'),
                    radius: 40.0,
                  ),
                ]),
            decoration: BoxDecoration(
              color: Colors.tealAccent[700],
            ),
          ),
          ListTile(
            title: Text('API 1'),
            trailing: Icon(Icons.developer_mode),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            title: Text('API 2'),
            trailing: Icon(Icons.developer_mode),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'info');
            },
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Card(
      //sombra de la tarjeta
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //las tarjetas lo principal es el child ya que puedo colocar cualquier cosa
      child: Column(
        children: <Widget>[
          Column(
            //propiedad para colocar fila fila al final
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.star_outlined,
                      color: Colors.tealAccent[700],
                    ),
                    onPressed: () {}),
                FlatButton(
                  child: Column(children: <Widget>[
                    Text(email.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))
                  ]),
                  onPressed: () {},
                ),
              ]),
              Divider(),
              Row(children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.call,
                      color: Colors.tealAccent[700],
                      //Icons.arrow_back_ios
                    ),
                    onPressed: () {}),
                FlatButton(
                  child: Row(children: <Widget>[
                    Text(phone.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      color: Colors.tealAccent[700],
                      child: Text('CALL',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )
                  ]),
                  onPressed: () {},
                ),
              ]),
              Divider(),
              Row(children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.place,
                      color: Colors.tealAccent[700],

                      //Icons.arrow_back_ios
                    ),
                    onPressed: () {}),
                FlatButton(
                  child: Column(children: <Widget>[
                    Text(street.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))
                  ]),
                  onPressed: () {},
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }

  Future<void> getUser() async {
    response = await controllerUsuario.getUsuarioDetalleApi();
    setState(() {
      print('====================');
      foto = response['results'][0]['picture']['thumbnail'].toString();
      print(response['results'][0]['location']['street'].toString());
      title = response['results'][0]['name']['title'].toString();
      first = response['results'][0]['name']['first'].toString();
      last = response['results'][0]['name']['last'].toString();
      phone = response['results'][0]['phone'].toString();
      street = response['results'][0]['location']['street']['name'].toString() +
          '  ' +
          response['results'][0]['location']['street']['number'].toString();
      email = response['results'][0]['email'].toString();

      print('====================');
    });
  }

  void refresh() {
    setState(() {});
  }
}
