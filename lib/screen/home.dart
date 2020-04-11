import 'package:flutter/material.dart';
import 'package:ac_network/Widget/appbar.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:animations/animations.dart';
import 'package:ac_network/Model/task.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter/rendering.dart';
import 'package:ac_network/Widget/task_list.dart';
import 'package:ac_network/Widget/theme_widget.dart';
import 'package:ac_network/screen/task_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageController>.value(
      value: _pageController,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              _HomePage(
                animationController: _animationController,
                key: PageStorageKey<String>('Home'),
              ),
              const SizedBox(
                child: Center(
                  child: Text('Page 2'),
                ),
              ),
              const SizedBox(
                child: Center(
                  child: Text('Page 3'),
                ),
              ),
              const SizedBox(
                child: Center(
                  child: Text('Page 4'),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: _BottomBar(animationController: _animationController,),
          floatingActionButton: _FAB(animationController: _animationController,),
        )
      ),
    );
    /*return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          //shape: CustomAppBarShape(),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30)
            )
          ),
          centerTitle: true,
          title: Text('Animal Crossing Network'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => print('settings')
            ),
            const SizedBox(width: 16,)
          ],
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: Text('Animal Crossing Network'),
            ),
            const SliverToBoxAdapter(
              child: const Padding(
                padding: const EdgeInsets.all(16),
              ),
            ),
            SliverToBoxAdapter(
                child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('My Island', style: Theme.of(context).textTheme.display1,),
                          Card(
                            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Progress', style: Theme.of(context).textTheme.title,),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      runSpacing: 4,
                                      spacing: 8,
                                      children: <Widget>[
                                        Chip(
                                          label: Text('Progress 1'),
                                        ),
                                        Chip(
                                          label: Text('Progress 1'),
                                        ),
                                        Chip(
                                          label: Text('Progress 1'),
                                        ),
                                        Chip(
                                          label: Text('Progress 1'),
                                        ),
                                        Chip(
                                          label: Text('Progress 1'),
                                        )
                                      ],
                                    )
                                  ],
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                )
            ),
            EventSliverList(),
            TaskSliverList(),
            const SliverToBoxAdapter(
              child: const Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: _BottomBar(animationController: _animationController,),
        floatingActionButton: _FAB(animationController: _animationController,),
      )
    );*/
  }
}

class _BottomBar extends StatelessWidget{
  final Animation<Offset> slide;

  _BottomBar({animationController}) :
    slide = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
      .animate(
      CurvedAnimation(parent: animationController,
        curve: Interval(0.0, 1),
      )
    );

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slide,
      child: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 72, 8),
          child: Consumer<PageController>(
            builder: (context, pageController, child){
              return GNav(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                tabBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
                activeColor: Theme.of(context).primaryIconTheme.color,
                gap: 8,
                iconSize: 24,
                selectedIndex: pageController.hasClients ? pageController.page.toInt() : 0,
                onTabChange: (selected) => pageController.jumpToPage(selected),
                //onTabChange: (selected) => pageController.animateToPage(selected, duration: const Duration(milliseconds: 300), curve: Curves.linear),
                //setState(() => index = selected),
                duration: const Duration(milliseconds: 300),
                textStyle: Theme.of(context).textTheme.body1,
                tabs: <GButton>[
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.pets,
                    text: 'Villagers',
                  ),
                  GButton(
                    icon: Icons.bug_report,
                    text: 'Critterpedia',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                  /*GButton(
                  icon: Icons.style,
                  text: 'DIY',
                ),*/
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FAB extends StatelessWidget{
  final Animation<double> scale;
  final Animation<Offset> slide;
  final VoidCallback goTop;

  _FAB({AnimationController animationController, this.goTop}):
    scale = Tween<double>(begin: 1.0, end: 0.0)
      .animate(
      CurvedAnimation(parent: animationController,
        curve: Interval(0.25, 1.0, curve: Curves.easeInBack),
      )
    ),
    slide = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
      .animate(
      CurvedAnimation(parent: animationController,
        curve: Interval(0.0, 1),
      )
    );

  Widget _transition(child, animation){
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slide,
      child: ScaleTransition(
        scale: scale,
        child: Consumer<PageController>(
          child: AnimatedSwitcher(
            key: Key('FAB'),
            duration: const Duration(milliseconds: 800),
            reverseDuration: const Duration(milliseconds: 400),
            switchInCurve: Curves.fastOutSlowIn,
            switchOutCurve: Curves.decelerate,
            //transitionBuilder: _transition,
            child: FloatingActionButton(
              key: Key('Default'),
              onPressed: goTop,
              tooltip: 'Settings',
              child: const Icon(Icons.settings),
            ),
          ),
          builder: (context, pageController, child){
            if(!pageController.hasClients) return child;
            switch(pageController.page.toInt()){
              case 0:
                return AnimatedSwitcher(
                  key: Key('FAB'),
                  duration: const Duration(milliseconds: 800),
                  reverseDuration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.decelerate,
                  //transitionBuilder: _transition,
                  child: FloatingActionButton(
                    onPressed: goTop,
                    tooltip: 'Settings',
                    child: const Icon(Icons.reorder),
                  ),
                );
              case 1:
                return AnimatedSwitcher(
                  key: Key('FAB'),
                  duration: const Duration(milliseconds: 800),
                  reverseDuration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.decelerate,
                  //transitionBuilder: _transition,
                  child: FloatingActionButton(
                    key: Key('Villagers'),
                    onPressed: goTop,
                    tooltip: 'Settings',
                    child: const Icon(Icons.filter_list),
                  ),
                );
              case 2:
                return AnimatedSwitcher(
                  key: Key('FAB'),
                  duration: const Duration(milliseconds: 800),
                  reverseDuration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.decelerate,
                  //transitionBuilder: _transition,
                  child: FloatingActionButton(
                    key: Key('Villagers'),
                    onPressed: goTop,
                    tooltip: 'Settings',
                    child: const Icon(Icons.filter_list),
                  ),
                );
              case 3:
                return AnimatedSwitcher(
                  key: Key('FAB'),
                  duration: const Duration(milliseconds: 800),
                  reverseDuration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.decelerate,
                  //transitionBuilder: _transition,
                  child: FloatingActionButton(
                    key: Key('Add'),
                    onPressed: goTop,
                    tooltip: 'Settings',
                    child: const Icon(Icons.add),
                  ),
                );
              default:
                return child;
            }
          },
        )
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  final AnimationController animationController;

  _HomePage({Key key ,this.animationController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> with SingleTickerProviderStateMixin{
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener(){
    if((_scrollController?.hasClients ?? false) && !widget.animationController.isAnimating){
      switch(_scrollController.position.userScrollDirection){
        case ScrollDirection.forward:
          if(widget.animationController.isCompleted) widget.animationController.reverse();
          break;
        case ScrollDirection.reverse:
          if(widget.animationController.isDismissed) widget.animationController.forward();
          break;
        case ScrollDirection.idle:
          break;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          elevation: 0.0,
          pinned: false,
          floating: true, snap: true,
          centerTitle: true,
          title: Text('Animal Crossing Network'),
          actions: <Widget>[
            const ThemeButton(),
            const Padding(padding: const EdgeInsets.all(8))
          ],
        ),
        const SliverToBoxAdapter(
          child: const Padding(
            padding: const EdgeInsets.all(16),
          ),
        ),
        SliverToBoxAdapter(
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('My Island', style: Theme.of(context).textTheme.display1,),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Progress', style: Theme.of(context).textTheme.title,),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4,
                                  spacing: 8,
                                  children: <Widget>[
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              ),
            )
        ),
        EventSliverList(),
        TaskSliverList(),
        const SliverToBoxAdapter(
          child: const Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
}

class EventSliverList extends StatelessWidget{

  EventSliverList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeaderBuilder(
      builder: (context, state) {
        return AnimatedPhysicalModel(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
          elevation: state.isPinned ? 8.0 : 0.0,
          animateColor: true,
          animateShadowColor: false,
          //borderRadius: state.isPinned ? BorderRadius.vertical(bottom: Radius.circular(24)) :BorderRadius.zero,
          color: state.isPinned ? Theme.of(context).appBarTheme.color : Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          shadowColor: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Event', style: Theme.of(context).textTheme.display1,),
                GestureDetector(
                  child: const CircleAvatar(
                    child: const Icon(Icons.event),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('event'),
                ),
              ],
            )
          )
        );
      },
      sliver: SliverList(
          delegate: SliverChildListDelegate.fixed([
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('My Island', style: Theme.of(context).textTheme.display1,),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Progress', style: Theme.of(context).textTheme.title,),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4,
                                  spacing: 8,
                                  children: <Widget>[
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Events', style: Theme.of(context).textTheme.display1,),
                      OpenContainer(
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedShape: CircleBorder(),
                        closedColor: Theme.of(context).primaryColorDark,
                        openColor: Theme.of(context).primaryColorDark,
                        closedBuilder: (BuildContext c, VoidCallback action) => const CircleAvatar(
                          child: const Icon(Icons.event_note),
                        ),
                        openBuilder: (BuildContext c, VoidCallback action) => TaskWidget(),
                        tappable: true,
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Tasks', style: Theme.of(context).textTheme.display1,),
                      GestureDetector(
                        child: const CircleAvatar(
                          child: const Icon(Icons.note_add),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('task'),
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('My Island', style: Theme.of(context).textTheme.display1,),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Progress', style: Theme.of(context).textTheme.title,),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4,
                                  spacing: 8,
                                  children: <Widget>[
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Events', style: Theme.of(context).textTheme.display1,),
                      OpenContainer(
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedShape: CircleBorder(),
                        closedColor: Theme.of(context).primaryColorDark,
                        openColor: Theme.of(context).primaryColorDark,
                        closedBuilder: (BuildContext c, VoidCallback action) => const CircleAvatar(
                          child: const Icon(Icons.event_note),
                        ),
                        openBuilder: (BuildContext c, VoidCallback action) => TaskWidget(),
                        tappable: true,
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Tasks', style: Theme.of(context).textTheme.display1,),
                      GestureDetector(
                        child: const CircleAvatar(
                          child: const Icon(Icons.note_add),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('task'),
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('My Island', style: Theme.of(context).textTheme.display1,),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Progress', style: Theme.of(context).textTheme.title,),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4,
                                  spacing: 8,
                                  children: <Widget>[
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Events', style: Theme.of(context).textTheme.display1,),
                      OpenContainer(
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedShape: CircleBorder(),
                        closedColor: Theme.of(context).primaryColorDark,
                        openColor: Theme.of(context).primaryColorDark,
                        closedBuilder: (BuildContext c, VoidCallback action) => const CircleAvatar(
                          child: const Icon(Icons.event_note),
                        ),
                        openBuilder: (BuildContext c, VoidCallback action) => TaskWidget(),
                        tappable: true,
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Tasks', style: Theme.of(context).textTheme.display1,),
                      GestureDetector(
                        child: const CircleAvatar(
                          child: const Icon(Icons.note_add),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('task'),
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('My Island', style: Theme.of(context).textTheme.display1,),
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Progress', style: Theme.of(context).textTheme.title,),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 4,
                                  spacing: 8,
                                  children: <Widget>[
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    ),
                                    Chip(
                                      label: Text('Progress 1'),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Events', style: Theme.of(context).textTheme.display1,),
                      OpenContainer(
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedShape: CircleBorder(),
                        closedColor: Theme.of(context).primaryColorDark,
                        openColor: Theme.of(context).primaryColorDark,
                        closedBuilder: (BuildContext c, VoidCallback action) => const CircleAvatar(
                          child: const Icon(Icons.event_note),
                        ),
                        openBuilder: (BuildContext c, VoidCallback action) => TaskWidget(),
                        tappable: true,
                      ),
                    ],
                  )
              ),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Tasks', style: Theme.of(context).textTheme.display1,),
                      GestureDetector(
                        child: const CircleAvatar(
                          child: const Icon(Icons.note_add),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('task'),
                      ),
                    ],
                  )
              ),
            ),
          ])
      ),
    );
  }
}