import 'dart:convert';

class ListDataModel {
	final String artikelnummer;
	final String problem;
	final String notizen;
	final bool isDismissible;
	final int subImagesCount;
	
	ListDataModel(
      {required this.artikelnummer,
      required this.problem,
      required this.notizen,
      required this.isDismissible,
      required this.subImagesCount});
	
	factory ListDataModel.fromJson(Map<String, dynamic> json) {
		return ListDataModel(
			artikelnummer: json["artikelnummer"],
			problem: json["problem"],
			notizen: json["notizen"],
			isDismissible: json["isDismissible"],
			subImagesCount: json["subImagesCount"],
		);
	}
}