import 'package:flutter/material.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_details/molecules/quotes_details_molecule.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_details/molecules/quotes_tags_molecule.dart';

class QuotesDetails extends StatelessWidget {
  final QuoteDetailsEntity entity;

  const QuotesDetails({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            entity.content ?? '',
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          QuotesDetailsMolecules(label: "Author:", value: entity.author ?? ''),
          const SizedBox(height: 10),
          QuotesDetailsMolecules(
              label: "Date Added:", value: entity.dateAdded ?? ''),
          const SizedBox(height: 10),
          QuotesDetailsMolecules(
              label: "Date Modified:", value: entity.dateModified ?? ''),
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Tags:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: entity.tags?.length ?? 1,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: QuotesTagsMolecule(
                            tags: entity.tags?[index] ?? ''));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
