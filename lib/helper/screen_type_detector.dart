import 'package:flutter/cupertino.dart';

enum ScreenType {
	mobile,
	tablet,
	desktop
}

/*
* Helper method to Classify the running device is Mobile, Tablet or Desktop
* */
ScreenType getDeviceScreenType(MediaQueryData mediaQueryData) {
	var orientation = mediaQueryData.orientation;
	double deviceWidth = 0;
	
	if (orientation == Orientation.landscape) {
		deviceWidth = mediaQueryData.size.height;
	} else {
		deviceWidth = mediaQueryData.size.width;
	}
	
	if (deviceWidth > 950.0) {
		return ScreenType.desktop;
	}
	
	if (deviceWidth > 600.0) {
		return ScreenType.tablet;
	}
	
	return ScreenType.mobile;
}