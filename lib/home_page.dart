import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.repeat();
    super.initState();
  }

  late AnimationController _animationController;
  bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        shadowColor: Colors.transparent,
        leading: Neumorphic(
          margin: const EdgeInsets.all(5),
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(20),
              ),
              depth: 2,
              lightSource: LightSource.topRight,
              color: Colors.grey.shade200),
          child: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: ((context, _) {
                    return GestureDetector(
                      child: Transform.rotate(
                        angle: math.pi * 2 * _animationController.value,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1520354127549-fcecfe79d058?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGRpc2N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Boom Shaka Laka",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Jake",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: NeumorphicProgress(
              duration: Duration(milliseconds: 500),
              height: 20,
              percent: 0.5,
              style: ProgressStyle(accent: Colors.green, depth: 2),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicIcon(
                Icons.fast_rewind,
                size: 60,
                style: NeumorphicStyle(
                    intensity: 15, color: Colors.grey.shade200, depth: 2),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isPlaying = !_isPlaying;
                    _isPlaying
                        ? _animationController.repeat()
                        : _animationController.stop();
                  })
                },
                child: NeumorphicIcon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 85,
                  style: NeumorphicStyle(
                      intensity: 20, color: Colors.grey.shade200, depth: 2),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              NeumorphicIcon(
                Icons.fast_forward,
                size: 60,
                style: NeumorphicStyle(
                    intensity: 20, color: Colors.grey.shade200, depth: 2),
              )
            ],
          )
        ],
      ),
    );
  }
}
