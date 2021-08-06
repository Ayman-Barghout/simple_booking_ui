import 'package:json_annotation/json_annotation.dart';

enum Budget {
  @JsonValue(0)
  lowest,
  @JsonValue(1)
  low,
  @JsonValue(2)
  average,
  @JsonValue(3)
  high,
  @JsonValue(4)
  highest,
}
