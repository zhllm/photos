import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo/bloc/workout_cubit.dart';
import 'package:photo/pages/edit_workout.dart';
import 'package:photo/pages/home_page.dart';
import 'package:photo/states/workout_states.dart';

import 'bean/workout_bean.dart';
import 'bloc/workouts_cabit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Workout Time',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color.fromARGB(255, 66, 74, 95)),
            ),
          ),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<WorkoutsCubit>(
                create: (BuildContext context) {
                  WorkoutsCubit workoutCubit = WorkoutsCubit();
                  if (workoutCubit.state.isEmpty) {
                    print("initial");
                    workoutCubit.getWorkouts();
                  } else {
                    print("content is already");
                  }
                  return workoutCubit;
                },
              ),
              BlocProvider<WorkoutCubit>(
                  create: (BuildContext context) => WorkoutCubit()),
            ],
            child: BlocBuilder<WorkoutCubit, WorkoutStates>(
              builder: (context, state) {
                if (state is WorkoutInitial) {
                  return const HomePage();
                } else if (state is WorkoutEditing) {
                  return EditWorkoutScreen();
                }
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
