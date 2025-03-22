import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
	final bool? isAvailable;
	final String? acsTokenLink;
	final String? downloadLink;

	const Pdf({this.isAvailable, this.acsTokenLink, this.downloadLink});

	factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
				isAvailable: json['isAvailable'] as bool?,
				acsTokenLink: json['acsTokenLink'] as String?,
		downloadLink: json['downloadLink'] as String?
			);

	Map<String, dynamic> toJson() => {
				'isAvailable': isAvailable,
				'acsTokenLink': acsTokenLink,
				'downloadLink': downloadLink
			};

	@override
	List<Object?> get props => [isAvailable, acsTokenLink, downloadLink];
}
