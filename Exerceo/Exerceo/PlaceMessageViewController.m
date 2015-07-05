//
//  PlaceMessageViewController.m
//  Exerceo
//
//  Created by Billy on 5/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "PlaceMessageViewController.h"
#import "PlaceNewMessageViewController.h"

#import <Parse/Parse.h>

@interface PlaceMessageViewController ()

@end

@implementation PlaceMessageViewController {
    NSArray *placecomments;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated {
    placecomments = [NSArray array];
    PFQuery *query = [PFQuery queryWithClassName:@"Places"];
    [query whereKey:@"place_id" equalTo:_place[@"place_id"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded
            PFObject *placeObject =  objects[0];
            PFUser *user = [PFUser currentUser];
            PFQuery *query = [PFQuery queryWithClassName:@"PlaceComments"];
            [query whereKey:@"Place" equalTo:placeObject];
            [query includeKey:@"User"];

            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                placecomments = objects;
                [_messageTabel reloadData];
            }];

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [placecomments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1001];
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:1002];
    UITextView *commentText = (UITextView *)[cell viewWithTag:1003];
    
    PFObject *placecomment =  [placecomments objectAtIndex:indexPath.row];
    PFUser *user = placecomment[@"User"];
    commentText.text = placecomment[@"text"];
    
    nameLabel.text = user.username;
    dateLabel.text = placecomment[@"createdAy"];
    //TODO:Annoymoius user
    /*
    if([PFAnonymousUtils isLinkedWithUser:user]) {
    } else {
        nameLabel.text = @"Anonymous";
    } */
    // Configure the cell...
    
    return cell;
}


- (IBAction)didClickAddComment:(id)sender {
    [self performSegueWithIdentifier:@"messgaetabel2newmessage" sender:sender];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"messgaetabel2newmessage"] ){
        PlaceNewMessageViewController *vc = (PlaceNewMessageViewController *)segue.destinationViewController;
        vc.place = _place;
    }
}


@end
