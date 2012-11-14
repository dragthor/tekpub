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
    
    [self presentViewController:editor animated:YES completion:^(void) {}];
    
    [editor release];
}

-(void) todoEditor:(tekpubEditorController *) editor didFinishWithResults: (BOOL) result {
    if (result) {
        // save
        NSString *text = [editor text];
        
        Todo *todo = [[Todo alloc] initWithText:text];
        
        [items addObject:todo];
        
        [todo release];
    }
    
    [self dismissViewControllerAnimated:YES completion:^(void) {}];
}

-(void)prePopulateItems {
    items = [[NSMutableArray alloc] init];
    
    Todo *coffee = [[Todo alloc] initWithText:@"Coffee"];
    [items addObject: coffee];
    [coffee release];
    
    Todo *shower = [[Todo alloc] initWithText:@"Shower"];
    [items addObject: shower];
    [shower release];
    
    Todo *shave = [[Todo alloc] initWithText:@"Shave"];
    [items addObject: shave];
    [shave release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Tekpub Todo" message: @"Welcome to the todo list app" delegate: self cancelButtonTitle: @"Close" otherButtonTitles: nil];
    
	[alert show];
	[alert release];
    
    [self prePopulateItems];
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
