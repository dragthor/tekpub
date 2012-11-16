//
//  ViewController.m
//  tekpubTodo
//
//  Created by Kris Krause on 11/10/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import "tekpubViewController.h"
#import "Todo.h"
#import "AlertBox.h"
#import "tekpubEditorController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) addTodo:(NSString *) todoText {
    if (todoText != nil && todoText.length > 0) {
        BOOL found = NO;
        
        if (lastEditTodo == nil) {
        
            Todo *todo = [[Todo alloc] initWithText:todoText];
            
            for (Todo *item in todoItems) {
                if ([item.text isEqualToString:todo.text]) {
                    found = YES;
                    break;
                }
            }
            
            if (found == NO) {
                [todoItems addObject:todo];
            }

        } else {
            lastEditTodo.text = todoText;
        }
    }
}

-(IBAction) addButtonPushed {
    lastEditTodo = nil;
    
    [self presentTodoEditor: nil];
}

-(IBAction) editButtonPushed {
    isEditting = !isEditting;
    
    [tableViewReference setEditing:isEditting animated:YES];
}

-(void) todoEditor:(tekpubEditorController *) editor didFinishWithResults: (BOOL) result {
    if (result) {
        // handle save
        NSString *text = [editor text];
        
        [self addTodo:text];
        
        [tableViewReference reloadData];
    }
    
    [self dismissViewControllerAnimated:YES completion:^(void) {}];
}

-(void) presentTodoEditor:(NSString *)text {
    tekpubEditorController *editor = [[tekpubEditorController alloc] initWithNibName:@"tekpubEditorController" bundle:nil];
    
    if (text != nil) {
        editor.defaultText = text;
    }
    
    editor._delegate = self;
    
    [self presentViewController:editor animated:YES completion:^(void){}];
}

-(void)prePopulateItems {
    todoItems = [[NSMutableArray alloc] init];
    
    Todo *coffee = [[Todo alloc] initWithText:@"Coffee"];
    [todoItems addObject: coffee];
    
    Todo *shower = [[Todo alloc] initWithText:@"Shower"];
    [todoItems addObject: shower];
    
    Todo *shave = [[Todo alloc] initWithText:@"Shave"];
    [todoItems addObject: shave];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [AlertBox showAlert:@"Todo" : @"Welcome to the todo list app."];
    
    [self prePopulateItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [todoItems count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Todo *todo = [todoItems objectAtIndex:indexPath.row];
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
    
    Todo *todo = [todoItems objectAtIndex:indexPath.row];
    
    if (isEditting) {
        lastEditTodo = todo;
        
        [self presentTodoEditor: todo.text];
        
    } else {
        todo.completed = !todo.completed;
        
        [tableView reloadData];
    }
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [todoItems removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths: [NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}


@end
