//
//  ViewController.m
//  30. DynamicCells
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.tableView.delegate=self;
    self.tableView.dataSource=self;
    UIEdgeInsets inset=UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.scrollIndicatorInsets=inset;
    self.tableView.contentInset=inset;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    UIColor *cellColor=[self randomColor];
    CGFloat redColorComponent;
    CGFloat greenColorComponent;
    CGFloat blueColorComponent;
    CGFloat alphaColorComponent;
    
    [cellColor getRed:&redColorComponent green:&greenColorComponent blue:&blueColorComponent alpha:&alphaColorComponent];
    cell.backgroundColor=cellColor;
    cell.textLabel.text=[NSString stringWithFormat:@"RGB(%.0f,%.0f,%.0f)",roundf(redColorComponent*255.f) ,roundf(greenColorComponent*255.f),roundf(blueColorComponent*255.f)];
    
    return cell;
    
}


#pragma mark - hepl methods
- (UIColor*) randomColor {
    CGFloat redColorComponent=(float)arc4random_uniform(256)/255.f;
    CGFloat greenColorComponent=(float)arc4random_uniform(256)/255.f;
    CGFloat blueColorComponent=(float)arc4random_uniform(256)/255.f;
    UIColor *color=[UIColor colorWithRed:redColorComponent green:greenColorComponent blue:blueColorComponent alpha:1.f];
    return color;
}
@end
