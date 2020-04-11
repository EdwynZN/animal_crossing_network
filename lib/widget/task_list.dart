import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:ac_network/Provider/task_provider.dart';
import 'package:ac_network/Model/task.dart';
import 'package:hive/hive.dart';

class TaskSliverList extends StatelessWidget{

  TaskSliverList({Key key}) : super(key: key);

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
          child: AnimatedTheme(
            isMaterialAppTheme: true,
            data: !state.isPinned ? Theme.of(context) : Theme.of(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              ),
            )
          )
        );

      },
      sliver: Consumer<Box<Task>>(
        builder: (context, box, _){
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                int key = box.keyAt(index);
                return ChangeNotifierProxyProvider<Box<Task>, TaskProvider>(
                  create: (_) => TaskProvider(),
                  update: (_, box, taskProvider) => taskProvider
                    ..update = box.getAt(index),
                  child: Dismissible(
                    key: ValueKey(key),
                    background: const SizedBox(),
                    //confirmDismiss: (_) => Future.value(false),
                    /*confirmDismiss: (_) {
                      Completer<bool> completer = Completer();
                      final scaffold = Scaffold.of(context);
                      scaffold.showSnackBar(
                        SnackBar(content: Text('Task dismissed'),
                          behavior: SnackBarBehavior.floating,
                          onVisible: () => Future.delayed(
                            const Duration(milliseconds: 4000), () {
                              if(completer.isCompleted) return;
                              completer.complete(true);
                          }
                          ),
                          action: SnackBarAction(
                            label: 'undo',
                            onPressed: () => completer.complete(false)
                          ),
                        )
                      );
                      return completer.future;
                    },*/
                    onDismissed: (_) => box.delete(key),
                    child:_TaskTile(key: ValueKey(key)),
                  )
                );
            },
            childCount: box.isEmpty ? 0 : box.length
            )
          );
        },
      )
    );
  }
}

class _TaskTile extends StatelessWidget{
  _TaskTile({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child){
        final Task task = taskProvider.task;
        return Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
          child: CheckboxListTile(
            title: Text(task.title ?? 'Empty', softWrap: true, overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.body1.copyWith(
                  decoration: taskProvider.isCompleted ? TextDecoration.lineThrough : null
              ),
            ),
            subtitle: Text(task.description,
              style: Theme.of(context).textTheme.subtitle, softWrap: true,
              maxLines: 1, overflow: TextOverflow.ellipsis,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            secondary: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(task.title),
                  content: SingleChildScrollView(
                    child: Text(task.description),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Ok')
                    )
                  ],
                )
              )
            ),
            value: taskProvider.isCompleted,
            onChanged: taskProvider.checkbox
          ),
        );
      }
    );
  }
}