//
//  PhotoViewController.m
//  Peek-a-Boo
//
//  Created by Efrén Reyes Torres on 8/17/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@property NSArray *imageViews;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation PhotoViewController

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
    self.imageViews = @[[[UIImageView alloc] initWithImage:[UIImage imageWithData:self.user.photo]]];
    CGFloat width = 0.0;
    for (UIImageView *imageView in self.imageViews) {
        [self.scrollView addSubview:imageView];
        imageView.frame = CGRectMake(width, 0, self.view.frame.size.width, self.view.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
//        width += imageView.frame.size.width;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
