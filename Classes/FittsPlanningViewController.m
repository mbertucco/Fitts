//
//  FittsPlanningViewController.m
//  FittsPlanning
//
//  Created by Matteo Bertucco on 11/17/10.
//  Copyright 2010 University of Southern California. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "FittsPlanningViewController.h"

@implementation FittsPlanningViewController

@synthesize imageView;
@synthesize imageView2;
@synthesize clappingAnimation;
@synthesize image;
@synthesize image2;
@synthesize image3;
@synthesize image4;
@synthesize button;
@synthesize scoreLabel;
@synthesize sequenceTextField;
@synthesize costTextField;
@synthesize subjIDTextField;
@synthesize endLabel1;
@synthesize endLabel2;
@synthesize button2;

	


// Method for the button action to call the Fitts' Law with "NO PLANNING" mode 
- (IBAction) NOplan: (id) sender 
{
	// Positions of the target on the iPad screen
	Ax = 145, Ay = 185, Bx = 384, By = 185, Cx = 623, Cy = 185, Dx = 145, Dy = 532, Ex = 384, Ey = 532, Fx = 623, Fy = 532, Gx = 145, Gy = 879, Hx = 384, Hy = 879, Ix = 623, Iy = 879;
	planIndex = 0; // NO plan index
	M = 0; // M index for NO plan mode , It will be used in further methods
	//[self target];
	random1 = ((arc4random()%200))/1000; // create the random number for the dalay of the target appearance
	delay = 0.4+random1; // create the time delay of the target appearance
	//delay = delay = 0.2+random1;; // delay for Terry
	//delay = 0.80; // create the time delay of the target appearance

	
}


// Method for the button action to call the Fitts' Law with "PLANNING" mode 
- (IBAction) YESplan: (id) sender
{
	
	// Positions of the target on the iPad screen	
	Ax = 145, Ay = 185, Bx = 384, By = 185, Cx = 623, Cy = 185, Dx = 145, Dy = 532, Ex = 384, Ey = 532, Fx = 623, Fy = 532, Gx = 145, Gy = 879, Hx = 384, Hy = 879, Ix = 623, Iy = 879;
	planIndex = 1; // YES plan index
	
	M = 1; // M index for YES plan mode , It will be used in further methods
	
	random1 = ((arc4random()%500))/1000;; // create the random number for the dalay of the target appearance
	random2 = ((arc4random()%100))/1000; // create the random number for the dalay of the cue appearance
	
	delay = 0.650+random1;// create the time delay of the target appearance (it was 0.75)
	delay2 = 0.05+random2;// create the time delay of the cue appearance (it was 0.10)
	delay3 = delay2+0.4;// create the time delay of the cue disappearance (it was 0.4)

	
}

// Method for the start button
- (IBAction) Start: (id) sender{
	
	
	
	if (M ==1) {
		// set the image, frame size and position of the "first" target 
		image = [UIImage imageNamed: @"planstartbutton.jpg" ];
		imageView = [[UIImageView alloc ]initWithImage:image];
		[imageView.layer setBorderColor: [[UIColor blackColor] CGColor]]; // set the border color of the imageView
		[imageView.layer setBorderWidth: 2.0]; // set the border width of the imageView
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(210, 210); // size of the imageView (target)
		rect.size = size;
		imageView.frame = rect;
		imageView.center=CGPointMake(Ex,Ey); // position of the imageView (target)
		[self.view insertSubview:imageView atIndex:0];
	}
	
	else {
		image = [UIImage imageNamed: @"planstartbutton.jpg" ];
		imageView = [[UIImageView alloc ]initWithImage:image];
		[imageView.layer setBorderColor: [[UIColor blackColor] CGColor]]; // set the border color of the imageView
		[imageView.layer setBorderWidth: 2.0]; // set the border width of the imageView
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(210, 210); // size of the imageView (target)
		rect.size = size;
		imageView.frame = rect;
		imageView.center=CGPointMake(Ex,Ey); // position of the imageView (target)
		[self.view insertSubview:imageView atIndex:0];
		
	}
}


// Create the method for the target setting
-(void)target
{
	
	self = [super init];

	
	sequence = [sequenceTextField.text intValue];
	cost = [costTextField.text intValue];
	subjID = [subjIDTextField.text intValue];
	
	
	// Add the suond file to the sound objects
	targetSound = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bubble" ofType:@"wav"]]error:NULL];
	bassoSound = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Basso" ofType:@"mp3"]]error:NULL];
	clappingSound = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Clapping" ofType:@"mp3"]]error:NULL];
	
	// Add the image to the ImageView object
	image = [UIImage imageNamed: @"bubbles.jpg" ];
	imageView = [[UIImageView alloc ]initWithImage:image];
	
	
	// Create the border color and width of the imageView object 
	[imageView.layer setBorderColor: [[UIColor blackColor] CGColor]];
	[imageView.layer setBorderWidth: 2.0];
	
	
	[scoreLabel removeFromSuperview];
	///////////////////////////////////////////
	// SEQUENCE 1////
	///////////////////////////////////////////
	if(sequence == 1){
		
		int size_array[46]={158,158,53,105,158,158,105,105,158,105,158,105,53,105,53,53,53,158,53,158,105,53,158,53,158,158,158,158,53,105,53,105,105,53,158,158,158,105,105,53,105,53,53,105,105,158}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Bx,Cx,Gx,Cx,Fx,Bx,Hx,Gx,Cx,Ax,Dx,Bx,Hx,Dx,Gx,Cx,Ix,Gx,Cx,Ax,Cx,Gx,Ex,Ax,Bx,Cx,Gx,Ax,Gx,Cx,Ex,Hx,Ix,Gx,Ix,Fx,Cx,Gx,Ex,Bx,Hx,Ix,Ax,Dx,Gx,Ax};   // array for the x position of the target 
		int yposition_array[46]={By,Cy,Gy,Cy,Fy,By,Hy,Gy,Cy,Ay,Dy,By,Hy,Dy,Gy,Cy,Iy,Gy,Cy,Ay,Cy,Gy,Ey,Ay,By,Cy,Gy,Ay,Gy,Cy,Ey,Hy,Iy,Gy,Iy,Fy,Cy,Gy,Ey,By,Hy,Iy,Ay,Dy,Gy,Ay};	// array for the y position of the target	
		//Sequence left hand
		//int xposition_array[46]={Bx,Ax,Ix,Ax,Dx,Bx,Hx,Ix,Ax,Cx,Fx,Bx,Hx,Fx,Ix,Ax,Gx,Ix,Ax,Cx,Ax,Ix,Ex,Cx,Bx,Ax,Ix,Cx,Ix,Ax,Ex,Hx,Gx,Ix,Gx,Dx,Ax,Ix,Ex,Bx,Hx,Gx,Cx,Fx,Ix,Cx}; // array for the x position of the target 
		//int yposition_array[46]={By,Ay,Iy,Ay,Dy,By,Hy,Iy,Ay,Cy,Fy,By,Hy,Fy,Iy,Ay,Gy,Iy,Ay,Cy,Ay,Iy,Ey,Cy,By,Ay,Iy,Cy,Iy,Ay,Ey,Hy,Gy,Iy,Gy,Dy,Ay,Iy,Ey,By,Hy,Gy,Cy,Fy,Iy,Cy}; // array for the y position of the target	
		
		
		// create the frame size and position of the imageView which is the size and postion of the target
	CGRect rect = imageView.frame;
	CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
	rect.size = size;
	imageView.frame = rect;
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
	[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
	imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
	
	// Find the time when the target appear on the screen
	timeImageView = CFAbsoluteTimeGetCurrent();
	//printf("imageView is appeared at %f\n",timeImageView);			
	
	
	// Compute the distance between the target and the previus one
	Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
	
	// Compute Index of Difficulty (ID) between the two target
	ID = log((2*Distance)/size_array[i])/ log (2);
	}

	
	///////////////////////////////////////////
	// SEQUENCE 2////
	///////////////////////////////////////////
	
	else if ([[sequenceTextField text] intValue] == 2){
		int size_array[46]={158,53,53,105,105,53,105,105,158,158,105,105,105,53,158,53,105,53,158,53,53,53,53,105,158,53,53,105,158,158,158,158,158,53,158,53,158,53,105,158,105,105,105,53,105,158}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Fx,Cx,Ix,Ax,Dx,Gx,Cx,Ax,Bx,Ex,Cx,Ax,Bx,Cx,Ax,Bx,Ax,Cx,Gx,Dx,Fx,Ex,Fx,Dx,Bx,Ex,Cx,Ix,Cx,Ix,Gx,Cx,Ex,Ax,Gx,Ix,Ax,Gx,Ex,Cx,Ix,Hx,Ex,Cx,Ix,Hx};   // array for the x position of the target 
		int yposition_array[46]={Fy,Cy,Iy,Ay,Dy,Gy,Cy,Ay,By,Ey,Cy,Ay,By,Cy,Ay,By,Ay,Cy,Gy,Dy,Fy,Ey,Fy,Dy,By,Ey,Cy,Iy,Cy,Iy,Gy,Cy,Ey,Ay,Gy,Iy,Ay,Gy,Ey,Cy,Iy,Hy,Ey,Cy,Iy,Hy};   // array for the y position of the target
		// Sequence left hand
		//int xposition_array[46]={Dx,Ax,Gx,Cx,Fx,Ix,Ax,Cx,Bx,Ex,Ax,Cx,Bx,Ax,Cx,Bx,Cx,Ax,Ix,Fx,Dx,Ex,Dx,Fx,Bx,Ex,Ax,Gx,Ax,Gx,Ix,Ax,Ex,Cx,Ix,Gx,Cx,Ix,Ex,Ax,Gx,Hx,Ex,Ax,Gx,Hx};   // array for the x position of the target
		//int yposition_array[46]={Dy,Ay,Gy,Cy,Fy,Iy,Ay,Cy,By,Ey,Ay,Cy,By,Ay,Cy,By,Cy,Ay,Iy,Fy,Dy,Ey,Dy,Fy,By,Ey,Ay,Gy,Ay,Gy,Iy,Ay,Ey,Cy,Iy,Gy,Cy,Iy,Ey,Ay,Gy,Hy,Ey,Ay,Gy,Hy};   // array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
		[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
	}
	
	///////////////////////////////////////////
	// SEQUENCE 3////
	///////////////////////////////////////////
	
	if(sequence == 3){
		int size_array[46]={158,105,105,158,53,53,158,105,158,53,53,105,53,158,105,158,105,158,158,105,53,105,105,53,53,53,53,53,53,53,105,158,53,158,158,105,105,53,105,53,53,105,158,53,105,53}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Cx,Ex,Dx,Ax,Dx,Gx,Cx,Ix,Ex,Hx,Ix,Gx,Dx,Fx,Dx,Bx,Cx,Fx,Hx,Gx,Cx,Ax,Bx,Cx,Gx,Ix,Ax,Gx,Ex,Cx,Gx,Hx,Ix,Cx,Ax,Dx,Fx,Ex,Cx,Gx,Ix,Ax,Cx,Ix,Ex,Hx};   // array for the x position of the target 
		int yposition_array[46]={Cy,Ey,Dy,Ay,Dy,Gy,Cy,Iy,Ey,Hy,Iy,Gy,Dy,Fy,Dy,By,Cy,Fy,Hy,Gy,Cy,Ay,By,Cy,Gy,Iy,Ay,Gy,Ey,Cy,Gy,Hy,Iy,Cy,Ay,Dy,Fy,Ey,Cy,Gy,Iy,Ay,Cy,Iy,Ey,Hy};   // array for the y position of the target
		//Sequence left hand
		//int xposition_array[46]={Ax,Ex,Fx,Cx,Fx,Ix,Ax,Gx,Ex,Hx,Gx,Ix,Fx,Dx,Fx,Bx,Ax,Dx,Hx,Ix,Ax,Cx,Bx,Ax,Ix,Gx,Cx,Ix,Ex,Ax,Ix,Hx,Gx,Ax,Cx,Fx,Dx,Ex,Ax,Ix,Gx,Cx,Ax,Gx,Ex,Hx};   // array for the x position of the target
		//int yposition_array[46]={Ay,Ey,Fy,Cy,Fy,Iy,Ay,Gy,Ey,Hy,Gy,Iy,Fy,Dy,Fy,By,Ay,Dy,Hy,Iy,Ay,Cy,By,Ay,Iy,Gy,Cy,Iy,Ey,Ay,Iy,Hy,Gy,Ay,Cy,Fy,Dy,Ey,Ay,Iy,Gy,Cy,Ay,Gy,Ey,Hy};   // array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
		[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
	}

	///////////////////////////////////////////
	// SEQUENCE 4////
	///////////////////////////////////////////
	
	if(sequence == 4){
		
		int size_array[46]={158,158,105,105,158,53,105,158,105,105,105,105,105,158,105,158,53,158,158,53,53,105,158,53,53,158,158,105,53,53,158,158,158,158,158,105,158,53,53,105,158,158,105,53,105,158}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Hx,Ix,Ax,Gx,Ex,Fx,Dx,Ax,Bx,Hx,Fx,Cx,Gx,Cx,Ix,Hx,Bx,Ax,Gx,Ix,Cx,Ex,Fx,Dx,Bx,Hx,Bx,Ex,Cx,Ax,Cx,Gx,Ix,Ax,Gx,Cx,Ex,Gx,Ax,Gx,Cx,Fx,Ix,Ax,Dx,Gx};   // array for the x position of the target 
		int yposition_array[46]={Hy,Iy,Ay,Gy,Ey,Fy,Dy,Ay,By,Hy,Fy,Cy,Gy,Cy,Iy,Hy,By,Ay,Gy,Iy,Cy,Ey,Fy,Dy,By,Hy,By,Ey,Cy,Ay,Cy,Gy,Iy,Ay,Gy,Cy,Ey,Gy,Ay,Gy,Cy,Fy,Iy,Ay,Dy,Gy};   // array for the y position of the target
		//Sequence left hand
		//int xposition_array[46]={Dx,Gx,Cx,Ix,Ex,Dx,Fx,Cx,Bx,Hx,Dx,Ax,Ix,Ax,Gx,Hx,Bx,Cx,Ix,Gx,Ax,Ex,Dx,Fx,Bx,Hx,Bx,Ex,Ax,Cx,Ax,Ix,Gx,Cx,Ix,Ax,Ex,Ix,Cx,Ix,Ax,Dx,Gx,Cx,Fx,Ix};	// array for the x position of the target
		//int yposition_array[46]={Dy,Gy,Cy,Iy,Ey,Dy,Fy,Cy,By,Hy,Dy,Ay,Iy,Ay,Gy,Hy,By,Cy,Iy,Gy,Ay,Ey,Dy,Fy,By,Hy,By,Ey,Ay,Cy,Ay,Iy,Gy,Cy,Iy,Ay,Ey,Iy,Cy,Iy,Ay,Dy,Gy,Cy,Fy,Iy};	// array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
		[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
	}
	
	///////////////////////////////////////////
	// SEQUENCE 5////
	///////////////////////////////////////////
	
	if(sequence == 5){
		
		int size_array[46]={158,105,158,105,158,105,158,158,105,158,158,105,105,53,105,105,53,53,53,158,158,53,105,53,105,158,53,158,105,105,158,105,158,53,53,158,53,105,53,158,53,53,53,53,105,53}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Gx,Ex,Ax,Gx,Hx,Ex,Cx,Ax,Cx,Bx,Dx,Gx,Cx,Ex,Dx,Fx,Ix,Cx,Ix,Gx,Cx,Ax,Bx,Cx,Ex,Ax,Bx,Hx,Ix,Gx,Cx,Gx,Hx,Bx,Dx,Gx,Ax,Cx,Gx,Ix,Ex,Fx,Cx,Gx,Ax,Cx};   // array for the x position of the target 
		int yposition_array[46]={Gy,Ey,Ay,Gy,Hy,Ey,Cy,Ay,Cy,By,Dy,Gy,Cy,Ey,Dy,Fy,Iy,Cy,Iy,Gy,Cy,Ay,By,Cy,Ey,Ay,By,Hy,Iy,Gy,Cy,Gy,Hy,By,Dy,Gy,Ay,Cy,Gy,Iy,Ey,Fy,Cy,Gy,Ay,Cy};   // array for the y position of the target
		//Sequence left hand
		//int xposition_array[46]={Ix,Ex,Cx,Ix,Hx,Ex,Ax,Cx,Ax,Bx,Fx,Ix,Ax,Ex,Fx,Dx,Gx,Ax,Gx,Ix,Ax,Cx,Bx,Ax,Ex,Cx,Bx,Hx,Gx,Ix,Ax,Ix,Hx,Bx,Fx,Ix,Cx,Ax,Ix,Gx,Ex,Dx,Ax,Ix,Cx,Ax};	// array for the x position of the target
		//int yposition_array[46]={Iy,Ey,Cy,Iy,Hy,Ey,Ay,Cy,Ay,By,Fy,Iy,Ay,Ey,Fy,Dy,Gy,Ay,Gy,Iy,Ay,Cy,By,Ay,Ey,Cy,By,Hy,Gy,Iy,Ay,Iy,Hy,By,Fy,Iy,Cy,Ay,Iy,Gy,Ey,Dy,Ay,Iy,Cy,Ay};	// array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
		
		[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
	}
	
	///////////////////////////////////////////
	// SEQUENCE 6////
	///////////////////////////////////////////
	
	if(sequence == 6){
		
		int size_array[46]={158,158,53,53,158,158,105,105,158,158,105,105,105,105,105,53,53,158,158,53,53,105,53,158,53,158,158,158,158,53,53,105,105,158,53,105,105,158,53,105,53,53,105,158,158,105}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Gx,Ix,Fx,Dx,Gx,Cx,Ix,Ax,Gx,Cx,Gx,Hx,Bx,Ex,Cx,Ax,Dx,Fx,Ix,Ax,Gx,Ax,Bx,Ex,Gx,Cx,Ix,Fx,Bx,Cx,Ax,Dx,Bx,Ax,Gx,Dx,Fx,Dx,Bx,Cx,Gx,Dx,Bx,Cx,Ix,Ax};   // array for the x position of the target 
		int yposition_array[46]={Gy,Iy,Fy,Dy,Gy,Cy,Iy,Ay,Gy,Cy,Gy,Hy,By,Ey,Cy,Ay,Dy,Fy,Iy,Ay,Gy,Ay,By,Ey,Gy,Cy,Iy,Fy,By,Cy,Ay,Dy,By,Ay,Gy,Dy,Fy,Dy,By,Cy,Gy,Dy,By,Cy,Iy,Ay};   // array for the y position of the target
		// Sequence left hand
		//int xposition_array[46]={Ax,Gx,Dx,Fx,Ix,Ax,Gx,Cx,Ix,Ax,Ix,Hx,Bx,Ex,Ax,Cx,Fx,Dx,Gx,Cx,Ix,Cx,Bx,Ex,Ix,Ax,Gx,Dx,Bx,Ax,Cx,Fx,Bx,Cx,Ix,Fx,Dx,Fx,Bx,Ax,Ix,Fx,Bx,Ax,Gx,Cx};   // array for the x position of the target
		//int yposition_array[46]={Ay,Gy,Dy,Fy,Iy,Ay,Gy,Cy,Iy,Ay,Iy,Hy,By,Ey,Ay,Cy,Fy,Dy,Gy,Cy,Iy,Cy,By,Ey,Iy,Ay,Gy,Dy,By,Ay,Cy,Fy,By,Cy,Iy,Fy,Dy,Fy,By,Ay,Iy,Fy,By,Ay,Gy,Cy};   // array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
		[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
	}
	
	
	///////////////////////////////////////////
	// SEQUENCE 7////
	///////////////////////////////////////////
	
	if(sequence == 7){
		
		int size_array[46]={158,53,53,53,158,53,53,105,158,105,53,158,53,158,105,105,53,158,105,53,105,158,158,105,105,158,53,53,105,158,158,158,53,53,53,158,53,53,158,158,53,53,105,53,158,105}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Gx,Dx,Ex,Cx,Gx,Ix,Fx,Cx,Ax,Gx,Ex,Bx,Hx,Ix,Ax,Gx,Cx,Ix,Ax,Gx,Ex,Fx,Dx,Ax,Cx,Gx,Ix,Ex,Fx,Bx,Ex,Cx,Bx,Dx,Fx,Ix,Ax,Bx,Dx,Ex,Bx,Ex,Cx,Bx,Cx,Fx};   // array for the x position of the target 
		int yposition_array[46]={Gy,Dy,Ey,Cy,Gy,Iy,Fy,Cy,Ay,Gy,Ey,By,Hy,Iy,Ay,Gy,Cy,Iy,Ay,Gy,Ey,Fy,Dy,Ay,Cy,Gy,Iy,Ey,Fy,By,Ey,Cy,By,Dy,Fy,Iy,Ay,By,Dy,Ey,By,Ey,Cy,By,Cy,Fy};   // array for the y position of the target		
		//Sequence left hand
		//int xposition_array[46]={Ix,Fx,Ex,Ax,Ix,Gx,Dx,Ax,Cx,Ix,Ex,Bx,Hx,Gx,Cx,Ix,Ax,Gx,Cx,Ix,Ex,Dx,Fx,Cx,Ax,Ix,Gx,Ex,Dx,Bx,Ex,Ax,Bx,Fx,Dx,Gx,Cx,Bx,Fx,Ex,Bx,Ex,Ax,Bx,Ax,Dx};   // array for the x position of the target
		//int yposition_array[46]={Iy,Fy,Ey,Ay,Iy,Gy,Dy,Ay,Cy,Iy,Ey,By,Hy,Gy,Cy,Iy,Ay,Gy,Cy,Iy,Ey,Dy,Fy,Cy,Ay,Iy,Gy,Ey,Dy,By,Ey,Ay,By,Fy,Dy,Gy,Cy,By,Fy,Ey,By,Ey,Ay,By,Ay,Dy};   // array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
		[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
	}
	
	///////////////////////////////////////////
	// SEQUENCE 8////
	///////////////////////////////////////////
	
	if(sequence == 8){
		
		int size_array[46]={158,105,158,105,53,158,105,53,105,105,158,158,105,105,105,53,158,53,105,158,158,105,158,53,105,53,158,53,158,53,105,53,158,158,105,105,158,105,105,158,105,53,158,53,105,105}; // array for the target size
		//Sequence right hand
		int xposition_array[46]={Hx,Ix,Gx,Ix,Hx,Bx,Hx,Fx,Dx,Gx,Cx,Fx,Dx,Fx,Hx,Ex,Ax,Cx,Ex,Hx,Bx,Hx,Gx,Cx,Gx,Cx,Ax,Gx,Ix,Cx,Gx,Ix,Ax,Gx,Hx,Bx,Hx,Gx,Cx,Ex,Ax,Gx,Cx,Gx,Hx,Gx};   // array for the x position of the target 
		int yposition_array[46]={Hy,Iy,Gy,Iy,Hy,By,Hy,Fy,Dy,Gy,Cy,Fy,Dy,Fy,Hy,Ey,Ay,Cy,Ey,Hy,By,Hy,Gy,Cy,Gy,Cy,Ay,Gy,Iy,Cy,Gy,Iy,Ay,Gy,Hy,By,Hy,Gy,Cy,Ey,Ay,Gy,Cy,Gy,Hy,Gy};   // array for the y position of the target		
		//Sequence left hand
		//int xposition_array[46]={Ax,Gx,Ix,Gx,Hx,Bx,Hx,Dx,Fx,Ix,Ax,Dx,Fx,Dx,Hx,Ex,Cx,Ax,Ex,Hx,Bx,Hx,Ix,Ax,Ix,Ax,Cx,Ix,Gx,Ax,Ix,Gx,Cx,Ix,Hx,Bx,Hx,Ix,Ax,Ex,Cx,Ix,Ax,Ix,Hx,Ix};   // array for the x position of the target
		//int yposition_array[46]={Ay,Gy,Iy,Gy,Hy,By,Hy,Dy,Fy,Iy,Ay,Dy,Fy,Dy,Hy,Ey,Cy,Ay,Ey,Hy,By,Hy,Iy,Ay,Iy,Ay,Cy,Iy,Gy,Ay,Iy,Gy,Cy,Iy,Hy,By,Hy,Iy,Ay,Ey,Cy,Iy,Ay,Iy,Hy,Iy};   // array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////
		
		
		[self.view insertSubview:imageView atIndex:0]; // add the imageView to the view
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
	}
	
	if(sequence == 9){
		
		
		int size_array[9]={158,105,53,158,105,53,158,105,53}; // array for the target size
		//Sequence right hand
		int xposition_array[9]={Ax,Bx,Cx,Ex,Gx,Hx,Ix,Fx,Dx};   // array for the x position of the target 
		int yposition_array[9]={Ay,By,Cy,Ey,Gy,Hy,Iy,Fy,Dy};   // array for the y position of the target
		//Sequence left hand
		//int xposition_array[9]={Cx,Bx,Ax,Ex,Ix,Hx,Gx,Dx,Fx};   // array for the x position of the target
		//int yposition_array[9]={Cy,By,Ay,Ey,Iy,Hy,Gy,Dy,Fy};   // array for the y position of the target
		
		// create the frame size and position of the imageView which is the size and postion of the target
		CGRect rect = imageView.frame;
		CGSize size = CGSizeMake(size_array[i], size_array[i]); // size of the target
		rect.size = size;
		imageView.frame = rect;
		
		/////////////////// code for score label above the target////////
		scoreLabel_x = xposition_array[i]-70;
		scoreLabel_y = yposition_array[i]-((size_array[i]/2)+25);
		scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabel_x,scoreLabel_y,140,20)];
		scoreLabel.shadowColor = [UIColor grayColor];
		scoreLabel.shadowOffset = CGSizeMake(1,1);
		scoreLabel.textColor = [UIColor redColor];
		scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.font = [UIFont boldSystemFontOfSize:20.0];
		[self.view insertSubview:scoreLabel atIndex:0];
		
		/////////////////////////////////////////////////////////																	 
		
		[self.view insertSubview:imageView atIndex:0];
																	 
		
		imageView.center=CGPointMake(xposition_array[i],yposition_array[i]); // position of the target	
		xTarget = xposition_array[i];
		yTarget = yposition_array[i];
		targetSize = size_array[i];
		
		// Find the time when the target appear on the screen
		timeImageView = CFAbsoluteTimeGetCurrent();
		//printf("imageView is appeared at %f\n",timeImageView);			
		
		
		// Compute the distance between the target and the previus one
		Distance = sqrt(((xposition_array[i]- xposition_array[i-1])* (xposition_array[i]- xposition_array[i-1]))+((yposition_array[i]- yposition_array[i-1])* (yposition_array[i]- yposition_array[i-1])));
		
		// Compute Index of Difficulty (ID) between the two target
		ID = log((2*Distance)/size_array[i])/ log (2);
		}	
	
	// Create the loop for the arrays positions and sizes. I this way the targets will appear following the arrays orders.
	i++;
	
	
	// At the end of the task (at the end of the loop) show the total score. With a button the application ends
	
		if (i>46){
			endLabel1.text = [NSString stringWithFormat:@"GREAT JOB!!!\n"]; // I create a textfield for showing the GREAT JOB at the end of the trial
			endLabel2.text = [NSString stringWithFormat:@"You burst %d bubbles\n", Score]; // I create a textfield for showing the total score at the end of the trial
		
		
		// Create the frame positon and size for the imageView which shows the congratulation image 
		image3 = [UIImage imageNamed: @"congrat.jpg" ]; // set the congratulation image to the imageView frame
		clappingAnimation = [[UIImageView alloc ]initWithImage:image3]; // set the congratulation image to the imageView frame
		CGRect rect3 = clappingAnimation.frame; 
		CGSize size3 = CGSizeMake(740, 300); //  create the size of the frame
		rect3.size = size3;
		clappingAnimation.frame = rect3;
		[self.view addSubview:clappingAnimation];
		clappingAnimation.center=CGPointMake(384,280); // create the position of the frame
		[self.view addSubview:clappingAnimation]; // add the congratulation imageView to the view
		
	
		[clappingSound play]; // play the clapping sound
		 
		
		
		// set the button to exito from the application
		button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		button.frame = CGRectMake(184, 820, 400, 200); // position and size of the button
		[button setTitle:@"Exit" forState:UIControlStateNormal];// set the text within the button
		[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal]; // color of the text
		 button.titleLabel.font = [UIFont systemFontOfSize:72]; // font size of the text
		[button.layer setCornerRadius:7.0f]; // set the croner radius of the button
		[button.layer setMasksToBounds:YES];
		[button.layer setBorderWidth:5.0f]; // border width of the button
		[button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside]; // call action when the button is pressed 
		[self.view addSubview:button]; // add the button to the view
		[self.view addSubview:endLabel1]; // add the text field of the total score to the view
		[self.view addSubview:endLabel2];
		//[self.view addSubview:endLabel3];
		
	}	
	
	if (sequence ==9) {
		if (i>9) {
			endLabel1.text = [NSString stringWithFormat:@"GREAT JOB!!!\n"]; // I create a textfield for showing the GREAT JOB at the end of the trial
			endLabel2.text = [NSString stringWithFormat:@"You burst %d bubbles\n", Score]; // I create a textfield for showing the total score at the end of the trial
			
			
			// Create the frame positon and size for the imageView which shows the congratulation image 
			image3 = [UIImage imageNamed: @"congrat.jpg" ]; // set the congratulation image to the imageView frame
			clappingAnimation = [[UIImageView alloc ]initWithImage:image3]; // set the congratulation image to the imageView frame
			CGRect rect3 = clappingAnimation.frame; 
			CGSize size3 = CGSizeMake(740, 300); //  create the size of the frame
			rect3.size = size3;
			clappingAnimation.frame = rect3;
			[self.view addSubview:clappingAnimation];
			clappingAnimation.center=CGPointMake(384,280); // create the position of the frame
			[self.view addSubview:clappingAnimation]; // add the congratulation imageView to the view
			
			
			[clappingSound play]; // play the clapping sound
			
			
			
			// set the button to exito from the application
			button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
			button.frame = CGRectMake(184, 820, 400, 200); // position and size of the button
			[button setTitle:@"Exit" forState:UIControlStateNormal];// set the text within the button
			[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal]; // color of the text
			button.titleLabel.font = [UIFont systemFontOfSize:72]; // font size of the text
			[button.layer setCornerRadius:7.0f]; // set the croner radius of the button
			[button.layer setMasksToBounds:YES];
			[button.layer setBorderWidth:5.0f]; // border width of the button
			[button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside]; // call action when the button is pressed 
			[self.view addSubview:button]; // add the button to the view
			[self.view addSubview:endLabel1]; // add the text field of the total score to the view
			[self.view addSubview:endLabel2];
			
		}
	}
	
}



// Create method to create the cue for the planning Fitts' law mode
-(void)cue
{
	
	self = [super init];
	
	
	///////////////////////////////////////////
	// CUE SEQUENCE 1////
	///////////////////////////////////////////	
   if(sequence == 1){	
	
	
	// Arrays for the order of cues position. P.S. They are same of the "target method"
	   //Sequence right hand
	   int xposition_array[46]={Bx,Cx,Gx,Cx,Fx,Bx,Hx,Gx,Cx,Ax,Dx,Bx,Hx,Dx,Gx,Cx,Ix,Gx,Cx,Ax,Cx,Gx,Ex,Ax,Bx,Cx,Gx,Ax,Gx,Cx,Ex,Hx,Ix,Gx,Ix,Fx,Cx,Gx,Ex,Bx,Hx,Ix,Ax,Dx,Gx,Ax};   // array for the x position of the target 
	   int yposition_array[46]={By,Cy,Gy,Cy,Fy,By,Hy,Gy,Cy,Ay,Dy,By,Hy,Dy,Gy,Cy,Iy,Gy,Cy,Ay,Cy,Gy,Ey,Ay,By,Cy,Gy,Ay,Gy,Cy,Ey,Hy,Iy,Gy,Iy,Fy,Cy,Gy,Ey,By,Hy,Iy,Ay,Dy,Gy,Ay};	// array for the y position of the target		
	   //
	   //Sequence left hand
	   //int xposition_array[46]={Bx,Ax,Ix,Ax,Dx,Bx,Hx,Ix,Ax,Cx,Fx,Bx,Hx,Fx,Ix,Ax,Gx,Ix,Ax,Cx,Ax,Ix,Ex,Cx,Bx,Ax,Ix,Cx,Ix,Ax,Ex,Hx,Gx,Ix,Gx,Dx,Ax,Ix,Ex,Bx,Hx,Gx,Cx,Fx,Ix,Cx}; // array for the x position of the target 
	   //int yposition_array[46]={By,Ay,Iy,Ay,Dy,By,Hy,Iy,Ay,Cy,Fy,By,Hy,Fy,Iy,Ay,Gy,Iy,Ay,Cy,Ay,Iy,Ey,Cy,By,Ay,Iy,Cy,Iy,Ay,Ey,Hy,Gy,Iy,Gy,Dy,Ay,Iy,Ey,By,Hy,Gy,Cy,Fy,Iy,Cy}; // array for the y position of the target
	   
	// Set the cue frame, image, size and positions
	image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
	imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
	
	CGRect rect2 = imageView2.frame; 
	CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
	rect2.size = size2;
	imageView2.frame = rect2;
	[self.view insertSubview:imageView2 atIndex:0];
	imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	///////////////////////////////////////////
	// CUE SEQUENCE 2////
	///////////////////////////////////////////	
  
	else if (sequence == 2){
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[46]={Fx,Cx,Ix,Ax,Dx,Gx,Cx,Ax,Bx,Ex,Cx,Ax,Bx,Cx,Ax,Bx,Ax,Cx,Gx,Dx,Fx,Ex,Fx,Dx,Bx,Ex,Cx,Ix,Cx,Ix,Gx,Cx,Ex,Ax,Gx,Ix,Ax,Gx,Ex,Cx,Ix,Hx,Ex,Cx,Ix,Hx};   // array for the x position of the target 
		int yposition_array[46]={Fy,Cy,Iy,Ay,Dy,Gy,Cy,Ay,By,Ey,Cy,Ay,By,Cy,Ay,By,Ay,Cy,Gy,Dy,Fy,Ey,Fy,Dy,By,Ey,Cy,Iy,Cy,Iy,Gy,Cy,Ey,Ay,Gy,Iy,Ay,Gy,Ey,Cy,Iy,Hy,Ey,Cy,Iy,Hy};	// array for the y position of the target
		//
		// Sequence left hand
		//int xposition_array[46]={Dx,Ax,Gx,Cx,Fx,Ix,Ax,Cx,Bx,Ex,Ax,Cx,Bx,Ax,Cx,Bx,Cx,Ax,Ix,Fx,Dx,Ex,Dx,Fx,Bx,Ex,Ax,Gx,Ax,Gx,Ix,Ax,Ex,Cx,Ix,Gx,Cx,Ix,Ex,Ax,Gx,Hx,Ex,Ax,Gx,Hx};   // array for the x position of the target
		//int yposition_array[46]={Dy,Ay,Gy,Cy,Fy,Iy,Ay,Cy,By,Ey,Ay,Cy,By,Ay,Cy,By,Cy,Ay,Iy,Fy,Dy,Ey,Dy,Fy,By,Ey,Ay,Gy,Ay,Gy,Iy,Ay,Ey,Cy,Iy,Gy,Cy,Iy,Ey,Ay,Gy,Hy,Ey,Ay,Gy,Hy};   // array for the y position of the target
		
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	///////////////////////////////////////////
	// CUE SEQUENCE 3////
	///////////////////////////////////////////
	
	if(sequence == 3){
		
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[46]={Cx,Ex,Dx,Ax,Dx,Gx,Cx,Ix,Ex,Hx,Ix,Gx,Dx,Fx,Dx,Bx,Cx,Fx,Hx,Gx,Cx,Ax,Bx,Cx,Gx,Ix,Ax,Gx,Ex,Cx,Gx,Hx,Ix,Cx,Ax,Dx,Fx,Ex,Cx,Gx,Ix,Ax,Cx,Ix,Ex,Hx};   // array for the x position of the target 
		int yposition_array[46]={Cy,Ey,Dy,Ay,Dy,Gy,Cy,Iy,Ey,Hy,Iy,Gy,Dy,Fy,Dy,By,Cy,Fy,Hy,Gy,Cy,Ay,By,Cy,Gy,Iy,Ay,Gy,Ey,Cy,Gy,Hy,Iy,Cy,Ay,Dy,Fy,Ey,Cy,Gy,Iy,Ay,Cy,Iy,Ey,Hy};	// array for the y position of the target
		//
		//Sequence left hand
		//int xposition_array[46]={Ax,Ex,Fx,Cx,Fx,Ix,Ax,Gx,Ex,Hx,Gx,Ix,Fx,Dx,Fx,Bx,Ax,Dx,Hx,Ix,Ax,Cx,Bx,Ax,Ix,Gx,Cx,Ix,Ex,Ax,Ix,Hx,Gx,Ax,Cx,Fx,Dx,Ex,Ax,Ix,Gx,Cx,Ax,Gx,Ex,Hx};   // array for the x position of the target
		//int yposition_array[46]={Ay,Ey,Fy,Cy,Fy,Iy,Ay,Gy,Ey,Hy,Gy,Iy,Fy,Dy,Fy,By,Ay,Dy,Hy,Iy,Ay,Cy,By,Ay,Iy,Gy,Cy,Iy,Ey,Ay,Iy,Hy,Gy,Ay,Cy,Fy,Dy,Ey,Ay,Iy,Gy,Cy,Ay,Gy,Ey,Hy};   // array for the y position of the target
		
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	///////////////////////////////////////////
	// CUE SEQUENCE 4////
	///////////////////////////////////////////

	if(sequence == 4){
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[46]={Hx,Ix,Ax,Gx,Ex,Fx,Dx,Ax,Bx,Hx,Fx,Cx,Gx,Cx,Ix,Hx,Bx,Ax,Gx,Ix,Cx,Ex,Fx,Dx,Bx,Hx,Bx,Ex,Cx,Ax,Cx,Gx,Ix,Ax,Gx,Cx,Ex,Gx,Ax,Gx,Cx,Fx,Ix,Ax,Dx,Gx};   // array for the x position of the target 
		int yposition_array[46]={Hy,Iy,Ay,Gy,Ey,Fy,Dy,Ay,By,Hy,Fy,Cy,Gy,Cy,Iy,Hy,By,Ay,Gy,Iy,Cy,Ey,Fy,Dy,By,Hy,By,Ey,Cy,Ay,Cy,Gy,Iy,Ay,Gy,Cy,Ey,Gy,Ay,Gy,Cy,Fy,Iy,Ay,Dy,Gy};	// array for the y position of the target
		//
		//Sequence left hand
		//int xposition_array[46]={Dx,Gx,Cx,Ix,Ex,Dx,Fx,Cx,Bx,Hx,Dx,Ax,Ix,Ax,Gx,Hx,Bx,Cx,Ix,Gx,Ax,Ex,Dx,Fx,Bx,Hx,Bx,Ex,Ax,Cx,Ax,Ix,Gx,Cx,Ix,Ax,Ex,Ix,Cx,Ix,Ax,Dx,Gx,Cx,Fx,Ix};	// array for the x position of the target
		//int yposition_array[46]={Dy,Gy,Cy,Iy,Ey,Dy,Fy,Cy,By,Hy,Dy,Ay,Iy,Ay,Gy,Hy,By,Cy,Iy,Gy,Ay,Ey,Dy,Fy,By,Hy,By,Ey,Ay,Cy,Ay,Iy,Gy,Cy,Iy,Ay,Ey,Iy,Cy,Iy,Ay,Dy,Gy,Cy,Fy,Iy};	// array for the y position of the target
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	
	///////////////////////////////////////////
	// CUE SEQUENCE 5////
	///////////////////////////////////////////
	
	if(sequence == 5){
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[46]={Gx,Ex,Ax,Gx,Hx,Ex,Cx,Ax,Cx,Bx,Dx,Gx,Cx,Ex,Dx,Fx,Ix,Cx,Ix,Gx,Cx,Ax,Bx,Cx,Ex,Ax,Bx,Hx,Ix,Gx,Cx,Gx,Hx,Bx,Dx,Gx,Ax,Cx,Gx,Ix,Ex,Fx,Cx,Gx,Ax,Cx};   // array for the x position of the target 
		int yposition_array[46]={Gy,Ey,Ay,Gy,Hy,Ey,Cy,Ay,Cy,By,Dy,Gy,Cy,Ey,Dy,Fy,Iy,Cy,Iy,Gy,Cy,Ay,By,Cy,Ey,Ay,By,Hy,Iy,Gy,Cy,Gy,Hy,By,Dy,Gy,Ay,Cy,Gy,Iy,Ey,Fy,Cy,Gy,Ay,Cy};	// array for the y position of the target
		//
		//int xposition_array[46]={Ix,Ex,Cx,Ix,Hx,Ex,Ax,Cx,Ax,Bx,Fx,Ix,Ax,Ex,Fx,Dx,Gx,Ax,Gx,Ix,Ax,Cx,Bx,Ax,Ex,Cx,Bx,Hx,Gx,Ix,Ax,Ix,Hx,Bx,Fx,Ix,Cx,Ax,Ix,Gx,Ex,Dx,Ax,Ix,Cx,Ax};	// array for the x position of the target
		//int yposition_array[46]={Iy,Ey,Cy,Iy,Hy,Ey,Ay,Cy,Ay,By,Fy,Iy,Ay,Ey,Fy,Dy,Gy,Ay,Gy,Iy,Ay,Cy,By,Ay,Ey,Cy,By,Hy,Gy,Iy,Ay,Iy,Hy,By,Fy,Iy,Cy,Ay,Iy,Gy,Ey,Dy,Ay,Iy,Cy,Ay};	// array for the y position of the target
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	
	///////////////////////////////////////////
	// CUE SEQUENCE 6////
	///////////////////////////////////////////
	
	if(sequence == 6){
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[46]={Gx,Ix,Fx,Dx,Gx,Cx,Ix,Ax,Gx,Cx,Gx,Hx,Bx,Ex,Cx,Ax,Dx,Fx,Ix,Ax,Gx,Ax,Bx,Ex,Gx,Cx,Ix,Fx,Bx,Cx,Ax,Dx,Bx,Ax,Gx,Dx,Fx,Dx,Bx,Cx,Gx,Dx,Bx,Cx,Ix,Ax};   // array for the x position of the target 
		int yposition_array[46]={Gy,Iy,Fy,Dy,Gy,Cy,Iy,Ay,Gy,Cy,Gy,Hy,By,Ey,Cy,Ay,Dy,Fy,Iy,Ay,Gy,Ay,By,Ey,Gy,Cy,Iy,Fy,By,Cy,Ay,Dy,By,Ay,Gy,Dy,Fy,Dy,By,Cy,Gy,Dy,By,Cy,Iy,Ay};	// array for the y position of the target
		//
		//int xposition_array[46]={Ax,Gx,Dx,Fx,Ix,Ax,Gx,Cx,Ix,Ax,Ix,Hx,Bx,Ex,Ax,Cx,Fx,Dx,Gx,Cx,Ix,Cx,Bx,Ex,Ix,Ax,Gx,Dx,Bx,Ax,Cx,Fx,Bx,Cx,Ix,Fx,Dx,Fx,Bx,Ax,Ix,Fx,Bx,Ax,Gx,Cx};   // array for the x position of the target
		//int yposition_array[46]={Ay,Gy,Dy,Fy,Iy,Ay,Gy,Cy,Iy,Ay,Iy,Hy,By,Ey,Ay,Cy,Fy,Dy,Gy,Cy,Iy,Cy,By,Ey,Iy,Ay,Gy,Dy,By,Ay,Cy,Fy,By,Cy,Iy,Fy,Dy,Fy,By,Ay,Iy,Fy,By,Ay,Gy,Cy};   // array for the y position of the target
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	
	///////////////////////////////////////////
	// CUE SEQUENCE 7////
	///////////////////////////////////////////
	
	if(sequence == 7){
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[46]={Gx,Dx,Ex,Cx,Gx,Ix,Fx,Cx,Ax,Gx,Ex,Bx,Hx,Ix,Ax,Gx,Cx,Ix,Ax,Gx,Ex,Fx,Dx,Ax,Cx,Gx,Ix,Ex,Fx,Bx,Ex,Cx,Bx,Dx,Fx,Ix,Ax,Bx,Dx,Ex,Bx,Ex,Cx,Bx,Cx,Fx};   // array for the x position of the target 
		int yposition_array[46]={Gy,Dy,Ey,Cy,Gy,Iy,Fy,Cy,Ay,Gy,Ey,By,Hy,Iy,Ay,Gy,Cy,Iy,Ay,Gy,Ey,Fy,Dy,Ay,Cy,Gy,Iy,Ey,Fy,By,Ey,Cy,By,Dy,Fy,Iy,Ay,By,Dy,Ey,By,Ey,Cy,By,Cy,Fy};	// array for the y position of the target
		//
		//Sequence left hand
		//int xposition_array[46]={Ix,Fx,Ex,Ax,Ix,Gx,Dx,Ax,Cx,Ix,Ex,Bx,Hx,Gx,Cx,Ix,Ax,Gx,Cx,Ix,Ex,Dx,Fx,Cx,Ax,Ix,Gx,Ex,Dx,Bx,Ex,Ax,Bx,Fx,Dx,Gx,Cx,Bx,Fx,Ex,Bx,Ex,Ax,Bx,Ax,Dx};   // array for the x position of the target
		//int yposition_array[46]={Iy,Fy,Ey,Ay,Iy,Gy,Dy,Ay,Cy,Iy,Ey,By,Hy,Gy,Cy,Iy,Ay,Gy,Cy,Iy,Ey,Dy,Fy,Cy,Ay,Iy,Gy,Ey,Dy,By,Ey,Ay,By,Fy,Dy,Gy,Cy,By,Fy,Ey,By,Ey,Ay,By,Ay,Dy};   // array for the y position of the target
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	
	
	
	///////////////////////////////////////////
	// CUE SEQUENCE 8////
	///////////////////////////////////////////
	
	if(sequence == 8){
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[46]={Hx,Ix,Gx,Ix,Hx,Bx,Hx,Fx,Dx,Gx,Cx,Fx,Dx,Fx,Hx,Ex,Ax,Cx,Ex,Hx,Bx,Hx,Gx,Cx,Gx,Cx,Ax,Gx,Ix,Cx,Gx,Ix,Ax,Gx,Hx,Bx,Hx,Gx,Cx,Ex,Ax,Gx,Cx,Gx,Hx,Gx};   // array for the x position of the target 
		int yposition_array[46]={Hy,Iy,Gy,Iy,Hy,By,Hy,Fy,Dy,Gy,Cy,Fy,Dy,Fy,Hy,Ey,Ay,Cy,Ey,Hy,By,Hy,Gy,Cy,Gy,Cy,Ay,Gy,Iy,Cy,Gy,Iy,Ay,Gy,Hy,By,Hy,Gy,Cy,Ey,Ay,Gy,Cy,Gy,Hy,Gy};	// array for the y position of the target
		//
		//Sequence left hand
		//int xposition_array[46]={Ax,Gx,Ix,Gx,Hx,Bx,Hx,Dx,Fx,Ix,Ax,Dx,Fx,Dx,Hx,Ex,Cx,Ax,Ex,Hx,Bx,Hx,Ix,Ax,Ix,Ax,Cx,Ix,Gx,Ax,Ix,Gx,Cx,Ix,Hx,Bx,Hx,Ix,Ax,Ex,Cx,Ix,Ax,Ix,Hx,Ix};   // array for the x position of the target
		//int yposition_array[46]={Ay,Gy,Iy,Gy,Hy,By,Hy,Dy,Fy,Iy,Ay,Dy,Fy,Dy,Hy,Ey,Cy,Ay,Ey,Hy,By,Hy,Iy,Ay,Iy,Ay,Cy,Iy,Gy,Ay,Iy,Gy,Cy,Iy,Hy,By,Hy,Iy,Ay,Ey,Cy,Iy,Ay,Iy,Hy,Iy};   // array for the y position of the target
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
	}
	
	
	

	///////////////////////////////////////////
	// CUE SEQUENCE9////
	///////////////////////////////////////////

	if(sequence == 9){	
		
		// Arrays for the order of cues position. P.S. They are same of the "target method"
		//Sequence right hand
		int xposition_array[9]={Ax,Bx,Cx,Ex,Gx,Hx,Ix,Fx,Dx};   // array for the x position of the target 
		int yposition_array[9]={Ay,By,Cy,Ey,Gy,Hy,Iy,Fy,Dy};   // Set the cue frame, image, size and positions
		//
		//Sequence left hand
		//int xposition_array[9]={Cx,Bx,Ax,Ex,Ix,Hx,Gx,Dx,Fx};   // array for the x position of the target
		//int yposition_array[9]={Cy,By,Ay,Ey,Iy,Hy,Gy,Dy,Fy};   // array for the y position of the target
		
		
		// Set the cue frame, image, size and positions
		image2 = [UIImage imageNamed: @"cross.jpg" ]; // set the image of the cue imageView
		imageView2 = [[UIImageView alloc ]initWithImage:image2]; // set the image of the cue imageView
		
		
		CGRect rect2 = imageView2.frame; 
		CGSize size2 = CGSizeMake(210,210); // set the size of the cue imageView
		rect2.size = size2;
		imageView2.frame = rect2;
		[self.view insertSubview:imageView2 atIndex:0];
		imageView2.center=CGPointMake(xposition_array[i],yposition_array[i]); //set the positions of the cue imageView. P.S. Note, they are the same of the target positions array order
		
		
		
	}
	
	
}

	
// Method to remove the target after the next one is has been appearead	
-(void)removeTarget
{
	[imageView removeFromSuperview];
	[targetSound stop];
}


// Method to remove the cue (in the NO PLANNIG mode) after it has appearead (see the delay3)
-(void)removeCue
{
	[imageView2 removeFromSuperview];	
}

// Method to remove the cue (in the NO PLANNIG mode) after it has appearead (see the delay3)
-(void)removeCue2
{
	[imageView2 removeFromSuperview];	
}

// Method to get the time when the target is pressed
-(void)targetPressedEvent
{
	targetPressed = CFAbsoluteTimeGetCurrent();
	//printf("target pressed is %f\n", targetPressed);

}




// Method for the touch pressed event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	
	self = [super init];
	
	touchPressed = [touches anyObject];
	pointPressed = [touchPressed locationInView:self.view];
	
	xPosition = pointPressed.x; // get the location in X of touch event
	yPosition = pointPressed.y; // get the location in Y of touch event 
	
	

	// call the method to get the time of touching the screen
	[self targetPressedEvent]; 
	
	// code for the events "in case" the touch event is into the target
	if (CGRectContainsPoint([imageView frame], pointPressed))
	{	 		
		
		
		[targetSound play]; // play the target pressed sound
		targetSound.numberOfLoops = -2;
		
		Successful =1;
		
		
		imageView.image = [UIImage imageNamed:@"bubbles2.jpg"]; // replace the image of the target image view
				
		if (M == 1) {
			if (i <1){
				imageView.image = [UIImage imageNamed:@"planstartbutton2.jpg"];
			}
			else {
				imageView.image = [UIImage imageNamed:@"bubbles2.jpg"];
			}
			
		}
		
		
		//printf("Target pressed at %f\n", targetPressed);
		
		// Compute the movement time
		movTime = targetPressed - targetReleased;
		//printf(" MT is %f\n", movTime);
		
		// In case the movement time is longer than 20, it is set to 0 (P.S. text field problem for the first target pressing)
		if (movTime > 20) { 
			movTime = 0;
		}
		
		
		// compute the score related to the movement time (Pv)
		if (movTime == 0){
			Pv = 0;}
		else if (movTime <= 0.25) {
			Pv = 10;}
		else if (movTime <= 0.278){
			Pv = 9;}
		else if (movTime <= 0.313){
			Pv = 8;}
		else if (movTime <= 0.357){
			Pv = 7;}
		else if (movTime <= 0.417){
			Pv = 6;}
		else if (movTime <= 0.5){
			Pv = 5;}
		else if (movTime <= 0.625){
			Pv = 4;}
		else if (movTime <= 0.833){
			Pv = 3;}
		else if (movTime <= 1.25){
			Pv = 2;}
		else if (movTime > 1.25){
			Pv = 1;}
		
		// compute the score related to the ID performed (Pid)
		if (ID<=3.1) {
			Pid = 3;}
		else if (ID<= 4.1){
			Pid = 4;}
		else if (ID > 4.1){
			Pid = 5;}
		scoreLabel.textColor = [UIColor blackColor];
	}
	
	// In case the target is missed (touch event outside of the target-imageView)
	else {
		movTime = targetPressed - targetReleased; // the movement time is computed anyway
		Successful =0;
		//spiderKilled = spiderKilled-1;
		
		if (cost == 10) {
			Pv = 0; // Pv is set to 0 (zero)
			scoreLabel.textColor = [UIColor blackColor];
		}
		
		else if (cost == 11){
						
			Pv = -30;
			scoreLabel.textColor = [UIColor redColor];
			Pid = 1;
			[bassoSound play]; // another sound is played
		}
		
		
	}
	
	// Compute the total score (considering both Pv & Pid)
	Score = (Pv*Pid) + Score;
	scoreL = Pv*Pid;
	
	scoreLabel.text = [NSString stringWithFormat:@" %d bubbles", scoreL];
	
	//if (M ==1) {
	if (i==1) {
		Score =0;
		scoreLabel.text = [NSString stringWithFormat:@" "];}
	
	
	
	// codes to run the targets and cues appearance with the related delays
	
	if (M ==1) {
		
		[self performSelector:@selector(removeCue) withObject:nil afterDelay:delay2];
		
		
		[self performSelector:@selector(cue) withObject:nil afterDelay:delay2];
		
		
		[self performSelector:@selector(removeCue) withObject:nil afterDelay:delay3];}
	
	
	
	[self performSelector:@selector(removeTarget) withObject:nil afterDelay:delay];
	
	
	[self performSelector:@selector(target) withObject:nil afterDelay:delay];
		
}


// Method to get the time when the target is released
-(void)targetReleasedEvent
{
	targetReleased= CFAbsoluteTimeGetCurrent();
	//printf("target released is %f\n", targetReleased);
}


// Method for the touch released event and code to save the variables on the text file
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

	
	
	touchReleased = [touches anyObject];	
	pointReleased = [touchReleased locationInView:self.view];
	
	
	
	[super touchesEnded:touches withEvent: event];
	
	xDiffPressRel = pointPressed.x - pointReleased.x;
	yDiffPressRel = pointPressed.y - pointReleased.y;
	
	
	if(xDiffPressRel<20, yDiffPressRel<20)
		
	{
		[self targetReleasedEvent];
		
		difference=targetReleased - targetPressed; 
		//printf("difference is %f\n",difference);
		
		
		//printf("target released at %f\n", targetReleased);
		reactionTime = targetReleased - timeImageView;
		
		if (difference <delay) {
			tooEarlyIndex = 1;
			
			[self tooFast];}
		
	}
	
	
	else if(xDiffPressRel>20, yDiffPressRel>20)
		
	{
		[self targetReleasedEvent];
		
		//printf("target released at %f\n", targetReleased);
		reactionTime = targetReleased - timeImageView;
		
		
		if (difference <delay) {
			
			tooEarlyIndex = 1;
			
			
			[self tooFast];}
			
		
	}
	

	imageView.image = [UIImage imageNamed:@"bubbles.jpg"];
	
	
	string = [[NSMutableString alloc] init];
	[string appendFormat:@"%d %d %f %d %d %d %d %d %f %f %d\n", Successful, tooEarlyIndex, reactionTime, xTarget, xPosition, yTarget, yPosition, targetSize, ID, movTime, Score];
	printf("%s\n", [string UTF8String]);

	data = [string dataUsingEncoding:NSUTF8StringEncoding];

	paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	documentsDirectory = [paths objectAtIndex:0];
	
	if (planIndex ==0 /*NO plan*/) {
		fileName  = [NSString stringWithFormat:@"subj%d_nooplan_cost%d_seq%d_%d.txt",subjID,cost,sequence,i];}
	
	
	else if (planIndex ==1 /*YES plan*/) {
			fileName  = [NSString stringWithFormat:@"subj%d_yesplan_cost%d_seq%d_%d.txt",subjID,cost,sequence,i];}
	
			 
	documentsDirectory = [documentsDirectory stringByAppendingPathComponent:fileName];
	
	[data writeToFile:documentsDirectory atomically:YES];
	
}


-(void)tooFast{
	
	
	[targetSound stop];
	
	string = [[NSMutableString alloc] init];
	[string appendFormat:@"%d %d %f %d %d %d %d %d %f %f %d\n", Successful, tooEarlyIndex, reactionTime, xTarget, xPosition, yTarget, yPosition, targetSize, ID, movTime, Score];
	printf("%s\n", [string UTF8String]);
	
	data = [string dataUsingEncoding:NSUTF8StringEncoding];
	
	paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	documentsDirectory = [paths objectAtIndex:0];
	
	if (planIndex ==0 /*NO plan*/) {
		fileName  = [NSString stringWithFormat:@"subj%d_nooplan_cost%d_seq%d_%d.txt",subjID,cost,sequence,i];}
	
	
	else if (planIndex ==1 /*YES plan*/) {
		fileName  = [NSString stringWithFormat:@"subj%d_yesplan_cost%d_seq%d_%d.txt",subjID,cost,sequence,i];}
	
	
	documentsDirectory = [documentsDirectory stringByAppendingPathComponent:fileName];
	
	[data writeToFile:documentsDirectory atomically:YES];
	
	
	button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(5, 53, 758, 966); // position and size of the button
	UIImage *ImageTooEarly = [UIImage imageNamed:@"tooearly.jpg"];
	UIImage *stretchableButtonImage = [ImageTooEarly stretchableImageWithLeftCapWidth:0 topCapHeight:0]; 
	[button setBackgroundImage:stretchableButtonImage forState:UIControlStateNormal];
	
	[button.layer setCornerRadius:7.0f]; // set the croner radius of the button
	[button.layer setMasksToBounds:YES];
	[button.layer setBorderWidth:5.0f]; // border width of the button
	//[button addTarget:self action:@selector(removeButton) forControlEvents:UIControlEventTouchUpInside]; // call action when the button is pressed 
	
	
	
	button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button2.frame = CGRectMake(10, 58, 150, 100); // position and size of the button
	[button2 setTitle:@"Resume" forState:UIControlStateNormal];// set the text within the button
	[button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal]; // color of the text
	button2.titleLabel.font = [UIFont systemFontOfSize:30]; // font size of the text
	[button2.layer setCornerRadius:7.0f]; // set the croner radius of the button
	[button2.layer setMasksToBounds:YES];
	[button2.layer setBorderWidth:2.0f]; // border width of the button
	[button2 addTarget:self action:@selector(removeButton) forControlEvents:UIControlEventTouchUpInside]; // call action when the button is pressed
	[self.view insertSubview:button atIndex:1];
	//[self.view addSubview:button];
	[self.view addSubview:button2];

	
	
	
}

-(void)removeButton{
	[button removeFromSuperview];
	[button2 removeFromSuperview];
	
	tooEarlyIndex =0;
}



// Method for the action of the exit button (exit from the application)
-(void)buttonAction
{
	exit(0);
}

- (IBAction) Exit: (id) sender
{	
	exit(0);
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	//self.imageView = nil;
}


- (void)dealloc {
	[imageView release];
	[imageView2 release];
	[clappingAnimation release];
	[image release];
	[image2 release];
	[image3 release];
	[image4 release];
	[button release];
	[button2 release];
	[scoreLabel release];
	[subjIDTextField release];
	[costTextField release];
	[sequenceTextField release];
	[targetSound release];
	[bassoSound release];
	[clappingSound release];
	[endLabel1 release];
	[endLabel2 release];
	[touchPressed release];
	[touchReleased release];
	
    [super dealloc];
}

@end
