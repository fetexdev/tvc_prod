import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_vaping_app/model/store_model.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/view/store/store_card.dart';

class SlideUpPanel extends StatefulWidget {
  final List<StoreModel> storeModel;
  final List<GlobalKey> globalKeys;
  final int index;
  const SlideUpPanel({
    Key? key,
    required this.storeModel,
    required this.globalKeys,
    required this.index,
  }) : super(key: key);

  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Scrollable.ensureVisible(widget.globalKeys[widget.index].currentContext!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 1.w),
              Container(
                width: 5.w,
                height: 3,
                color: Colors.grey,
              ),
              SizedBox(height: 1.w),
              Container(
                width: 5.w,
                height: 3,
                color: Colors.grey,
              ),
              SizedBox(height: 1.w),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: List.generate(
                      widget.storeModel.length,
                      (index) {
                        List<String> _storeImages;
                        if (widget.storeModel[index].images == "null") {
                          _storeImages = [""];
                        } else {
                          List decodedObj =
                              jsonDecode(widget.storeModel[index].images);

                          List _images = decodedObj.map((element) {
                            return element["image"] ?? "";
                          }).toList();

                          _storeImages = List<String>.from(_images);
                        }

                        return StoreCard(
                          data: widget.storeModel[index],
                          globalKey: widget.globalKeys[index],
                          images: _storeImages,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
