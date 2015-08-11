//
//  ViewController.m
//  30. DynamicCells
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "NVStudent.h"
#import "NVTeacher.h"
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
    self.arrayOfStudents=[[NSMutableArray alloc]init];
    self.arrayOfFiveStudents=[[NSMutableArray alloc]init];
    self.arrayOfFourStudents=[[NSMutableArray alloc]init];
    self.arrayOfThreeStudents=[[NSMutableArray alloc]init];
    self.arrayOfTwoStudents=[[NSMutableArray alloc]init];
    self.arrayOfTeachers=[[NSMutableArray alloc]init];
    /*
     //Student
    for (NSInteger i=0; i<1000; i++) {
        NVStudent *student=[[NVStudent alloc]init];
        student.name=[NVStudent chooseFirstname];
        student.color=[self randomColor];
        [self.arrayOfStudents addObject:student];
    }
     //---end of Student
     */
    
     //Superman+
     for (NSInteger i=0; i<10; i++) {
     NVTeacher *teacher=[[NVTeacher alloc]init];
     teacher.name=[NVTeacher chooseFirstname];
     teacher.color=[self randomColor];
     [self.arrayOfTeachers addObject:teacher];
     }
     //---end of Superman+
    
     for (NSInteger i=0; i<30; i++) {
     NVStudent *student=[[NVStudent alloc]init];
     student.name=[NVStudent chooseFirstname];
     student.average=arc4random_uniform(4*1000)/1000.f+2;
         if (student.average>4.5f) {
             [self.arrayOfFiveStudents addObject:student];
         } else if (student.average<=4.5f && student.average>3.8f){
             [self. arrayOfFourStudents addObject:student];
         }
         else if (student.average<=3.8f && student.average>=3.f){
             [self. arrayOfThreeStudents addObject:student];
         }
         else if (student.average<3.f){
             [self. arrayOfTwoStudents addObject:student];
         }
     
     }
    self.arrayOfStudents=[NSMutableArray arrayWithObjects:self.arrayOfFiveStudents,self.arrayOfFourStudents,self.arrayOfThreeStudents,self.arrayOfTwoStudents, nil];
    for (NSMutableArray* array in self.arrayOfStudents){
        [array sortUsingComparator:^NSComparisonResult(NVStudent* obj1, NVStudent* obj2) {
            return [obj1.name compare:obj2.name];
        }];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
/* 
 //Uchenik
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
 //----end of Uchenik
*/
//Student
//Master
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.arrayOfStudents count]+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section<=StudentValueTwo) {
        return [[self.arrayOfStudents objectAtIndex:section] count];
    } else {
        return [self.arrayOfTeachers count];
    }
    //return [[self.arrayOfStudents objectAtIndex:section] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case StudentValueFive:
            return @"\"Five\" students";
            break;
        case StudentValueFour:
            return @"\"Four\" students";
            break;
        case StudentValueThree:
            return @"\"Three\" students";
            break;
        case StudentValueTwo:
            return @"\"Two\" students";
            break;
            
        default:
            return @"Teachers";
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=nil;
    UITableViewCell *cell=nil;
    if (indexPath.section==StudentValueTwo+1 /*i.e. teachers section*/) {
           identifier=@"teachers";
        cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        NVTeacher* teacher=[self.arrayOfTeachers objectAtIndex:indexPath.row];
        UIColor *cellColor=teacher.color;
        CGFloat redColorComponent;
        CGFloat greenColorComponent;
        CGFloat blueColorComponent;
        CGFloat alphaColorComponent;
        
        [cellColor getRed:&redColorComponent green:&greenColorComponent blue:&blueColorComponent alpha:&alphaColorComponent];
        cell.backgroundColor=cellColor;
        cell.textLabel.text=[NSString stringWithFormat:@"RGB(%.0f,%.0f,%.0f)",roundf(redColorComponent*255.f) ,roundf(greenColorComponent*255.f),roundf(blueColorComponent*255.f)];
    } else {
           identifier=@"students";
        cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
        NVStudent *student=[[self.arrayOfStudents objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        if (student.average<3.f) {
            cell.backgroundColor=[UIColor redColor];
        } else {
            cell.backgroundColor=[UIColor clearColor];
        }
        
        cell.textLabel.text=student.name;
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%.2f",student.average];
    }
    

    
    return cell;
    
}

#pragma mark - help methods
- (UIColor*) randomColor {
    CGFloat redColorComponent=(float)arc4random_uniform(256)/255.f;
    CGFloat greenColorComponent=(float)arc4random_uniform(256)/255.f;
    CGFloat blueColorComponent=(float)arc4random_uniform(256)/255.f;
    UIColor *color=[UIColor colorWithRed:redColorComponent green:greenColorComponent blue:blueColorComponent alpha:1.f];
    return color;
}
@end
