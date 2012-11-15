//
//  ViewController.h
//  tekpubTodo
//
//  Created by Kris Krause on 11/10/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tekpubEditorController.h"
#import "Todo.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, tekpubEditorDelegate> {
    
    NSMutableArray *todoItems;
    IBOutlet UITableView *tableViewReference;
    BOOL editting;
    Todo *lastEditTodo;
}

-(IBAction) addButtonPushed;
-(IBAction) editButtonPushed;

@end
