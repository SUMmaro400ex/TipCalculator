//
//  ViewController.m
//  HelloWorld
//
//  Created by Jonathan on 9/21/14.
//  Copyright (c) 2014 JonComApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UITextField *splitWays;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSelected;
@property (weak, nonatomic) IBOutlet UILabel *tipMessage;
@property (weak, nonatomic) IBOutlet UILabel *tipOnly;


@end

@implementation ViewController


- (IBAction)ChangingBillAmount:(id)sender {
    [self tipAmount:nil];
}
- (IBAction)ChangingPeopleAmount:(id)sender {
    [self tipAmount:nil];
}


- (IBAction)tipAmount:(id)sender {
    
    int selected = (int)[self.tipSelected selectedSegmentIndex];
    if (sender) {
        [self.view endEditing:YES];
    }
    
    switch (selected) {
        case 0:{
            [self.tipMessage setText:[self buildMessage]];
            [self.total setText:[self numberFormatting:1.05]];
            [self.tipOnly setText:[self tipNumberFormatting:.05]];
                }
        break;
            
        case 1:{
            [self.tipMessage setText:[self buildMessage]];
            [self.total setText:[self numberFormatting:1.1]];
            [self.tipOnly setText:[self tipNumberFormatting:.1]];
                }
        break;
            
        case 2:{
            [self.tipMessage setText:[self buildMessage]];
            [self.total setText:[self numberFormatting:1.15]];
            [self.tipOnly setText:[self tipNumberFormatting:.15]];
                }
        break;
        
        case 3:{
            [self.tipMessage setText:[self buildMessage]];
            [self.total setText:[self numberFormatting:1.20]];
            [self.tipOnly setText:[self tipNumberFormatting:.2]];
                }
        break;
        
        case 4:{
            [self.tipMessage setText:[self buildMessage]];
            [self.total setText:[self numberFormatting:1.25]];
            [self.tipOnly setText:[self tipNumberFormatting:.25]];
                }
        break;
            
        default:{
            
        }
        break;
    }

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (NSString *)numberFormatting : (double) tip{
    NSString *bill = [[self billAmount] text];
    NSString *splitNum = [[self splitWays] text];
    int split = [splitNum intValue];
    double billValue =[bill doubleValue];
    
    if (split == 0) {
        billValue = (billValue * tip);
    } else {
        billValue = (billValue * tip)/split;
    }
    NSNumberFormatter *cash = [[NSNumberFormatter alloc] init];
    [cash setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSNumber *cashTotal = [NSNumber numberWithFloat:billValue];
    NSString *formattedCash = [cash stringFromNumber:cashTotal];
    
    NSString *totalMessage = [[NSString alloc] initWithFormat:@"For a total of:    %@  ",formattedCash];
    
    return totalMessage;
}

- (NSString *)tipNumberFormatting: (double) tip{
    NSString *bill = [[self billAmount] text];
    NSString *splitNum = [[self splitWays] text];
    int split = [splitNum intValue];
    double billValue =[bill doubleValue];
    
    if (split == 0) {
        billValue = (billValue * tip);
    } else {
        billValue = (billValue * tip)/split;
    }
    NSNumberFormatter *cash = [[NSNumberFormatter alloc] init];
    [cash setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSNumber *cashTotal = [NSNumber numberWithFloat:billValue];
    NSString *formattedCash = [cash stringFromNumber:cashTotal];
    NSString *totalTipMessage = [[NSString alloc] initWithFormat:@"Each person tips:    %@  ",formattedCash];
    
    return totalTipMessage;
}

- (NSString *)buildMessage {
    int selected = (int)[self.tipSelected selectedSegmentIndex];
    NSString *message = [[NSString alloc]init];
    
    switch (selected) {
  case 0:{
    message = @"WOW, the service was that bad? Thats a 5% tip!";
    }
    break;
    
    case 1:{
            message = @"Guess they were having an off night. Thats a 10% tip.";
        }
            break;
    case 2:{
            message = @"Average, not good but not bad. Thats a 15% tip.";
        }
            break;
    case 3:{
            message = @"Good meal and good service! Thats a 20% tip.";
        }
            break;
        default:{
            message = @"Insanely awesome dining experience! That's a 25% tip!";
        }
    break;
}
    
    return message;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //self.tipSelected.tintColor = [UIColor clearColor];
    
    UIImage *angry = [UIImage imageNamed:@"Angry.png"];
    UIImage *sad = [UIImage imageNamed:@"Sad.png"];
    UIImage *neutral = [UIImage imageNamed:@"Average.png"];
    UIImage *happy = [UIImage imageNamed:@"Happy.png"];
    UIImage *veryHappy = [UIImage imageNamed:@"Very Happy.png"];
    
    angry = [angry imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tipSelected setImage:angry forSegmentAtIndex:0];
    
    sad = [sad imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tipSelected setImage:sad forSegmentAtIndex:1];
    
    neutral = [neutral imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tipSelected setImage:neutral forSegmentAtIndex:2];
    
    happy = [happy imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tipSelected setImage:happy forSegmentAtIndex:3];
 
    veryHappy = [veryHappy imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tipSelected setImage:veryHappy forSegmentAtIndex:4];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
