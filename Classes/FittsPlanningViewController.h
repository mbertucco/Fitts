//
//  FittsPlanningViewController.h
//  FittsPlanning
//
//  Created by Matteo Bertucco on 11/17/10.
//  Copyright 2010 University of Southern California. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>


@interface FittsPlanningViewController : UIViewController {
	
// For each object and instance sse the details in the FittsPlanningViewController.m
	
	UIImageView *imageView;
	UIImageView *imageView2;
	UIImageView *clappingAnimation;
	UIImage *image;
	UIImage *image2;
	UIImage *image3;
	UIImage *image4;
	UIButton *button;
	UITouch *touchPressed;
	UITouch *touchReleased;
	CGPoint pointPressed;
	CGPoint pointReleased;
	int M;
	float delay, delay2, delay3;
	int random1, random2;
	NSInteger sequence;
	NSInteger cost;
	NSInteger subjID;
	int i;
	int Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, Ex, Ey, Fx, Fy, Gx, Gy, Hx, Hy, Ix, Iy;
	CFTimeInterval timeImageView;
	CFTimeInterval targetPressed;
	CFTimeInterval targetReleased;
	float movTime;
	float Distance;
	float ID;
	int Pv;
	int Pid;
	int Successful;
	int planIndex;
	int Score;
	int scoreL;
	float MovTimeTotal;
	int xTarget;
	int yTarget;
	int xPosition;
	int yPosition;
	int targetSize;
	float reactionTime;
	int xDiffPressRel;
	int yDiffPressRel;
	float difference;
	int tooEarlyIndex;
	int scoreLabel_x;
	int scoreLabel_y;
	UILabel *scoreLabel;
	IBOutlet UILabel *endLabel1;
	IBOutlet UILabel *endLabel2;
	IBOutlet UITextField *sequenceTextField;
	IBOutlet UITextField *costTextField;
	IBOutlet UITextField *subjIDTextField;
	AVAudioPlayer *targetSound;
	AVAudioPlayer *bassoSound;
	AVAudioPlayer *clappingSound;
	NSMutableString *string;
	NSMutableString *stringtotal;
	NSData *data;
	NSArray *paths;
	NSString *documentsDirectory;
	NSString *fileName;
	UIButton *button2;

}
- (IBAction) NOplan: (id) sender;
- (IBAction) YESplan: (id) sender;
- (IBAction) Start: (id) sender;
- (IBAction) Exit: (id) sender; 
- (void)target;
- (void)cue;
- (void)removeTarget;
- (void)removeCue;
- (void)targetPressedEvent;
- (void)targetReleasedEvent;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)tooFast;



@property (retain,nonatomic) UIImageView *imageView;
@property (retain,nonatomic) UIImageView *imageView2;
@property (retain,nonatomic) UIImageView *clappingAnimation;
@property (retain,nonatomic) UIImage *image;
@property (retain,nonatomic) UIImage *image2;
@property (retain,nonatomic) UIImage *image3;
@property (retain,nonatomic) UIImage *image4;
@property (retain,nonatomic) UIButton *button;
@property (retain,nonatomic) UILabel *scoreLabel;
@property (retain,nonatomic) UITextField *sequenceTextField;
@property (retain,nonatomic) UITextField *costTextField;
@property (retain,nonatomic) UITextField *subjIDTextField;
@property (retain,nonatomic) UILabel *endLabel1;
@property (retain,nonatomic) UILabel *endLabel2;
@property (retain,nonatomic) UIButton *button2;

@end

