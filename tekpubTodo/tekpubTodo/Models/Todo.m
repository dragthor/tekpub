//
//  Todo.m
//  tekpubTodo
//
//  Created by Kris Krause on 11/13/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import "Todo.h"

@implementation Todo

@synthesize text;
@synthesize completed;

-(id)initWithText:(NSString *) initText {
    if (self = [super init]) {
        self.text = initText;
    }
    
    return self;
}

@end
