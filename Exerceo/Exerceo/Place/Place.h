//
//  Place.h
//  Exerceo
//
//  Created by Billy on 29/06/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FacilityType) {
    BasketBall,
    SoftBall,
    BaseBall
    
};

static NSArray *places;
static NSArray *placesJson;
static NSArray *selectPlaces;
static NSArray *favouritsPlaces;

@interface Place : NSObject


@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSNumber *lat;
@property(nonatomic, strong) NSNumber *lng;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSNumber *plaveID;

@property(nonatomic) FacilityType type;

-(instancetype)initWithData:(NSDictionary *)data;

-(instancetype)initWithName:(NSString *)name andAddress:(NSString *)address ;

+ (NSArray *)fetchPlace;
+ (NSArray *)fetchCategory ;
+ (void)setSelectedPlaces:(NSString *)category;
+ (NSArray *) getSelectedPlaces;

+ (NSArray *)getFavouritsPlaces;
+ (void)addFavouritePlace:(NSDictionary *)place;
+ (void)removeFavouritePlace:(NSDictionary *)place;


@end
