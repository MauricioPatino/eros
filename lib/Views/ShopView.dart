import 'package:eros/Constants/Routes.dart';
import 'package:eros/Views/CartView.dart';
import 'package:flutter/material.dart';
import 'package:eros/bloc/cart_items.dart';

class ShopView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Store'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).pushNamed(ROUTE_CART),
          )
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/brick_wall.png'),
              fit: BoxFit.cover,
            ),
      ),
        child: ShopItemsWidget(),
      )
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data["shop items"].length > 0
            ? shopItemsListBuilder(snapshot)
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }
}

Widget shopItemsListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["shop items"];
      return ListTile(
        leading: Image(
           image: AssetImage("${shopList[i]['image']}"),
      ),
        title: Text(shopList[i]['name'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
        subtitle: Text("\$${shopList[i]['price']}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
        trailing: Container(
          color: Colors.green,
          child: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              bloc.addToCart(shopList[i]);
            },
          ),
        ),
        onTap: () {},
      );
    },
  );
}

// class ShopView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: buildAppBar(context),
//       body: GestureDetector(
//         onHorizontalDragEnd: (DragEndDetails details) {
//           if (details.velocity.pixelsPerSecond.dx > 0)
//             Navigator.of(context).pop();
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/img/brick_wall.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: ShopItems(),
//         ),
//       ),
//     );
//   }
// }
//   Widget buildAppBar(BuildContext context){
//     return AppBar(
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.transparent,
//       centerTitle: true,
//       title: Text('Store'),
//       leading: IconButton(
//         onPressed: () => Navigator.of(context).pop(),
//         icon: Icon(Icons.arrow_back_ios),
//       ),
//       actions: <Widget>[
//         IconButton(
//           onPressed: () => Navigator.of(context).pushNamed(ROUTE_CART),
//           icon: Icon(Icons.shopping_cart),
//         ),
//       ],
//     );
//   }
//
//   class ShopItems extends StatelessWidget {
//     Widget build(BuildContext context) {
//         return StreamBuilder(
//           initialData: bloc.allItems,
//           stream: bloc.getStream,
//           builder: (context, snapshot) {
//             return snapshot.data["shop items"].length > 0
//                 ? shopItemsListBuilder(snapshot)
//                 : Center(child: Text("All items in shop have been taken"));
//           },
//         );
//     }
// }
//
// Widget shopItemsListBuilder(snapshot) {
//   return ListView.builder(
//     itemCount: snapshot.data["shop items"].length,
//     itemBuilder: (BuildContext context, i) {
//       final shopList = snapshot.data["shop items"];
//         return ListTile(
//           title: Text(shopList[i]['name']),
//           subtitle: Text("\$${shopList[i]['price']}"),
//           trailing: IconButton(
//             icon: Icon(Icons.add_shopping_cart),
//             onPressed: () {
//               bloc.addToCart(shopList[i]);
//             },
//         ),
//         onTap: () {},
//       );
//     },
//   );
// }


  // Widget buildBody(BuildContext context){
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 0.1 * MediaQuery.of(context).size.width),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Card(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30),
  //           ),
  //           color: Colors.transparent,
  //           child: Padding(
  //             padding: EdgeInsets.all(10),
  //             child: Row(
  //
  //               children: <Widget>[
  //                 Image.asset('assets/img/condoms_icon.png', height: 100,),
  //                 Text('CONDONES',
  //                   style: TextStyle(
  //                     color: Theme.of(context).dialogBackgroundColor,
  //                     fontSize: 22,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Card(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30),
  //           ),
  //           color: Colors.transparent,
  //           child: Padding(
  //             padding: EdgeInsets.all(10),
  //             child: Row(
  //               children: <Widget>[
  //                 Image.asset('assets/img/lubricant_icon.png', height: 100,),
  //                 Text('LUBRICANTES',
  //                   style: TextStyle(
  //                     color: Theme.of(context).dialogBackgroundColor,
  //                     fontSize: 22,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Card(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30),
  //           ),
  //           color: Colors.transparent,
  //           child: Padding(
  //             padding: EdgeInsets.all(10),
  //             child: Row(
  //               children: <Widget>[
  //                 Image.asset('assets/img/poppers_icon.png', height: 100,),
  //                 Text('POPPERS',
  //                   style: TextStyle(
  //                     color: Theme.of(context).dialogBackgroundColor,
  //                     fontSize: 22,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
 // }

