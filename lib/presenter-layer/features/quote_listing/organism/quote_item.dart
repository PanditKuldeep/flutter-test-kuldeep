import 'package:flutter/material.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:common/presenter-layer/utils/style_manager.dart';

class QuoteItem extends StatelessWidget {
  final QuotesListingEntity? quoteItem;
  final int index;
  final Function(String) onItemClick;

  const QuoteItem(
      {super.key,
      required this.quoteItem,
      required this.index,
      required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClick.call(quoteItem?.id ?? '');
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text('$index.'),
                  ),
                  Expanded(
                    child: Text(
                      '"${quoteItem?.content}"',
                      style: StyleManager.blackTextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '- ${quoteItem?.author}',
                  style: StyleManager.greyTextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
