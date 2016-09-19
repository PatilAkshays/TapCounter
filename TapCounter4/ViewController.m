//
//  ViewController.m
//  TapCounter4
//
//  Created by Mac on 08/09/16.
//  Copyright © 2016 Akshay. All rights reserved.
//
#define kHeightOfResetButton 80.0
#define KheightOfStatusBar 20.0
#define kHeightToReduceForm (kHeightOfResetButton + kHeightOfStatusBar)
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat heightOfScreen= [[UIScreen mainScreen]bounds].size.height;
    
    CGFloat widthOfScreen = [[UIScreen mainScreen]bounds].size.width;
    
    
    CGRect labelNumberFrame = CGRectMake(0, KheightOfStatusBar, widthOfScreen, heightOfScreen-KheightOfStatusBar);
    
    labelNumber = [[UILabel alloc]initWithFrame:labelNumberFrame];
    
    labelNumber.backgroundColor = [UIColor redColor];
    
    [self handelReset];
    
    labelNumber.textAlignment = NSTextAlignmentCenter;
    
    labelNumber.font =[UIFont systemFontOfSize:70];
    
    [self.view addSubview:labelNumber];

    buttonTap = [[UIButton alloc]initWithFrame:labelNumberFrame];
    
    [buttonTap addTarget:self action:@selector(handelTap) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonTap];
    
    CGRect resetButtonFrame = CGRectMake(0, heightOfScreen-kHeightOfResetButton, widthOfScreen, kHeightOfResetButton);
    
    buttonReset = [[UIButton alloc]initWithFrame:resetButtonFrame];
    
    
    [buttonReset setTitle:@"RESET" forState:UIControlStateNormal];
    
    [buttonReset setTitle:@"RESETING..." forState:UIControlStateHighlighted];
    
    buttonReset.backgroundColor =[UIColor blackColor];

    
    buttonReset.tintColor = [UIColor whiteColor];
    
    [buttonReset addTarget:self action:@selector(handelReset) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonReset];
    
    
}

-(void)handelReset {
    labelNumber.text=@"0";
}
-(void)handelTap {
    NSString *currentValueString = labelNumber.text;
    
    int currentValueInt = currentValueString.intValue;
    
    currentValueInt =currentValueInt + 1;
    
    NSString *newValueString = [NSString stringWithFormat:@"%d",currentValueInt];
    
    labelNumber.text = newValueString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
