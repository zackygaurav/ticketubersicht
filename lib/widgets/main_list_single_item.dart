import 'package:flutter/material.dart';
import 'package:ticketubersicht_task/helper/screen_type_detector.dart';
import 'package:ticketubersicht_task/list_data_model.dart';
import 'package:ticketubersicht_task/style/style.dart';
import 'package:ticketubersicht_task/style/theme.dart';

class ListSingleItem extends StatelessWidget {
  final ListDataModel data;

  const ListSingleItem(this.data);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var screenType = getDeviceScreenType(MediaQuery.of(context));

    var definedHeight = screenType == ScreenType.mobile ? 180.0 : 145.0;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: definedHeight,
          width: width,
          margin: EdgeInsets.only(
            bottom: 20.0,
            right: (screenType == ScreenType.mobile) ? 16.0 : 35.0,
            left: (screenType == ScreenType.mobile) ? 16.0 : 35.0,
          ),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 3.0,
                  height: definedHeight,
                  color:
                      data.isDismissible ? Colors.deepOrange : Colors.black54,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 14.0,
                      top: 14.0,
                      bottom: 12.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (screenType == ScreenType.mobile)
                              ? 'Artikelnummer,-\nbeschreibung'
                              : 'Artikelnummer,-beschreibung',
                          style: TextStyle(
                            color: AppTheme.primarySwatch(
                              AppStyle.primaryColor,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          data.artikelnummer,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          'Problem',
                          style: TextStyle(
                            color: AppTheme.primarySwatch(
                              AppStyle.primaryColor,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          data.problem,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: definedHeight,
                  width: 1.0,
                  color: AppTheme.primarySwatch(AppStyle.primaryColor),
                  margin: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 14.0,
                      left: 20.0,
                      right: 14.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notizen',
                          style: TextStyle(
                            color: AppTheme.primarySwatch(
                              AppStyle.primaryColor,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          data.notizen,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: definedHeight,
                  width: 1.0,
                  color: AppTheme.primarySwatch(AppStyle.primaryColor),
                  margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                ),
                buildGalleryWidget(screenType, data),
                Visibility(
                  visible: screenType == ScreenType.tablet ||
                      screenType == ScreenType.desktop,
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 14.0, left: 10.0),
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildGalleryWidget(ScreenType screenType, ListDataModel data) {
  if (screenType == ScreenType.mobile) {
    return SizedBox(
      width: 64.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.photo_library_outlined,
            size: 30.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Galerie',
            style: TextStyle(
              fontSize: 16.0,
              color: AppTheme.primarySwatch(
                AppStyle.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  } else {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 14.0, top: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Bildergalerie',
              style: TextStyle(
                color: AppTheme.primarySwatch(
                  AppStyle.primaryColor,
                ),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 102.0,
              child: ListView.builder(
                itemCount: data.subImagesCount,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return Row(
                    children: [
                      Container(
                        height: 88.0,
                        width: 117.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Container(
                        height: 102.0,
                        width: 1.0,
                        color: AppTheme.primarySwatch(
                          AppStyle.primaryColor,
                        ),
                        margin: const EdgeInsets.only(
                          left: 14.0,
                          right: 14.0,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
