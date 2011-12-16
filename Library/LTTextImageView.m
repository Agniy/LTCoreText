//
//  LTTextImageView.m
//  LTCoreText
//
//  Created by ito on H.23/08/04.
//  Copyright 平成23年 __MyCompanyName__. All rights reserved.
//

#import "LTTextImageView.h"

const NSUInteger kLTTextImageViewOverlayViewTag = 0x10;

@implementation LTTextImageView

@synthesize attachment;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.userInteractionEnabled = YES;
		
		UIView* overlayView = [[UIView alloc] initWithFrame:frame];
		overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
		overlayView.tag = kLTTextImageViewOverlayViewTag;
		[self addSubview:overlayView];
		
		UITapGestureRecognizer* tapgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapped:)];
		[overlayView addGestureRecognizer:tapgr];
		
		[tapgr release];
		[overlayView release];
    }
    return self;
}

- (void)_setHighlightedOff
{
	UIView* overlayView = [self viewWithTag:kLTTextImageViewOverlayViewTag];
	overlayView.backgroundColor = [UIColor clearColor];
}

- (void)_tapped:(UITapGestureRecognizer*)gr
{
	dispatch_async(dispatch_get_main_queue(), ^(void) {
		UIView* overlayView = [self viewWithTag:kLTTextImageViewOverlayViewTag];
		overlayView.backgroundColor = [UIColor colorWithWhite:0.05 alpha:0.5];
	});
	
	[self performSelector:@selector(_setHighlightedOff) withObject:nil afterDelay:0.25];
	
	[[UIApplication sharedApplication] sendAction:@selector(lt_imageSelected:) to:nil from:self forEvent:nil];
}

-(UITapGestureRecognizer *)tapGesture
{
	UIView* overlayView = [self viewWithTag:kLTTextImageViewOverlayViewTag];
	return overlayView.gestureRecognizers.lastObject;
}

-(void)layoutSubviews
{
	[super layoutSubviews];
	
	UIView* overlayView = [self viewWithTag:kLTTextImageViewOverlayViewTag];
	overlayView.frame = self.bounds;
}

- (void)dealloc
{
	LTTextMethodDebugLog();
    self.attachment = nil;
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
