//
//  PlaceCategoryTableTableViewController.m
//  Exerceo
//
//  Created by Billy on 29/06/2015.
//  Copyright (c) 2015 Billy. All rights reserved.
//

#import "PlaceCategoryTableTableViewController.h"
#import "PlaceCateTableViewCell.h"
#import "PlaceDetailViewController.h"
#import "Place.h"


@interface PlaceCategoryTableTableViewController () {
    NSString *selectCategory;
    NSDictionary *picDict;
}

@property(nonatomic, strong) NSArray* categorys;

@end

@implementation PlaceCategoryTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [Place fetchCategory];
    _categorys = array;
    
    [Place fetchPlace];
    
    picDict = @{@"Lawn Bowls":@"lawn-bowls.jpg",
                @"Badminton":@"badminton.jpg",
                @"Tennis":@"tennis.jpg",
                @"Baseball":@"baseball.jpg",
                @"Swimming":@"swimming.jpg",
                @"BMX":@"bmx.jpg",
                @"Basketball":@"basketball.jpg",
                @"Skateboarding":@"skate-park.jpg",
                @"Cricket":@"cricket.jpg",
                @"Golf":@"golf.jpg",
                @"Run the Dog":@"dog-park.jpg"};

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _categorys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlaceCateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlcaeCategoryCell" forIndexPath:indexPath];
    cell.name.text = NSLocalizedString((NSString *)_categorys[indexPath.row] , nil);
    NSLog(@"%@",[picDict objectForKey:_categorys[indexPath.row]]);
    
    
    
    [cell.backgroundImage setImage:[UIImage imageNamed:[picDict objectForKey:_categorys[indexPath.row]]]];
    [cell.backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [Place setSelectedPlaces:_categorys[indexPath.row]];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //category2lis
}


@end
