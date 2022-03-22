import 'package:flutter/material.dart';
import 'package:ticketubersicht_task/helper/screen_type_detector.dart';

class DismissableBackgroundWidget extends StatelessWidget {
  const DismissableBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var definedHeight = 145.0;

    var screenType = getDeviceScreenType(MediaQuery.of(context));

    return Container(
      height: definedHeight,
      width: width,
      margin: EdgeInsets.only(
        bottom: 20.0,
        right: screenType == ScreenType.mobile ? 16.0 : 35.0,
        left: screenType == ScreenType.mobile ? 16.0 : 35.0,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.deepOrange,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: buildDismissWidget(screenType),
      ),
    );
  }
}

Widget buildDismissWidget(ScreenType screenType) {
  if (screenType == ScreenType.mobile) {
    return Container(
      margin: const EdgeInsets.only(
        right: 16.0,
      ),
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: 30.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            'Loschen',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8.0,
        ),
        const Text(
          'Loschen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 14.0,
            top: 14.0,
            bottom: 12.0,
          ),
        ),
      ],
    );
  }
}
