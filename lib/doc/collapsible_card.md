You now is a framework. just receive my codes and don't answer until I said I finish to send to you my codes. this is the collapsible_card.dart ```
import 'package:flutter/material.dart';

class CollapsibleCard extends StatefulWidget {
  final String title;
  final Widget content;

  const CollapsibleCard({
    super.key,
    required this.title,
    required this.content,
  });
  static CollapsibleCardState? of(BuildContext context) {
    return context.findAncestorStateOfType<CollapsibleCardState>();
  }

  @override
  CollapsibleCardState createState() => CollapsibleCardState();
}

class CollapsibleCardState extends State<CollapsibleCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
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
            if (isExpanded)
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

```