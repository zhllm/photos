import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:photo/bean/workout_bean.dart';
import 'package:photo/bloc/workout_cubit.dart';
import 'package:photo/utils/time_helper.dart';

import '../bloc/workouts_cabit.dart';

class EditExerciseScreen extends StatefulWidget {
  final WorkoutBean? workout;
  final int? index;
  final int? exIndex;

  const EditExerciseScreen({Key? key, this.exIndex, this.index, this.workout})
      : super(key: key);

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  TextEditingController? _title;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(
        text: widget.workout!.exercises![widget.exIndex!].title);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                child: NumberPicker(
                  itemHeight: 30.h,
                  value: widget.workout!.exercises![widget.exIndex!].prelude!,
                  onChanged: (int value) {
                    setState(() {
                      widget.workout!.exercises![widget.exIndex!] = widget
                          .workout!.exercises![widget.exIndex!]
                          .copyWith(prelude: value);
                    });
                    BlocProvider.of<WorkoutsCubit>(context)
                        .saveWorkout(widget.workout!, widget.index!);
                  },
                  minValue: 0,
                  maxValue: 3599,
                  textMapper: (strVal) => formatTime(int.parse(strVal), true),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                textAlign: TextAlign.center,
                controller: _title,
                onChanged: (value) {
                  setState(() {
                    widget.workout!.exercises![widget.exIndex!] = widget
                        .workout!.exercises![widget.exIndex!]
                        .copyWith(title: value);
                  });
                  BlocProvider.of<WorkoutsCubit>(context)
                      .saveWorkout(widget.workout!, widget.index!);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
