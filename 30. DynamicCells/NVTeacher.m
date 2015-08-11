//
//  NVTeacher.m
//  30. DynamicCells
//
//  Created by Admin on 12.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVTeacher.h"

@implementation NVTeacher
+(NSString*) chooseFirstname {
    
    NSArray *manFirstnames=[NSArray arrayWithObjects:@"Liam",@"Noah",@"Ethan",@"Mason",
                            @"Logan",@"Lucas",@"Jackson",@"Aiden",@"Oliver", @"Jacob", @"Elijah",
                            @"Alexander",@"James",@"Benjamin",@"Luke",@"Jack",@"Daniel",
                            @"Michael",@"Gabriel", @"William", @"Henry", @"Carter", @"Owen",
                            @"Caleb", @"Wyatt", @"Matthew", @"Jayden", @"Ryan", @"Nathan",
                            @"Isaac", @"Andrew", @"Joshua", @"Connor", @"Eli", @"David",
                            @"Samuel", @"Dylan",@"Hunter", @"Sebastian", @"Anthony",nil];
    NSArray *womenFirstnames=[NSArray arrayWithObjects:
                              @"Emma",@"Olivia",@"Sophia",@"Ava",@"Isabella",@"Mia",
                              @"Charlotte",@"Amelia",@"Emily",@"Madison",@"Harper",
                              @"Abigail",@"Lily",@"Ella",@"Avery",@"Sofia",@"Chloe",
                              @"Evelyn",@"Ellie",@"Aria",@"Aubrey",@"Grace",
                              @"Hannah",@"Audrey",@"Zoe",@"Elizabeth",@"Zoey",
                              @"Nora",@"Scarlett",@"Addison",@"Mila",@"Layla",
                              @"Lillian",@"Lucy",@"Natalie",@"Brooklyn",@"Riley",
                              @"Penelope",@"Violet",@"Claire", nil];
    NSArray *manAndWomen=[NSArray arrayWithObjects:manFirstnames,womenFirstnames, nil];
    NSUInteger manOrWomen=arc4random_uniform(1);
    NSArray *manOrWomenArray=[manAndWomen objectAtIndex:manOrWomen];
    return [manOrWomenArray objectAtIndex:arc4random_uniform((int)[manOrWomenArray count])];
}


@end
