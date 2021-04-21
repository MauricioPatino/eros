import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget{
  final options = [
    { 'icon': Icons.person, 'name': 'PERFIL DE USUARIO', 'path': ROUTE_USER},
    { 'icon': Icons.credit_card, 'name': 'MÉTODO DE PAGO','path': ROUTE_PAYMENT },
    { 'icon': Icons.shopping_cart, 'name': 'CONFIGURACIÓN DE PEDIDOS', 'path': ROUTE_CART},
    { 'icon': Icons.list, 'name': 'INSTRUCCIONES', 'path': ROUTE_INSTRUCTION },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details){
          if(details.velocity.pixelsPerSecond.dx < 0)
            Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/brick_wall.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: buildBody(context),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context){
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              child: Text('S E T T I N G S',
                style: TextStyle(
                  color: Theme.of(context).dialogBackgroundColor,
                  fontSize: 40,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int i){
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      onTap: () => Navigator.of(context).pushNamed(this.options[i]['path']),
                      leading: Icon(this.options[i]['icon'],
                        size: 50,
                        color: Theme.of(context).dialogBackgroundColor,
                      ),
                      title: Text(this.options[i]['name'],
                        style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                      ),
                    ),
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}