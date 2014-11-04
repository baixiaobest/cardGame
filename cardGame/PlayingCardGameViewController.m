//
//  PlayingCardGameViewController.m
//  cardGame
//
//  Created by Baixiao Huang on 11/3/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController()

@end

@implementation PlayingCardGameViewController

- (Deck*) createDeck
{
    return [[PlayingCardDeck alloc]init];
}

@end