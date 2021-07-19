//
//  NewViewController.m
//  UIApplicationDemo
//
//  Created by rambo on 2021/7/17.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (nonatomic, strong) UITextView* textView;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, strong) IBOutlet UIImageView *image;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [self constructUI];
    
}

- (void)constructUI
{
    self.title = self.str;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width)];
    [imageView setImage:[UIImage systemImageNamed:self.str]];
    [self.view addSubview:imageView];
}

@end
