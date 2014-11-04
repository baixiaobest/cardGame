//
//  ViewController.h
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//
//this is an abstract class, abstract function should be implemented

#import <UIKit/UIKit.h>
#import "PlayingCardDeck.h"

@interface ViewController : UIViewController

//for subclasses
- (Deck*) createDeck;//abstract

@end

