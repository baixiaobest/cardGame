//
//  Card.h
//  cardGame
//
//  Created by Baixiao Huang on 9/22/14.
//  Copyright (c) 2014 Baixiao Huang. All rights reserved.
//

#ifndef cardGame_Card_h
#define cardGame_Card_h

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match : (NSArray*) otherCards;

@end

#endif
