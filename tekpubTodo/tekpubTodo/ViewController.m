//
//  ViewController.m
//  tekpubTodo
//
//  Created by Kris Krause on 11/10/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import "ViewController.h"
#import "Todo.h"
#import "tekpubEditorController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) addTodo:(NSString *) todoText {
    Todo *todo = [[Todo alloc] initWithText:todoText];
    
    [items addObject:todo];
    [todo release];
}

-(IBAction) addButtonPushed {
    tekpubEditorController *editor = [[tekpubEditorController alloc] initWithNibName:@"tekpubEditorController" bundle:nil];
    
    editor.delegate = self;
    
    [self presentModalViewController:editor animated:YES];
    
    [editor release];
}

-(void) todoEditor:(tekpubEditorController *) editor didFinishWithResults: (BOOL) result {
    if (result) {
        // save
    }
    
    [self dismissViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Tekpub Todo" message: @"Welcome to the todo list app" delegate: self cancelButtonTitle: @"Close" otherButtonTitles: nil];
    
	[alert show];
	[alert release];
    
    items = [[NSMutableArray alloc] init];
    
    [self addTodo:@"Coffee"];
    [self addTodo:@"Shower"];
    [self addTodo:@"Shave"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [items count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == Nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    Todo *todo = [items objectAtIndex:indexPath.row];
    cell.textLabel.text = todo.text;
    
    if (todo.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Todo *todo = [items objectAtIndex:indexPath.row];
    
    todo.completed = !todo.completed;
    
    [tableView reloadData];
}

- (void) dealloc {
    [items release];
    
    [super dealloc];
}

@end
