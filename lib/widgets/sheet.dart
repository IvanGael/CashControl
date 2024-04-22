
import 'package:flutter/material.dart';

class Sheet extends StatelessWidget {
  Sheet({Key? key}) : super(key: key);

  final icons = [
    {
      "i": Icons.bookmark,
      "t": "Orders",
      "s": "5 pending orders",
      "c": Colors.indigo,
    },
    {
      "i": Icons.bookmark,
      "t": "Payments",
      "s": "No pending payments",
      "c": Colors.purple,
    },
    {
      "i": Icons.bookmark,
      "t": "Addresses",
      "s": "No pending payments",
      "c": Colors.green,
    },
    {
      "i": Icons.bookmark,
      "t": "Wishlist",
      "s": "No pending payments",
      "c": Colors.red,
    },
    {
      "i": Icons.bookmark,
      "t": "Buy again",
      "s": "No pending payments",
      "c": Colors.cyan,
    },
  ];

  final icons2 = [
    {
      "i": Icons.bookmark,
      "t": "Settings",
      "s": "Theme, color, etc.",
      "c": Colors.blueGrey,
    },
    {
      "i": Icons.bookmark,
      "t": "Help & Support",
      "s": "Chat with us",
      "c": Colors.deepOrange,
    },
    {
      "i": Icons.bookmark,
      "t": "About",
      "s": "Know more about us",
      "c": Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return DraggableScrollableSheet(
      builder: (context, controller) {
        return Material(
          color: theme.colorScheme.background,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                height: 8,
                width: 40,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          for (var icon in icons)
                            FractionallySizedBox(
                              widthFactor: 0.33,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: (icon["c"] as Color).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Icon(
                                      (icon["i"] as IconData),
                                      color: icon["c"] as Color,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${icon["t"]}",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "More options".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                      Wrap(
                        children: [
                          for (var icon in icons2) ...[
                            if (icons2.indexOf(icon) > 0)
                              Divider(
                                color: Theme.of(context).colorScheme.primary,
                                height: 1,
                                indent: 48,
                              ),
                            ListTile(
                              leading: Icon(
                                (icon["i"] as IconData),
                                color: icon["c"] as Color,
                              ),
                              minLeadingWidth: 0,
                              minVerticalPadding: 20,
                              title: Text(
                                "${icon["t"]}",
                                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                              ),
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              subtitle: Text(
                                "${icon["s"]}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      minChildSize: 0.5,
      initialChildSize: 0.75,
    );
  }
}