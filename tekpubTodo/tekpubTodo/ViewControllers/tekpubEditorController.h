//
//  tekpubEditorController.h
//  tekpubTodo
//
//  Created by Kris Krause on 11/13/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tekpubEditorDelegate;

@interface tekpubEditorController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate> {
    
    id<tekpubEditorDelegate> delegate;
    UITextField *textField;
    NSString *defaultText;
}

@property (nonatomic, weak) id<tekpubEditorDelegate> delegate;
@property (nonatomic, readonly) NSString *text;
@property (nonatomic, copy) NSString *defaultText;

-(IBAction) save;
-(IBAction) cancel;

@end

@protocol tekpubEditorDelegate
-(void) todoEditor:(tekpubEditorController *) editor didFinishWithResults: (BOOL) result;
@end

