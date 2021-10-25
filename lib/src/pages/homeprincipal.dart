import 'package:flutter/material.dart';
import 'package:tuaplicacion/src/controllers/controllerUsuario.dart';
import 'package:tuaplicacion/src/models/usuario_model.dart';

class HomePrincipal extends StatefulWidget {
  @override
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  List<UsuarioModel> usuarioModel = List<UsuarioModel>();
  UsuarioController controllerUsuario = new UsuarioController();
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getUsuarioApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text('API 1'),
      ),
      drawer: drawerm(),
      body: ListView.builder(
          itemCount: usuarioModel.length,
          itemBuilder: (BuildContext context, int index) {
            return listItem(
                usuarioModel[index].first.toString(),
                usuarioModel[index].last.toString(),
                usuarioModel[index].email.toString());
          }),
    );
  }

  listItem(String first, String last, String email) {
    return Column(children: [
      ListTile(
        title: Text(first, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(last),
            Text(
              '${email.trim()}',
              style: TextStyle(color: Colors.tealAccent[700], fontSize: 12),
            ),
          ],
        ),
        trailing: Icon(Icons.star_border_outlined),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://1.bp.blogspot.com/-LPq9lLeqtgg/Xl-o-8N0qHI/AAAAAAAAM8E/nUW9Kgylqb03ycg7uol74MBJ47yRvcPigCLcBGAsYHQ/s1600/9e46d2905d70d779a552ff036d5e5b1e.png'),
          radius: 25.0,
        ),
      ),
      Divider()
    ]);
  }

  Future<void> getUsuarioApi() async {
    var response = await controllerUsuario.getUsuarioApi();

    var list = <UsuarioModel>[
      for (var i = 0; i < response.length; i++)
        UsuarioModel(
          first: response[i]['first'].toString(),
          last: response[i]['last'].toString(),
          email: response[i]['email'].toString(),
        ),
    ];
    list.sort((a, b) {
      return a.first
          .toString()
          .toLowerCase()
          .compareTo(b.first.toString().toLowerCase());
    });

    usuarioModel = list;
    refresh();
  }

  void refresh() {
    setState(() {});
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
}
