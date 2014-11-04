//
//  ViewController.m
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flips;
//@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame* game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (CardMatchingGame* ) game
{
    if(!_game ) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    return _game;
}

/*- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flips.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}*/

- (IBAction)flipCard:(UIButton *)sender
{
    int index = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
}

- (void)updateUI
{
    for(UIButton* cardButton in self.cardButtons)
    {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]  forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (NSString*) titleForCard:(Card*) card
{
    return (card.chosen) ? card.contents:@"";
}

- (UIImage*) backgroundImageForCard:(Card*) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardFront":@"cardBack"];
}

- (Deck*) deck
{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck*) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
