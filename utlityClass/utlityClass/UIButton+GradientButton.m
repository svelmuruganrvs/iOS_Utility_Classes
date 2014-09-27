//
//  UIButton+GradientButton.m
//  CookApp
//
//  Created by EverestIndia on 13/08/14.
//  Copyright (c) 2014 EverestIndia. All rights reserved.
//

#import "UIButton+GradientButton.h"

@implementation UIButton (GradientButton)
-(void)MakeGradient
{
    CAGradientLayer *layer  = [CAGradientLayer layer];
    NSArray         *colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,(id)[UIColor grayColor].CGColor,nil];
    [layer      setColors:colors];
    [layer      setFrame:self.bounds];
    [self.layer insertSublayer:layer atIndex:0];
    
    self.layer.cornerRadius =   5;
    self.layer.borderWidth  =   3;
    self.layer.borderColor  =   [UIColor colorWithRed:100.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1].CGColor;
    self.clipsToBounds      =   YES; // Important!
}
@end
