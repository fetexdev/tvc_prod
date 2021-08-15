import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:the_vaping_app/model/store_model.dart';
import 'package:the_vaping_app/utils/color_palette.dart';
import 'package:the_vaping_app/utils/functions.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/view/store/slide_up_panel.dart';
import 'package:the_vaping_app/widget/text_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class MapView extends StatelessWidget {
  final List<StoreModel> storeModel;
  final List<GlobalKey> globalKeys;

  const MapView({
    Key? key,
    required this.storeModel,
    required this.globalKeys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(45.0704900, 7.6868200),
        zoom: 11.0,
        maxZoom: double.infinity,
        onMapCreated: (mapController) {
          print("mappppp created");
        },
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/thevapingapp/cksamz03n3qgp18mvm68o2rm9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGhldmFwaW5nYXBwIiwiYSI6ImNrc2Fta28zZzF2b20zMXMzY2VndXZpbmIifQ.wrr_YfeG5pOayA5DpixblA",
          additionalOptions: {
            "accessToken":
                "pk.eyJ1IjoidGhldmFwaW5nYXBwIiwiYSI6ImNrc2Fta28zZzF2b20zMXMzY2VndXZpbmIifQ.wrr_YfeG5pOayA5DpixblA",
            "id": "mapbox.mapbox-streets-v8",
          },
          placeholderImage: MemoryImage(kTransparentImage),
          backgroundColor: Colors.black,
          tileProvider: NetworkTileProvider(),
        ),
        MarkerLayerOptions(
          markers: List.generate(
            storeModel.length,
            (index) {
              double? latitude = storeModel[index].latitude == "null"
                  ? null
                  : double.tryParse(storeModel[index].latitude);
              double? longitude = storeModel[index].longitude == "null"
                  ? null
                  : double.tryParse(storeModel[index].longitude);

              String sotreName = "";
              if (storeModel[index].title != "null") {
                String storeTitle = storeModel[index].title;

                sotreName = storeTitle.contains("Nizza")
                    ? "Negozio Via Nizza"
                    : storeTitle.contains("Imola")
                        ? "Negozio Imola"
                        : storeTitle.contains("Settimo")
                            ? "Negozio Settimo"
                            : "Negozio Largo Orbassano";
              }

              if (latitude != null && longitude != null) {
                return Marker(
                  width: 150,
                  height: 80,
                  point: LatLng(latitude, longitude),
                  builder: (ctx) => Column(
                    children: [
                      TextWidget(
                        textAlign: TextAlign.center,
                        alignmentGeometry: Alignment.center,
                        text: sotreName,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      GestureDetector(
                        onTap: () {
                          Functions.openBottomSheet(
                            context,
                            SlideUpPanel(
                              storeModel: storeModel,
                              globalKeys: globalKeys,
                              index:index,
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.location_pin,
                          color: ColorPalette.primary,
                          size: 48,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Marker(
                  point: LatLng(0, 0),
                  builder: (context) => const SizedBox(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
