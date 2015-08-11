//
//  NVStudent.h
//  30. DynamicCells
//
//  Created by Admin on 12.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NVStudent : NSObject
@property (strong,nonatomic) UIColor *color;
@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) CGFloat average;

+(NSString*) chooseFirstname;

@end
