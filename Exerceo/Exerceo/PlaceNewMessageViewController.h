//
//  PlaceNewMessageViewController.h
//  Exerceo
//
//  Created by Billy on 5/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceNewMessageViewController : UIViewController

@property(nonatomic,assign) NSDictionary *place;
@property (weak, nonatomic) IBOutlet UITextField *commentLabel;

@end
