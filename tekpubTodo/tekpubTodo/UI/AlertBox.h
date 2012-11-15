//
//  AlertBox.h
//  tekpubTodo
//
//  Created by Kris Krause on 11/14/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertBox : NSObject
    +(void) showAlert:(NSString *)title: (NSString *)message;
@end
