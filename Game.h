//
//  Game.h
//  ScoreKeeper
//
//  Created by David Monson on 2/25/15.
//  Copyright (c) 2015 sombra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Players;

@interface Game : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSOrderedSet *players;
@end

@interface Game (CoreDataGeneratedAccessors)

- (void)insertObject:(Players *)value inPlayersAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPlayersAtIndex:(NSUInteger)idx;
- (void)insertPlayers:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePlayersAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPlayersAtIndex:(NSUInteger)idx withObject:(Players *)value;
- (void)replacePlayersAtIndexes:(NSIndexSet *)indexes withPlayers:(NSArray *)values;
- (void)addPlayersObject:(Players *)value;
- (void)removePlayersObject:(Players *)value;
- (void)addPlayers:(NSOrderedSet *)values;
- (void)removePlayers:(NSOrderedSet *)values;
@end
