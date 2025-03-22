import 'package:equatable/equatable.dart';

class Epub extends Equatable {
	final bool? isAvailable;
	final String? acsTokenLink;
	final String? downloadLink;


	const Epub({this.isAvailable, this.acsTokenLink, this.downloadLink});

	factory Epub.fromJson(Map<String, dynamic> json) => Epub(
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
