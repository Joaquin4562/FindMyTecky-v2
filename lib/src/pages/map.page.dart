import 'package:find_my_tecky_v2/src/services/socket.controller.dart';
import 'package:find_my_tecky_v2/src/widgets/list.tile.drawer.dart';
import 'package:find_my_tecky_v2/src/widgets/loading.server.page.dart';
import 'package:find_my_tecky_v2/src/widgets/speed.dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final socketController = Get.put(SocketController());
    if (socketController.serverStatus != ServerStatus.Online) {
      return buildLoadingServerPage();
    } else {
      return GetBuilder<SocketController>(
          init: socketController,
          builder: (_) {
            return Scaffold(
              floatingActionButton: SpeedDialWidget(
                onTapAnadirParada: () {},
                onTapCentrarVista: () {},
              ),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black54,
                        size: 26,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    );
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black54,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              drawer: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Color(0xffA85C5C).withOpacity(0.8),
                  ),
                  child: Drawer(
                    elevation: 0,
                    child: Column(
                      children: [
                        DrawerHeader(
                          child: ListTile(
                            title: Text(
                              'FMT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                            subtitle: Text(
                              'Juan gonzales',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ListTileDrawer(
                          title: 'CENTRO',
                          icon: Icons.navigate_next,
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ListTileDrawer(
                          title: 'ROTARIA',
                          icon: Icons.navigate_next,
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ListTileDrawer(
                          title: 'LINARES',
                          icon: Icons.navigate_next,
                          onTap: () {},
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ListTileDrawer(
                              title: 'CERRAR SESION',
                              icon: Icons.close,
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: MapWidget(),
            );
          });
    }
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocketController>(
      builder: (_) {
        return Container(
          color: Colors.black12,
          child: Center(
            child: Text('MAP'),
          ),
        );
      },
    );
  }
}
