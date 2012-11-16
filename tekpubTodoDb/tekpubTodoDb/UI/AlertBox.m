//
//  AlertBox.m
//  tekpubTodo
//
//  Created by Kris Krause on 11/14/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import "AlertBox.h"

@implementation AlertBox

+(void) showAlert:(NSString *)title:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title message: message delegate: self cancelButtonTitle: @"Close" otherButtonTitles: nil];
    
	[alert show];
}

@end
