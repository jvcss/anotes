import 'package:flutter/material.dart';

class CollapsibleCard extends StatefulWidget {
  final String title;
  final Widget content;

  const CollapsibleCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  CollapsibleCardState createState() => CollapsibleCardState();
}

class CollapsibleCardState extends State<CollapsibleCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: widget.content,
              ),
          ],
        ),
      ),
    );
  }
}
