import 'package:flutter/material.dart';
import 'package:ticketubersicht_task/helper/gather_data.dart';
import 'package:ticketubersicht_task/helper/screen_type_detector.dart';
import 'package:ticketubersicht_task/list_data_model.dart';
import 'package:ticketubersicht_task/style/style.dart';
import 'package:ticketubersicht_task/style/theme.dart';
import 'package:ticketubersicht_task/widgets/add_ticket_widget.dart';
import 'package:ticketubersicht_task/widgets/dismiss_background_widget.dart';
import 'package:ticketubersicht_task/widgets/main_list_single_item.dart';

class MainFragment extends StatefulWidget {
  const MainFragment({Key? key}) : super(key: key);

  @override
  State<MainFragment> createState() => _MainFragmentState();
}

class _MainFragmentState extends State<MainFragment> {
  List<ListDataModel> dataList = [];

  @override
  void initState() {
    super.initState();

    // Gather JSON data from "assets/json" and convert to Model class
    gatherJsonData().then((value) {
      setState(() {
        dataList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    var maxHeight = MediaQuery.of(context).size.height;

    return Container(
      width: maxWidth,
      height: maxHeight,
      color: AppTheme.primarySwatch(
        AppStyle.primaryBackground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AddTicketWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, position) {
                final key = dataList[position];

                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(key.artikelnummer),
                  onDismissed: (direction) {
                    setState(() {
                      dataList.removeAt(position);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          '1 item removed',
                        ),
                      ),
                    );
                  },
                  child: ListSingleItem(dataList[position]),
                  background: const DismissableBackgroundWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
