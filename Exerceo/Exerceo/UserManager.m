//
//  User.m
//  Exerceo
//
//  Created by Billy on 4/07/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "UserManager.h"
@implementation UserManager

+(instancetype)shareManager{
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}



@end
