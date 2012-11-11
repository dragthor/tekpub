//
//  ViewController.h
//  tekpubTodo
//
//  Created by Kris Krause on 11/10/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
   NSMutableArray *items; 
}
@end
