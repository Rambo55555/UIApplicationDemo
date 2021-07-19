//
//  ViewController.m
//  UIApplicationDemo
//
//  Created by rambo on 2021/7/15.
//

#import "ViewController.h"
#import "NewViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    label.text = @"Hello, world";
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 130, self.view.frame.size.width, 30)];
    [button setTitle:@"点击" forState:0];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view addSubview:label];
    
    [self addUserActivity];
    [self supportSpotlightSearch];
}

- (void)clickButton
{
    NSLog(@"hhh");
    NewViewController *newView = [[NewViewController alloc] init];
    newView.str = @"New View";
    [self.navigationController pushViewController:newView animated:YES];
    [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:nil];
}

- (void)addUserActivity
{
    self.userActivity = [[NSUserActivity alloc] initWithActivityType:@"rambo"];
    self.userActivity.title = @"这是搜索标题 1";
    self.userActivity.keywords = [NSSet setWithArray:@[@"hot", @"rambo", @"hhh"]];
    
    self.userActivity.eligibleForHandoff = NO;
    self.userActivity.eligibleForSearch = YES;
    [self.userActivity becomeCurrent];
}

- (void)restoreUserActivityState:(NSUserActivity *)activity
{
    if([activity.title isEqualToString:@"rambo"])
    {
        [self goToNewViewWithStr:activity.title];
    }
    else
    {
        [self goToNewViewWithStr:@"other"];
    }
}

- (void)goToNewViewWithStr:(NSString*) str
{
    NewViewController *newView = [[NewViewController alloc] init];
    newView.str = str;
    [self.navigationController pushViewController:newView animated:YES];
}

- (void)supportSpotlightSearch
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        @try {
            NSArray *array = @[@"airplane", @"car", @"bus"];
            // 要添加的搜索数组
            NSMutableArray *searchableItems = [[NSMutableArray alloc] initWithCapacity:array.count];
            
            for (int i = 0; i < array.count; ++i) {
                // 单一条目的属性集
                CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithContentType:UTTypeImage];
                attributeSet.title = array[i];
                attributeSet.keywords = array;
                attributeSet.contentDescription = [NSString stringWithFormat:@"This is a vehicle: %@", array[i]];
                attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage systemImageNamed:array[i]]);
                // 根据标识符和属性集创建搜索条目
                CSSearchableItem *searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:[NSString stringWithFormat:@"%@", array[i]] domainIdentifier:@"com.tencent.rambo" attributeSet:attributeSet];
                // 添加条目
                [searchableItems addObject:searchableItem];
            }
            // 将搜索索引和条目关联起来
            [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItems completionHandler:^(NSError * _Nullable error) {
                            if (!error)
                            {
                                NSLog(@"%s, %@", __FUNCTION__, [error localizedDescription]);
                            }
            }];
        } @catch (NSException *exception) {
            NSLog(@"%s, %@", __FUNCTION__, exception);
        } @finally {
            
        }
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
