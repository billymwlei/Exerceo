//
//  PlaceNewMessageViewController.m
//  Exerceo
//
//  Created by Billy on 5/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "PlaceNewMessageViewController.h"
#import <Parse/Parse.h>

@interface PlaceNewMessageViewController ()

@end

@implementation PlaceNewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didClickSubmit:(id)sender {
    NSString *comment = _commentLabel.text;
    PFQuery *query = [PFQuery queryWithClassName:@"Places"];
    [query whereKey:@"place_id" equalTo:_place[@"place_id"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded
            PFObject *placeObject =  objects[0];
            PFUser *user = [PFUser currentUser];
            PFObject *placeComment = [PFObject objectWithClassName:@"PlaceComments"];
            placeComment[@"User"] = user;
            placeComment[@"text"] = comment;
            placeComment[@"Place"] = placeObject;
            // Do something with the found objects
            [placeComment saveInBackground];
            [placeComment saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {                [self.navigationController popViewControllerAnimated:YES];
                
            }];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

@end
