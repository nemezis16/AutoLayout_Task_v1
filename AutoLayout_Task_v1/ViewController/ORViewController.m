//
//  ORViewController.m
//  AutoLayout_Task_v1
//
//  Created by MacBook on 25.10.15.
//  Copyright (c) 2015 Osadchuk. All rights reserved.
//

#import "ORViewController.h"

@interface ORViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ORViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (IBAction)loadText:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSMacOSRomanStringEncoding error:nil];
    
    self.textLabel.numberOfLines=0;
    
    
    //set justified alignment
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentJustified;
    
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName : paragraph,
                                  NSFontAttributeName : self.textLabel.font,
                                  NSUnderlineStyleAttributeName : [NSNumber numberWithFloat:0] };
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:content
                                                              attributes:attributes];
    
    self.textLabel.attributedText = str;
    
}

- (IBAction)clearText:(id)sender {
    
    self.textLabel.text=@"";
}
@end
