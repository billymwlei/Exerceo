//
//  EventNewViewController.h
//  Exerceo
//
//  Created by Billy on 5/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventNewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *eventNameLabel;

@property (weak, nonatomic) IBOutlet UIButton *dateButton;

@property (nonatomic, strong) NSDictionary *place;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
