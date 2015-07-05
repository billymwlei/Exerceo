//
//  Place.m
//  Exerceo
//
//  Created by Billy on 29/06/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "Place.h"

@implementation Place


- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    if([data objectForKey:@"name"]) {
        self.name = data[@"name"];
    }
    
    if([data objectForKey:@"formattedAddress"]) {
        self.address = data[@"formattedAddress"];
    }
    
    return self;

}


-(instancetype)initWithName:(NSString *)name andAddress:(NSString *)address {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.name = name;
    self.address = address;
    
    return self;
}

//!!!! important run this to load the json!!!!
+ (NSArray *)fetchPlace {
    if(places == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Brisbane" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        placesJson = json;
        NSMutableArray *result = [NSMutableArray array];
        for(NSDictionary *placeDict in json) {
            Place *place = [[Place alloc] initWithData:placeDict];
            [result addObject:place];
        }
        places = result;
    }
    return places;
}

+ (NSArray *) getSelectedPlaces {
    return selectPlaces;
}

+(NSArray *)fetchCategory {
    NSSet *uniqueStates = [NSSet setWithArray:[placesJson valueForKey:@"Type"]];
    return [uniqueStates allObjects];
}

+(void)setSelectedPlaces:(NSString *)category {
    selectPlaces = [placesJson  filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Type = %@", category]];
}



+ (NSArray *)getFavouritsPlaces {
    if(favouritsPlaces == nil) {
        favouritsPlaces = [NSArray array];
    }
    return favouritsPlaces;
}

+ (void)addFavouritePlace:(NSDictionary *)place{
    
}

+ (void)removeFavouritePlace:(NSDictionary *)place{
    
}

@end
