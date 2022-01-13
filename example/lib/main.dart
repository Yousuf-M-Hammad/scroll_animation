import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scroll_animation/scroll_animation.dart';
// import 'live.dart' as live;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // title: const Text('Scroll Animation Example'),
            title: TabBar(
                tabs: ['Jelly', 'Padded', 'Compined']
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList()),
          ),
          body: const TabBarView(
            children: [
              JellyScrollExample(),
              PaddedScrollExample(),
              CompinedExample()
            ],
          ),
        ),
      ),
    );
  }
}

class JellyScrollExample extends StatefulWidget {
  const JellyScrollExample({Key? key}) : super(key: key);

  @override
  State<JellyScrollExample> createState() => _JellyScrollExampleState();
}

class _JellyScrollExampleState extends State<JellyScrollExample> {
  final ScrollController _verticalScontroller = ScrollController();
  final ScrollController _horizontallScontroller = ScrollController();

  @override
  void dispose() {
    _verticalScontroller.dispose();
    _horizontallScontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Jelly Scroll Horizontal',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
          height: 200,
          // width: MediaQuery.of(context).size.width,
          child: ScrollAnimationNotifier(
            dispatchBubble: false,
            scrollController: _horizontallScontroller,
            child: ListView.builder(
              controller: _horizontallScontroller,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                height: 190,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: JellyScrollContainer(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Colors.red,
                      child: Image.asset(
                        'assets/${(index % 3) + 1}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Jelly Scroll Vertical',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ScrollAnimationNotifier(
                dispatchBubble: false,
                scrollController: _verticalScontroller,
                child: ListView.builder(
                  controller: _verticalScontroller,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  itemBuilder: (BuildContext context, int index) => SizedBox(
                    height: 190,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: JellyScrollContainer(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: Colors.red,
                          child: Image.asset(
                            'assets/${(index % 3) + 1}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PaddedScrollExample extends StatefulWidget {
  const PaddedScrollExample({Key? key}) : super(key: key);

  @override
  State<PaddedScrollExample> createState() => _PaddedScrollExampleState();
}

class _PaddedScrollExampleState extends State<PaddedScrollExample> {
  final ScrollController _verticalScontroller = ScrollController();
  final ScrollController _horizontallScontroller = ScrollController();

  @override
  void dispose() {
    _verticalScontroller.dispose();
    _horizontallScontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Padded Scroll Horizontal',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
          height: 200,
          // width: MediaQuery.of(context).size.width,
          child: ScrollAnimationNotifier(
            dispatchBubble: false,
            scrollController: _horizontallScontroller,
            child: ListView.builder(
              controller: _horizontallScontroller,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                height: 190,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PaddedScrollContainer(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Colors.red,
                      child: Image.asset(
                        'assets/${(index % 3) + 1}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Padded Scroll Vertical',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ScrollAnimationNotifier(
              dispatchBubble: false,
              minVelocityToNotify: 20,
              scrollController: _verticalScontroller,
              child: ListView.builder(
                controller: _verticalScontroller,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                    PaddedScrollContainer(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.red,
                    child: Image.asset(
                      'assets/${(index % 3) + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                itemCount: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CompinedExample extends StatefulWidget {
  const CompinedExample({Key? key}) : super(key: key);

  @override
  State<CompinedExample> createState() => _CompinedExampleState();
}

class _CompinedExampleState extends State<CompinedExample> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollAnimationNotifier(
      scrollController: _scrollController,
      dispatchBubble: false,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          Widget child = Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Colors.red,
            child: Image.asset(
              'assets/${(index % 3) + 1}.png',
              fit: BoxFit.cover,
            ),
          );
          if (index.isEven) {
            return JellyScrollContainer(
              maxJellySkewAlpha: pi / 24,
              maxJellySkewBeta: pi / 24,
              child: child,
            );
          } else {
            return PaddedScrollContainer(
              usePadding: true,
              child: JellyScrollContainer(
                maxJellySkewBeta: pi / 24,
                child: child,
              ),
            );
          }
        },
      ),
    );
  }
}
