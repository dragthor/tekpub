//
//  ViewController.m
//  tekpubTodo
//
//  Created by Kris Krause on 11/10/12.
//  Copyright (c) 2012 Kris Krause. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Tekpub Todo" message: @"Welcome to the todo list app" delegate: self cancelButtonTitle: @"Close" otherButtonTitles: nil];
    
	[alert show];
	[alert release];
    
    items = [[NSMutableArray alloc] init];
    
    [items addObject:@"Coffee"];
    [items addObject:@"Shower"];
    [items addObject:@"Shave"];
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
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    return cell;
}

- (void) dealloc {
    [items release];
    
    [super dealloc];
}

@end
