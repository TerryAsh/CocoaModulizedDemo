//
//  FYViewController.m
//  FangyouModulized
//
//  Created by FY on 07/23/2018.
//  Copyright (c) 2018 FY. All rights reserved.
//

#import "FYViewController.h"

@interface FYViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property(nonatomic ,strong) NSDictionary<NSString *, NSString *> *titleAndRoute;

@end

@implementation FYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    tableView.delegate = self;
    
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary<NSString *,NSString *> *)titleAndRoute{
    if (nil == _titleAndRoute) {
        _titleAndRoute = @{
                           @"房源列表":@"/estate/list",
                           @"客源列表":@"/client/list"
                           };
    }
    return _titleAndRoute;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = self.titleAndRoute.allKeys[indexPath.row];
    [[FYRouter sharedRouter] openRoute:self.titleAndRoute[key]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleAndRoute.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellID];
    }
    cell.textLabel.text = self.titleAndRoute.allKeys[indexPath.row];
    return cell;
}

@end
