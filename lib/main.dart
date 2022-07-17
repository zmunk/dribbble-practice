import 'package:dribbble/extra_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresso/progresso.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gametopia',
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark()
            .textTheme
            .apply(
              fontFamily: 'OnePlus Sans',
            )
            .copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'OnePlus Sans',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
              bodyMedium: const TextStyle(
                fontFamily: 'OnePlus Sans',
                fontSize: 12,
                color: Color(0x99ffffff),
                letterSpacing: 0.5,
              ),
            ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
        hintColor: const Color(0x99ffffff),
        appBarTheme: AppBarTheme.of(context).copyWith(
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white)
              .headline6,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            'Gametopia',
            style: TextStyle(
              fontFamily: 'Tanker',
              letterSpacing: 0.5,
              fontSize: 25,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.75,
                  child: SvgPicture.asset(
                    'assets/fries_list_menu.svg',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const Banner(imageHeight: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 175),
                Text(
                  'Senua\'s Saga: Hellblade II',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Played 21 hr',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Section(
                  'Unlocked Achievements',
                  child: const Padding(
                    padding: EdgeInsets.only(left: 4, top: 4),
                    child: AchievementProgress(completed: 14, total: 20),
                  ),
                ),
                Section(
                  'Friends who have this item',
                  child: Row(children: const [
                    Avatar(
                      'assets/pfp1.png',
                      username: 'Light',
                      isOnline: false,
                    ),
                    Avatar(
                      'assets/pfp2.png',
                      username: 'Ancient',
                      isOnline: false,
                    ),
                  ]),
                ),
                Section(
                  'Recent activities',
                  child: SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        AchievementCard(
                          icon: ExtraIcons.diamond,
                          iconColor: Color(0xffE42C2D),
                          title: 'New Achievement Unlocked',
                          achievementName: 'Immortal Fighter',
                          timeString: '15 hours ago',
                        ),
                        AchievementCard(
                          icon: ExtraIcons.knife,
                          iconColor: Color(0xffFF7A01),
                          title: 'New Achievement Unlocked',
                          achievementName: 'Richman',
                          timeString: '23 hours ago',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String achievementName;
  final String timeString;

  const AchievementCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.achievementName,
    required this.timeString,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: const Color(0xff0B0D1A),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Theme.of(context).hintColor.withAlpha(100),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  timeString,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 9,
                    color: Theme.of(context).hintColor.withAlpha(100),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SizedBox(
                  width: 32,
                  child: CircleAvatar(
                    backgroundColor: iconColor,
                    child: Icon(
                      icon,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  achievementName,
                  style: const TextStyle(
                    // fontSize: 9,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String image;
  final String username;
  final bool isOnline;
  static Color onlineIndicatorColor = const Color(0xff59EF12);

  const Avatar(
    this.image, {
    super.key,
    required this.username,
    this.isOnline = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget avatarImage = Image.asset(image, fit: BoxFit.fitWidth);
    if (!isOnline) {
      avatarImage = ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
        child: avatarImage,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  child: avatarImage,
                ),
              ),
              if (isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              if (isOnline)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: onlineIndicatorColor,
                    ),
                  ),
                ),
            ],
          ),
          Text(
            username,
            style: TextStyle(
                color: isOnline ? Colors.white : Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}

class AchievementProgress extends StatelessWidget {
  final int completed;
  final int total;
  const AchievementProgress({
    super.key,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Transform.translate(
            offset: const Offset(0, 2),
            child: Progresso(
                backgroundStrokeWidth: 6,
                progressStrokeWidth: 6,
                progress: completed / total,
                progressColor: const Color(0xff0946BC),
                backgroundColor: const Color(0xff1E2338),
                progressStrokeCap: StrokeCap.round,
                backgroundStrokeCap: StrokeCap.round),
          ),
        ),
        const SizedBox(width: 16),
        Text('$completed / $total'),
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String text;
  final Widget child;
  Section(this.text, {required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          child,
        ],
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({super.key, required this.imageHeight});

  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/senua1.jpg'),
            ),
          ),
          height: imageHeight,
        ),
        Container(
          height: imageHeight,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.blue.shade700.withOpacity(0.2),
                  Colors.black,
                ],
              )),
        )
      ],
    );
  }
}
