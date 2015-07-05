//
//  EventListViewController.m
//  Exerceo
//
//  Created by Billy on 4/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "EventListViewController.h"
#import "EventListTableViewCell.h"
#import <Parse/Parse.h>

@interface EventListViewController () {
    NSArray *events;
}

@end

@implementation EventListViewController

- (void)viewDidLoad {
    events = [NSArray array];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PFQuery *query = [PFQuery queryWithClassName:@"Places"];
    [query whereKey:@"place_id" equalTo:_place[@"place_id"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded
            PFObject *placeObject =  objects[0];
            //PFUser *user = [PFUser currentUser];
            PFQuery *query = [PFQuery queryWithClassName:@"Events"];
            [query whereKey:@"Place" equalTo:placeObject];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                   events = objects;
                [self.tableView reloadData];
            }];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventListCell" forIndexPath:indexPath];
    
    NSString *eventName =  events[indexPath.row][@"EventName"];
    PFUser *holderUser = events[indexPath.row][@"CreatedUser"];
    
    UILabel *eventNameLabel = (UILabel *)[cell viewWithTag:1001];
    UILabel *holderNameLabel = (UILabel *)[cell viewWithTag:1002];
    UILabel *eventDateLabel = (UILabel *)[cell viewWithTag:1003];

    cell.joinButon.tag = indexPath.row;
    [cell.joinButon addTarget:self action:@selector(didClickJoin:) forControlEvents:UIControlEventTouchUpInside];

    [eventNameLabel setText:eventName];
    [holderNameLabel setText:[NSString stringWithFormat:@"by %@",holderUser.username]];
    
    NSDate *eventDate = events[indexPath.row][@"EventDate"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy hh:mm a"];
    NSString *strDate = [dateFormatter stringFromDate:eventDate];
    [eventDateLabel setText:strDate];
    
    return cell;
}


-(void)didClickJoin:(UIButton*)sender
{
    
    PFObject *event = events[sender.tag];
    PFUser *user = [PFUser currentUser];
    PFObject *eventPlayer = [PFObject objectWithClassName:@"EventPlayer"];
    
    eventPlayer[@"Event"] = event;
    eventPlayer[@"User"] = user;
    [eventPlayer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // The login failed. Check error to see why.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event"
                                                        message:@"You have joined!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.tableView reloadData];
    }];

    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
