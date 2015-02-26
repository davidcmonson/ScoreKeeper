//
//  GameController.h
//  ScoreKeeper
//
//  Created by sombra on 2015-02-13.
//  Copyright (c) 2015 sombra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface GameController : NSObject

@property (nonatomic, strong, readonly) NSArray *games;

@property (nonatomic, strong, readonly) NSArray *players;

+ (GameController *)sharedInstance;

- (void)addGameWithTitle:(NSString *)title;
- (void)removeGame:(Game *)game;
- (void)synchronize;
- (void)removePlayer:(Players *)player;
- (void)addPlayerToGame:(Game *)game;
- (Players *)createPlayerWithName:(NSString *)name;


@end
