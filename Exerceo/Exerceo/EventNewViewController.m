//
//  EventNewViewController.m
//  Exerceo
//
//  Created by Billy on 5/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "EventNewViewController.h"
#import <Parse/Parse.h>

@interface EventNewViewController () {
    NSDate *date;
}

@end

@implementation EventNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    date = [NSDate date];
    // Do any additional setup after loading the view.
    [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    date = datePicker.date;
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    [self.dateButton setTitle: strDate forState:UIControlStateNormal] ;
}

- (IBAction)didClickCreateEvent:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Places"];
    [query whereKey:@"place_id" equalTo:_place[@"place_id"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded
            PFObject *placeObject =  objects[0];
            PFUser *user = [PFUser currentUser];
            PFObject *event = [PFObject objectWithClassName:@"Events"];
            event[@"Place"] = placeObject;
            event[@"EventName"] = _eventNameLabel.text;
            event[@"EventDate"] = date;
            event[@"CreatedUser"] = user;
            // Do something with the found objects
            [event saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                
                PFObject *eventPlayer = [PFObject objectWithClassName:@"EventPlayer"];
                
                eventPlayer[@"Event"] = event;
                eventPlayer[@"User"] = user;
                [eventPlayer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    [self.navigationController popViewControllerAnimated:YES];
                }];
            }];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
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
