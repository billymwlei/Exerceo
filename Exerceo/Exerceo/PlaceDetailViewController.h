//
//  PlaceDetailViewController.h
//  Exerceo
//
//  Created by Billy on 4/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceDetailViewController : UIViewController

//TODO: Chaneg in to Place object
@property(nonatomic, strong) NSDictionary *places;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@end
