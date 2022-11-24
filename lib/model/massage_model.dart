
import 'package:freezed_annotation/freezed_annotation.dart';
part 'massage_model.freezed.dart';
part 'massage_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    String? id,
    String? userId,
    DateTime? publishedDate,
    String? text,
    String? username,
    @Default(<String?>[]) List<String?> readers,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}