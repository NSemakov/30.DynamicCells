//
//  ViewController.h
//  30. DynamicCells
//
//  Created by Admin on 11.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, StudentValue){
    StudentValueFive,
    StudentValueFour,
    StudentValueThree,
    StudentValueTwo
};
@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray* arrayOfStudents;
@property (strong,nonatomic) NSMutableArray* arrayOfFiveStudents;
@property (strong,nonatomic) NSMutableArray* arrayOfFourStudents;
@property (strong,nonatomic) NSMutableArray* arrayOfThreeStudents;
@property (strong,nonatomic) NSMutableArray* arrayOfTwoStudents;
@property (strong,nonatomic) NSMutableArray* arrayOfTeachers;


@end

