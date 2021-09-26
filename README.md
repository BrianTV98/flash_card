## FLASH CARD

Support for creating Flash Cards - a learning method that makes it easier for users to remember information.
Dependencies:
  flutter_tindercard: ^0.2.0

## Install 
In your `pubspec.yaml` root add:

```yaml
dependencies:
  flash_card: ^0.0.5
```

![Showscase gif](https://github.com/BrianTV98/flash_card/blob/main/assets/flash_card_demo.gif)

```
   FlashCard(
       frontWidget: Container(
          child: Text(
               'front'
          )
       ),
       backWidget: Container(
           child: Text(
                'back'
           )
       )
   )
```

```
   FlashCardListItem(
       flashcards: []
   )

```
