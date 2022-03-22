import 'package:flutter/material.dart';
import 'package:ticketubersicht_task/helper/screen_type_detector.dart';
import 'package:ticketubersicht_task/style/style.dart';
import 'package:ticketubersicht_task/style/theme.dart';

class AddTicketWidget extends StatelessWidget {
  const AddTicketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Taking width as 100% of the Screen Width
    var width = MediaQuery.of(context).size.width;
    var screenType = getDeviceScreenType(MediaQuery.of(context));

    return InkWell(
      splashColor: Colors.grey,
      enableFeedback: true,
      onTap: () {
        // Undefined
      },
      child: Container(
        width: width,
        height: (screenType == ScreenType.mobile) ? 44.0 : 56.0,
        margin: EdgeInsets.only(
          top: (screenType == ScreenType.mobile) ? 24.0 : 20.0,
          bottom: 20.0,
          right: 35.0,
          left: 35.0,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: AppTheme.primarySwatch(0xFFEAEFF4),
        ),
        child: const AddTicketActionWidget(),
      ),
    );
  }
}

class AddTicketActionWidget extends StatelessWidget {
  const AddTicketActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenType = getDeviceScreenType(MediaQuery.of(context));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Container(
            height: 40.0,
            width: 40.0,
            color: Colors.green,
            child: const Icon(
              Icons.add,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          'Ticket hinzufugen',
          style: TextStyle(
            color: AppTheme.primarySwatch(AppStyle.primaryColor),
          ),
        ),
      ],
    );
  }
}
