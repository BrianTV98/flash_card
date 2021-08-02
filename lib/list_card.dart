import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';


class FlashCardListItem extends StatefulWidget {
  final List<FlashCard> flashcards;

  /// action when done
  final Function() onDone;

  /// constructor
  const FlashCardListItem({
    @required this.flashcards,
    this.onDone,Key key}) : super(key: key);


  @override
  _FlashCardListItemState createState() => _FlashCardListItemState();
}

class _FlashCardListItemState extends State<FlashCardListItem> {

  /// position current of card is showing
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return TinderSwapCard(
      swipeUp: true,
      swipeDown: true,
      orientation: AmassOrientation.BOTTOM,
      totalNum: widget.flashcards.length,
      stackNum: 3,
      swipeEdge: 4.0,
      animDuration: 100,
      maxWidth: MediaQuery.of(context).size.width * 0.9,
      maxHeight: MediaQuery.of(context).size.width * 0.9,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      minHeight: MediaQuery.of(context).size.width * 0.8,
      cardBuilder: (context, index) => AbsorbPointer(
          absorbing: (index != currentIndex),
          child: widget.flashcards[index]),
      cardController: CardController(),
      swipeUpdateCallback:
          (DragUpdateDetails details, Alignment align) {
        /// Get swiping card's alignment
        if (align.x < 0) {
          //Card is LEFT swiping
        } else if (align.x > 0) {
          //Card is RIGHT swiping
        }
      },
      swipeCompleteCallback:
          (CardSwipeOrientation orientation, int index) {
        setState(() {
          currentIndex = index;
        });
        widget.onDone?.call();
        /// Get orientation & index of swiped card!
      },
    );
  }
}



