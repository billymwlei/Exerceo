//
//  RootViewController.m
//  Exerceo
//
//  Created by Billy on 28/06/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "RootViewController.h"
#import "PlaceCategoryTableTableViewController.h"
#import "EventListViewController.h"
#import "AccountSettingViewController.h"
#import "Place.h"

@interface RootViewController ()
@property (nonatomic, strong) CAPSPageMenu *pageMenu;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PlaceCategoryTableTableViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"PlaceCategoryTableTableViewController"];
    vc1.title = NSLocalizedString(@"Place Category",nil);
    EventListViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"SavedEventViewController"];
    vc2.title = NSLocalizedString(@"Event",nil);
    
    //TODO:List
    AccountSettingViewController *vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"AccountSettingViewController"];
    vc3.title = NSLocalizedString(@"Favourite Place",nil);
    
    
    AccountSettingViewController *vc4= [self.storyboard instantiateViewControllerWithIdentifier:@"AccountSettingViewController"];
    vc4.title = NSLocalizedString(@"Accoutn Setting",nil);
    

    
    
    NSArray *array = @[vc1,vc2,vc3];
    //Font color 24 127 129
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:30.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor orangeColor],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:70.0/255.0 green:70.0/255.0 blue:70.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:13.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:array frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [self.view addSubview:_pageMenu.view];
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

@end
