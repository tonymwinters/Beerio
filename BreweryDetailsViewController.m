//
//  BreweryDetailsViewController.m
//  Beer.io
//
//  Created by Tony Winters on 8/24/13.
//  Copyright (c) 2013 Tony Winters. All rights reserved.
//

#import "BreweryDetailsViewController.h"
#import "BeerDetailViewController.h"

@interface BreweryDetailsViewController ()

@end

@implementation BreweryDetailsViewController
@synthesize breweryId;
@synthesize tableView;
NSArray *recipes;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BITCHES AND HOES");
    NSString *returnedJSON;
    NSError *jsonParsingError;
    NSData *json;
    NSDictionary *jsonObject;
    
    brewerydbconnect *connection = [[brewerydbconnect alloc] init];
    returnedJSON = [connection getBreweryBeers:(breweryId)];
    json=[returnedJSON dataUsingEncoding:NSUTF8StringEncoding];
    
    jsonObject = [NSJSONSerialization JSONObjectWithData:json
                                                               options:0
                                                                 error:&jsonParsingError];
    NSArray *results = [jsonObject objectForKey:@"data"];
    NSMutableArray *beers = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [results count]; i++) {
        NSDictionary *beer = [results objectAtIndex:i];
        [beers addObject:beer];
    }
    
    recipes = beers;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    //
    
    NSDictionary *beer = [recipes objectAtIndex:indexPath.row];
    NSString *name = [beer objectForKey:@"name"];
    NSDictionary *labels = [beer objectForKey:@"labels"];
    NSString *img = [labels objectForKey:@"icon"];
    NSString *desc = [beer objectForKey:@"description"];
    cell.textLabel.text = name;
    cell.detailTextLabel.text = desc;
    cell.imageView.image = [UIImage imageWithData:
                            [NSData dataWithContentsOfURL:
                             [NSURL URLWithString: img]]];
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBeer"]) {

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BeerDetailViewController *destController = segue.destinationViewController;
        destController.beer = [recipes objectAtIndex:indexPath.row];
    }
}


@end
