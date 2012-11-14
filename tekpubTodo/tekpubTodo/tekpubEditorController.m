//
//  tekpubEditorController.m
//  tekpubTodo
//
//  Created by Kris Krause on 11/13/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import "tekpubEditorController.h"

@interface tekpubEditorController ()

@end

@implementation tekpubEditorController

@synthesize delegate, defaultText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction) save {
    if (delegate != nil) {
        [delegate todoEditor:self didFinishWithResults:YES];
    }
}

-(IBAction) cancel {
    if (delegate != nil) {
        [delegate todoEditor:self didFinishWithResults:NO];
    }
}

-(NSString *) text {
    return [textField text];
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Text";
}

-(NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"Please enter a description";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [textField becomeFirstResponder];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @""] autorelease];
    
    CGRect frame = CGRectInset(cell.contentView.bounds, 25, 10);
    
    textField = [[UITextField alloc] initWithFrame:frame];
    
    if (defaultText != nil) {
        textField.text = defaultText;
    }
    
    textField.delegate = self;
    
    [cell addSubview:textField];
    [textField release];
    
    return cell;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textDescField {
    [textField resignFirstResponder];
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
