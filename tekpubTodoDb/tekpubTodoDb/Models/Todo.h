//
//  Todo.h
//  tekpubTodo
//
//  Created by Kris Krause on 11/13/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject {
    NSString *test;
    BOOL completed;
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic) BOOL completed;

-(id)initWithText:(NSString *)text;

@end
