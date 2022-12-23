import 'package:equatable/equatable.dart';

class ExerciseBean extends Equatable {
  ExerciseBean({
    this.title,
    this.prelude,
    this.duration,
    this.index,
    this.startTime,
  });

  String? title;
  int? prelude;
  int? duration;
  int? index;
  int? startTime;

  factory ExerciseBean.fromJson(
          Map<String, dynamic> json, int index, int startTime) =>
      ExerciseBean(
        title: json["title"],
        prelude: json["prelude"],
        duration: json["duration"],
        index: index,
        startTime: startTime,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "prelude": prelude,
        "duration": duration,
      };

  ExerciseBean copyWith({
    int? prelude,
    String? title,
    int? duration,
    int? index,
    int? startTime,
  }) =>
      ExerciseBean(
        prelude: prelude ?? this.prelude,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        index: index ?? this.index,
        startTime: startTime ?? this.startTime,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [title, prelude, duration, index, startTime];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
