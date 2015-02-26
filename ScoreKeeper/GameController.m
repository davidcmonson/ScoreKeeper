//
//  GameController.m
//  ScoreKeeper
//
//  Created by sombra on 2015-02-13.
//  Copyright (c) 2015 sombra. All rights reserved.
//

#import "GameController.h"
#import "Stack.h"
#import "Players.h"
#import "Game.h"

@interface GameController ()

@property (nonatomic, strong) NSArray *players;

@end


static NSString * const playersKey = @"Players";
static NSString * const gamesKey = @"Game";

@implementation GameController

+ (GameController *)sharedInstance {
    static GameController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GameController alloc] init];
        
    });
    return sharedInstance;
}

- (NSArray *)games {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Game"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return objects;
}

- (void)addGameWithTitle:(NSString *)title {
    
    Game *newGame = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    
    newGame.title = title;
    
    [self synchronize];
    
}

- (Players *)createPlayerWithName:(NSString *)name {
    
    Players *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    return player;
}

- (void)addPlayerToGame:(Game *)game {
    Players *player = [NSEntityDescription insertNewObjectForEntityForName:playersKey inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    [player setGame:game];
    [self synchronize];
}

- (void)removePlayer:(Players *)player {
    
    [player.managedObjectContext deleteObject:player];
    
    [self synchronize];
}

- (void)removeGame:(Game *)game {
    
    [[Stack sharedInstance].managedObjectContext deleteObject:game];
    
    [self synchronize];
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}
//
//- (void)moveFromIndex:(NSInteger)oldIndex toNewIndex:(NSInteger)newIndex {
//    
//    NSMutableArray *mutableGames = [[NSMutableArray alloc] initWithArray:self.games];
//    Game *game = [mutableGames objectAtIndex:oldIndex];
//    [mutableGames removeObject:game];
//    [mutableGames insertObject:game atIndex:newIndex];
//    
//    self.games = mutableGames;
//    [self saveToDefaults];
//}

@end
