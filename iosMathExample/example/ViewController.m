//
//  ViewController.m
//  iosMath
//
//  Created by Kostub Deshmukh on 8/29/13.
//  Copyright (C) 2013 MathChat
//   
//  This software may be modified and distributed under the terms of the
//  MIT license. See the LICENSE file for details.
//

#import "ViewController.h"
#import "MTMathUILabel.h"
#import "MTMathListBuilder.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    CGRect frame = [UIApplication sharedApplication].keyWindow.bounds;
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.view = scrollView;

    UIView* contentView = [[UIView alloc] init];
    [self addFullSizeView:contentView to:scrollView];
    // set the size of the content view
    // Disable horizontal scrolling.
    [self setEqualWidths:contentView andView:scrollView];
    [self setHeight:1080 forView:contentView];


    // Demo formulae
    // Quadratic formula
    MTMathUILabel* demoLabel1 = [self createMathLabel:@"x = \\frac{-b + \\sqrt{b^2-4ac}}{2a}" withHeight:60];
    [self addLabelAsSubview:demoLabel1 to:contentView];
    // This is first label so set the height from the top
    NSDictionary *views = NSDictionaryOfVariableBindings(demoLabel1);
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(30)-[demoLabel1]"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:views]];


    MTMathUILabel* demoLabel2 = [self createMathLabel:@"(a_1+a_2)^2=a_1^2+2a_1a_2+a_2^2" withHeight:40];
    [self addLabelAsSubview:demoLabel2 to:contentView];
    [self setVerticalGap:10 between:demoLabel1 and:demoLabel2];

    MTMathUILabel* lastDemoLabel = demoLabel2;

    // Test different aspects
    MTMathUILabel* label1 = [self createMathLabel:@"3+2-5 = 0" withHeight:40];
    label1.backgroundColor = [UIColor colorWithHue:0.15 saturation:0.2 brightness:1.0 alpha:1.0];
    [self addLabelAsSubview:label1 to:contentView];
    [self setVerticalGap:30 between:lastDemoLabel and:label1];

    // Infix and prefix Operators
    MTMathUILabel* label2 = [self createMathLabel:@"12+-3 > +14" withHeight:40];
    label2.backgroundColor = [UIColor colorWithHue:0.15 saturation:0.2 brightness:1.0 alpha:1.0];
    label2.textAlignment = kMTTextAlignmentCenter;
    [self addLabelAsSubview:label2 to:contentView];
    [self setVerticalGap:10 between:label1 and:label2];

    // Latex commands
    MTMathUILabel* label3 = [self createMathLabel:@"5\\times(-2 \\div 1) = -10" withHeight:40];
    label3.backgroundColor = [UIColor colorWithHue:0.15 saturation:0.2 brightness:1.0 alpha:1.0];
    label3.textAlignment = kMTTextAlignmentRight;
    label3.paddingRight = 20;
    [self addLabelAsSubview:label3 to:contentView];
    [self setVerticalGap:10 between:label2 and:label3];

    MTMathUILabel* label4 = [self createMathLabel:@"-h - (5xy+2) = z" withHeight:40];
    [self addLabelAsSubview:label4 to:contentView];
    [self setVerticalGap:10 between:label3 and:label4];

    // Text mode fraction
    MTMathUILabel* label5 = [self createMathLabel:@"\\frac12x + \\frac{3\\div4}2y = 25" withHeight:60];
    label5.labelMode = kMTMathUILabelModeText;
    [self addLabelAsSubview:label5 to:contentView];
    [self setVerticalGap:10 between:label4 and:label5];

    // Display mode fraction
    MTMathUILabel* label6 = [self createMathLabel:@"\\frac{x+\\frac{12}{5}}{y}+\\frac1z = \\frac{xz+y+\\frac{12}{5}z}{yz}" withHeight:60];
    label6.backgroundColor = [UIColor colorWithHue:0.15 saturation:0.2 brightness:1.0 alpha:1.0];
    label6.paddingLeft = 20;
    [self addLabelAsSubview:label6 to:contentView];
    [self setVerticalGap:10 between:label5 and:label6];

    // Exponents and subscripts
    // Large font
    MTMathUILabel* label8 = [self createMathLabel:@"\\frac{x^{2+3y}}{x^{2+4y}} = x^y \\times \\frac{z_1^{y+1}}{z_1^{y+1}}" withHeight:90];
    label8.fontSize = 30;
    label8.textAlignment = kMTTextAlignmentCenter;
    [self addLabelAsSubview:label8 to:contentView];
    [self setVerticalGap:10 between:label6 and:label8];

    // Small font
    MTMathUILabel* label9 = [self createMathLabel:@"\\frac{x^{2+3y}}{x^{2+4y}} = x^y \\times \\frac{z_1^{y+1}}{z_1^{y+1}}" withHeight:30];
    label9.fontSize = 10;
    label9.textAlignment = kMTTextAlignmentCenter;
    [self addLabelAsSubview:label9 to:contentView];
    [self setVerticalGap:10 between:label8 and:label9];

    // Square root
    MTMathUILabel* label10 = [self createMathLabel:@"5+\\sqrt{2}+3" withHeight:40];
    [self addLabelAsSubview:label10 to:contentView];
    [self setVerticalGap:10 between:label9 and:label10];

    // Square root inside square roots and with fractions
    MTMathUILabel* label11 = [self createMathLabel:@"\\sqrt{\\frac{\\sqrt{\\frac{1}{2}} + 3}{\\sqrt5^x}}+\\sqrt{3x}+x^{\\sqrt2}" withHeight:60];
    [self addLabelAsSubview:label11 to:contentView];
    [self setVerticalGap:10 between:label10 and:label11];

    // General root
    MTMathUILabel* label12 = [self createMathLabel:@"\\sqrt[3]{24} + 3\\sqrt{2}24" withHeight:40];
    [self addLabelAsSubview:label12 to:contentView];
    [self setVerticalGap:10 between:label11 and:label12];

    // Fractions and formulae in root
    MTMathUILabel* label13 = [self createMathLabel:@"\\sqrt[x+\\frac{3}{4}]{\\frac{2}{4}+1}" withHeight:60];
    [self addLabelAsSubview:label13 to:contentView];
    [self setVerticalGap:10 between:label12 and:label13];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MTMathUILabel*) createMathLabel:(NSString*) latex withHeight:(CGFloat) height
{
    MTMathUILabel* label = [[MTMathUILabel alloc] init];
    [self setHeight:height forView:label];
    label.mathList = [MTMathListBuilder buildFromString:latex];
    return label;
}

- (void)addFullSizeView:(UIView *)view to:(UIView*) parent
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(view);
    [parent addSubview:view];
    [parent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views]];
    [parent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views]];
}

- (void) setHeight:(CGFloat) height forView:(UIView*) view
{
    view.translatesAutoresizingMaskIntoConstraints = false;
    // Add height constraint
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute multiplier:1
                                                                   constant:height];
    constraint.active = YES;
}

- (void) setEqualWidths:(UIView*) view1 andView:(UIView*) view2
{
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:view1
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual toItem:view2
                                                                  attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    constraint.active = YES;
}

- (void) addLabelAsSubview:(UIView*) label to:(UIView*) parent
{
    label.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(label);
    [parent addSubview:label];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(10)-[label]-(10)-|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:views]];
}

- (void) setVerticalGap:(CGFloat) gap between:(UIView*) view1 and:(UIView*) view2
{
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:view2
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view1
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1 constant:gap];
    constraint.active = YES;
}
@end
