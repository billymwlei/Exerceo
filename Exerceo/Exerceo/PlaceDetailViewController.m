//
//  PlaceDetailViewController.m
//  Exerceo
//
//  Created by Billy on 4/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "PlaceDetailViewController.h"
#import "PlaceMessageViewController.h"
#import "EventNewViewController.h"
#import "EventListViewController.h"
#import "Place.h"

@interface PlaceDetailViewController () {
    NSDictionary *picDict;
}

@end

@implementation PlaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addressLabel.text = _places[@"formattedAddress"];
    _nameLabel.text = _places[@"name"];
    self.title = NSLocalizedString((NSString *)_places[@"Type"] , nil);
    _categoryNameLabel.text = NSLocalizedString((NSString *)_places[@"Type"] , nil);
    // Do any additional setup after loading the view.
    picDict = @{@"Lawn Boel":@"lawn-bowls.jpg",
                @"Badminton":@"badminton.jpg",
                @"Tennis":@"tennis.jpg",
                @"BaseBall":@"baseball.jpg",
                @"Swimming pool":@"swimming.jpg",
                @"BMX":@"bmx.jpg",
                @"Basketball":@"basketball.jpg",
                @"Skate Board":@"skate-park.jpg",
                @"Cricket":@"cricket.jpg",
                @"Golf":@"golf.jpg",
                @"Dog Park":@"dog-park.jpg"};
    
    [_backgroundImage setImage:[UIImage imageNamed:@"badminton-info"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didClickAddComment:(id)sender {
    [self performSegueWithIdentifier:@"placeDetail2placeMessage" sender:nil];
}
- (IBAction)didClickNewEvent:(id)sender {
    [self performSegueWithIdentifier:@"placeDetail2newEvent" sender:nil];

}
- (IBAction)didClickEventList:(id)sender {
    [self performSegueWithIdentifier:@"placeDetail2eventList" sender:nil];

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"placeDetail2placeMessage"]) {
        PlaceMessageViewController *vc = (PlaceMessageViewController *)segue.destinationViewController;
        vc.place = _places;
    } else if([segue.identifier isEqualToString:@"placeDetail2newEvent"]) {
        EventNewViewController *vc = (EventNewViewController *)segue.destinationViewController;
        vc.place = _places;
    } else if([segue.identifier isEqualToString:@"placeDetail2eventList"]) {
        EventListViewController *vc = (EventListViewController *)segue.destinationViewController;
        vc.place = _places;
    }
}


@end
