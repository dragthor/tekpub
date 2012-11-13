//
//  ViewController.h
//  tekpubTodo
//
//  Created by Kris Krause on 11/10/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tekpubEditorController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, tekpubEditorDelegate> {
   NSMutableArray *items;
}

-(IBAction) addButtonPushed;
@end
