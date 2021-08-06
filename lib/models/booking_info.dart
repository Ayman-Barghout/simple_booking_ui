import 'package:json_annotation/json_annotation.dart';
import 'package:simple_booking_ui/models/budget.dart';

part 'booking_info.g.dart';

@JsonSerializable()
class BookingInfo {
  final String? fullName;
  final Budget budget;

  BookingInfo({
    this.fullName,
    required this.budget,
  });

  BookingInfo.empty({this.fullName, this.budget = Budget.lowest});

  factory BookingInfo.fromJson(Map<String, dynamic> json) =>
      _$BookingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingInfoToJson(this);

  bool validate() {
    return fullName != null && fullName!.length > 3;
  }

  BookingInfo copyWith({
    String? fullName,
    Budget? budget,
  }) {
    return BookingInfo(
      fullName: fullName ?? this.fullName,
      budget: budget ?? this.budget,
    );
  }

  @override
  String toString() => 'BookingInfo(fullName: $fullName, budget: $budget)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingInfo &&
        other.fullName == fullName &&
        other.budget == budget;
  }

  @override
  int get hashCode => fullName.hashCode ^ budget.hashCode;
}
