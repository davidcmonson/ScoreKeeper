//
//  Players.h
//  ScoreKeeper
//
//  Created by David Monson on 2/25/15.
//  Copyright (c) 2015 sombra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Players : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * score;
@property (nonatomic, retain) NSManagedObject *game;

@end
