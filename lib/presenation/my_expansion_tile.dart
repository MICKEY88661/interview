import 'package:flutter/material.dart';

abstract class ExpansionTileViewModel {
  final Widget title;
  final Widget subtitle;
  final Widget? leading;

  ExpansionTileViewModel({
    required this.title,
    required this.subtitle,
    this.leading,
  });
}

class TeacherViewModel implements ExpansionTileViewModel {
  final String name;
  final String role;
  final ImageProvider? avator;
  const TeacherViewModel({
    required this.name,
    required this.role,
    this.avator,
  });

  @override
  Widget? get leading => CircleAvatar(
        child: avator == null
            ? const Icon(Icons.person)
            : Image(
                image: avator!,
              ),
      );

  @override
  Widget get subtitle => Text(role);

  @override
  Widget get title => Text(name);
}

class MyExpansionTile extends StatefulWidget {
  final ExpansionTileViewModel viewModel;
  final List<Widget> children;
  const MyExpansionTile({
    super.key,
    required this.viewModel,
    this.children = const <Widget>[],
  });

  @override
  State<MyExpansionTile> createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: widget.viewModel.title,
      subtitle: widget.viewModel.subtitle,
      onExpansionChanged: (isExpanded) {
        _isExpanded = isExpanded;
        setState(() {});
      },
      leading: widget.viewModel.leading,
      trailing: _isExpanded ? const Icon(Icons.horizontal_rule) : const Icon(Icons.add),
      children: widget.children,
    );
  }
}
