import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_vaping_app/model/store_model.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/widget/loader.dart';
import 'package:the_vaping_app/widget/text_widget.dart';

class StoreCard extends StatelessWidget {
  final StoreModel data;
  final GlobalKey globalKey;
  final List<String> images;

  const StoreCard({
    Key? key,
    required this.data,
    required this.globalKey,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: globalKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: ((Sizer().height -
                      kToolbarHeight -
                      kToolbarHeight -
                      kBottomNavigationBarHeight) /
                  1.5) /
              3,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, _index) {
              return images.isEmpty
                  ? const SizedBox()
                  : CachedNetworkImage(
                      imageUrl: images[_index],
                      imageBuilder: (context, imageProvider) => Container(
                        margin: const EdgeInsets.only(right: 4),
                        width: Sizer().width / 2.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          Loader(width: Sizer().width / 2.5),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[900],
                        width: Sizer().width / 2.5,
                        child: Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: TextWidget(
              edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 2.w),
              text: data.title,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[600]),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              children: [
                TextWidget(
                  text: data.rating,
                  fontSize: 14.sp,
                ),
                const SizedBox(width: 2),
                Row(
                  children: generateCommentsStars(double.tryParse(data.rating)),
                ),
                const SizedBox(width: 2),
                TextWidget(
                  text: data.reviews,
                  fontSize: 14.sp,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextWidget(
          edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 2.w),
          text: data.description,
          fontSize: 16.sp,
        ),
        const SizedBox(height: 8),
        TextWidget(
            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 2.w),
            text: getTodayDay(),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
        const SizedBox(height: 8),
        TextWidget(
          edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 2.w),
          text: getTodayOpeningHours(data),
          fontSize: 16.sp,
        ),
        const SizedBox(height: 8),
        !data.title.contains("Orbassano")
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.done, color: Colors.green),
                              const SizedBox(width: 4),
                              TextWidget(
                                text: "Acquisti in negozio",
                                fontSize: 16.sp,
                              )
                            ],
                          ),
                          SizedBox(width: 2.w),
                          Row(
                            children: [
                              const Icon(Icons.done, color: Colors.green),
                              const SizedBox(width: 4),
                              TextWidget(
                                text: "Ritiro all'estero",
                                fontSize: 16.sp,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.done, color: Colors.green),
                        const SizedBox(width: 4),
                        TextWidget(
                          text: "Consegna a domicilio",
                          fontSize: 16.sp,
                        )
                      ],
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    const Icon(Icons.done, color: Colors.green),
                    const SizedBox(width: 4),
                    TextWidget(
                      text: "Ritiro in negozio",
                      fontSize: 16.sp,
                    )
                  ],
                ),
              ),
        const SizedBox(height: 8),
        Container(
          height: 15.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              Expanded(
                child: Material(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Ordina al telefono"),
                          const Icon(Icons.phone),
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.directions, size: 12.w, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.black, height: 1),
      ],
    );
  }
}

List<Widget> generateCommentsStars(double? starsPoint) {
  if (starsPoint != null) {
    List<Icon> _starsIcon = List.generate(starsPoint.toInt(), (index) {
      return Icon(Icons.star, color: Colors.amber[700], size: 14.sp);
    });

    if (((starsPoint.toInt() + 0.3) < starsPoint)) {
      _starsIcon
          .add(Icon(Icons.star_half, color: Colors.amber[700], size: 14.sp));
    }
    return _starsIcon;
  } else {
    return [const SizedBox()];
  }
}

String getTodayDay() {
  DateTime dateTime = DateTime.now();

  return dateTime.weekday == 1
      ? "Orario di Lunedì"
      : dateTime.weekday == 2
          ? "Orario di Martedì"
          : dateTime.weekday == 3
              ? "Orario di Mercoledì"
              : dateTime.weekday == 4
                  ? "Orario di Giovedì"
                  : dateTime.weekday == 5
                      ? "Orario di Venerdì"
                      : dateTime.weekday == 6
                          ? "Orario di Sabato"
                          : "Orario di Domenica";
}

String getTodayOpeningHours(StoreModel storeDataModel) {
  String openingHours;

  openingHours = getTodayDay().contains("Lunedì")
      ? storeDataModel.orarioLunedi
      : getTodayDay().contains("Martedì")
          ? storeDataModel.orarioMartedi
          : getTodayDay().contains("Mercoledì")
              ? storeDataModel.orarioMercoledi
              : getTodayDay().contains("Giovedì")
                  ? storeDataModel.orarioGiovedi
                  : getTodayDay().contains("Venerdì")
                      ? storeDataModel.orarioVenerdi
                      : getTodayDay().contains("Sabato")
                          ? storeDataModel.orarioSabato
                          : storeDataModel.orarioDomenica;

  return openingHours;
}
