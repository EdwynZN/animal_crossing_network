import 'package:flutter/material.dart';
import 'package:ac_network/Widget/appbar.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:ac_network/Model/task.dart';

class TaskWidget extends StatefulWidget {
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> with SingleTickerProviderStateMixin{
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  FocusNode _focusNode;
  final Box<Task> box = Hive.box<Task>('Task');

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _descriptionController?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: CustomAppBarShape(),
          centerTitle: true,
          title: Text('Task'),
          actions: <Widget>[
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _titleController,
              child: const SizedBox(),
              builder: (context, text, child){
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: text.text.isEmpty ? child :
                    FlatButton(
                    textColor: Theme.of(context).appBarTheme.textTheme.title.color,
                    child: Text('Clear'),
                    highlightColor: Colors.transparent,
                    onPressed: () => _titleController?.clear(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Scrollbar(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                sliver: SliverToBoxAdapter(
                  child: TextField(
                    autofocus: true,
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.display1,
                    onSubmitted: (title) => _focusNode.requestFocus(),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Title',
                    )
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SizedBox(
                  height: 0,
                  child: Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _descriptionController,
                        style: Theme.of(context).textTheme.title,
                        minLines: null, maxLines: null,
                        expands: true,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Description'
                        ),
                      ),
                    ),
                  )
                )
              ),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          //mini: true,
          //heroTag: 'add_event',
          onPressed: () {
            final task = Task(
              description: _descriptionController.text,
              title: _titleController.text,
            );
            box.add(task);
            Navigator.pop(context);
          },
          tooltip: 'Done',
          child: const Icon(Icons.check),
        ),
      )
    );
  }
}