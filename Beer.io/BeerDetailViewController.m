//
//  BeerDetailViewController.m
//  Beer.io
//
//  Created by Tony Winters on 8/24/13.
//  Copyright (c) 2013 Tony Winters. All rights reserved.
//

#import "BeerDetailViewController.h"

@interface BeerDetailViewController ()

@end

@implementation BeerDetailViewController

@synthesize beerName;
@synthesize beerNameLabel;
@synthesize beer;
@synthesize beerImage;
@synthesize beerDescription;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    beerNameLabel.text = [beer objectForKey: @"name"];

    NSDictionary *allImages = [beer objectForKey: @"labels"];
    NSString *largeImage = [allImages objectForKey: @"large"];

    beerImage.image = [UIImage imageWithData:
            [NSData dataWithContentsOfURL:
                    [NSURL URLWithString: largeImage]]];

    beerDescription.text = [beer objectForKey: @"description"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
