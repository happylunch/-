//
//  ViewController.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/13.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    [self addCell:@"樱花雨" className:@"YinghuaController"];
    [self addCell:@"圣诞礼物" className:@"ShengdanController"];
    [self addCell:@"邮轮" className:@"YoulunController"];
    [self addCell:@"棒棒糖" className:@"LollipopController"];
    
    UITableView *tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, mScreenHeight) style:UITableViewStylePlain];
    tabView.dataSource = self;
    tabView.delegate = self;
    [self.view addSubview:tabView];
}

- (void)addCell:(NSString *)title className:(NSString *)className
{
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *clsName = self.classNames[indexPath.row];
    Class cls = NSClassFromString(clsName);
    UIViewController *vc = [[cls alloc] init];
    vc.title = self.titles[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
