//
//  ViewController.m
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flips;
//@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame* game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UILabel *controlMessage;



@end

@implementation ViewController

- (CardMatchingGame* ) game
{
    if(!_game ) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    return _game;
}

- (IBAction)flipCard:(UIButton *)sender
{
    NSUInteger index = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
}

- (void)updateUI
{
    for(UIButton* cardButton in self.cardButtons)
    {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]  forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        self.controlMessage.text = self.game.message;
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
    return nil;
}

- (IBAction)redeal:(UIButton *)sender
{
    _deck = nil;
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    [self updateUI];
    self.segmentedControl.selectedSegmentIndex = 0;
}

- (IBAction)setMode:(UISegmentedControl *)sender
{
    self.game.threeCardsMode = [sender selectedSegmentIndex];
}


@end
