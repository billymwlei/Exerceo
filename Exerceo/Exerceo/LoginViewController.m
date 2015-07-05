//
//  LoginViewController.m
//  Exerceo
//
//  Created by Billy on 4/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    
    if (currentUser) {
        [self performSegueWithIdentifier:@"login2menu" sender:nil];
    } else {
        // show the signup or login screen
    }

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"login2menu"]) {
        
    }
}



- (IBAction)didClickLogin:(id)sender {
    if([PFUser currentUser]){
        [PFUser logOut];
    }
    [PFUser logInWithUsernameInBackground:_userNameLabel.text password:_passwordLabel.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self performSegueWithIdentifier:@"login2menu" sender:nil];
                                        } else {
                                            // The login failed. Check error to see why.
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Error"
                                                                                            message:@"Wrong Password"
                                                                                           delegate:self
                                                                                  cancelButtonTitle:@"OK"
                                                                                  otherButtonTitles:nil];
                                            [alert show];
                                        }
                                    }];
}




- (IBAction)didClickRegister:(id)sender {
    
}

- (IBAction)didClickSkipLogin:(id)sender {
    [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (error) {
            NSLog(@"Anonymous login failed.");
        } else {
            [self performSegueWithIdentifier:@"login2menu" sender:nil];
        }
    }];
}



@end
