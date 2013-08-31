//
//  BeerDetailViewController.h
//  Beer.io
//
//  Created by Tony Winters on 8/24/13.
//  Copyright (c) 2013 Tony Winters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *beerNameLabel;
@property (nonatomic, strong) NSString *beerName;
@property (nonatomic, strong) NSDictionary *beer;
@property (weak, nonatomic) IBOutlet UIImageView *beerImage;
@property (weak, nonatomic) IBOutlet UITextView *beerDescription;

@end
