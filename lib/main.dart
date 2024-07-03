import 'package:flutter/material.dart';
import 'package:notifications/services/local_notifications.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationsService.requestPermission();
  await LocalNotificationsService.start();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!LocalNotificationsService.notificationsEnabled)
                const Text(
                  "Siz xabarnomaga ruxsat bermadingiz shu sabab sizga xabarnomalar kelmaydi."
                  "\nBuni to'g'irlash uchun sozlamalarga borib to'girlang",
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        LocalNotificationsService.repetEvery2Hours();
                      },
                      icon: const Icon(Icons.message),
                      label: const Text("Pomodoro")),
                  TextButton.icon(
                      onPressed: () {
                        LocalNotificationsService
                            .cancelevery2HOursNotification();
                      },
                      icon: const Icon(Icons.message),
                      label: const Text("Cancel Pomodoro")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        LocalNotificationsService.everyDayMotivation();
                      },
                      icon: const Icon(Icons.message),
                      label: const Text("Everyday Motivation")),
                  TextButton.icon(
                      onPressed: () {
                        LocalNotificationsService.cancelEverydayNotification();
                      },
                      icon: const Icon(Icons.message),
                      label: const Text("Cancel Everyday Notification")),
                ],
              )
              //   TextButton.icon(
              //       onPressed: () {
              //         LocalNotificationsService.showPeriodicNotification();
              //       },
              //       icon: const Icon(Icons.message),
              //       label: const Text("Davomiy Xabarnoma")),
            ],
          ),
        ),
      ),
    );
  }
}
