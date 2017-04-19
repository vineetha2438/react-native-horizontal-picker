//
//  RNTHorizontalPicker.m
//  RNTHorizontalPicker
//
//  Created by K Vineetha on 4/5/17.
//  Copyright © 2017 MDL. All rights reserved.
//

#import "RNTHorizontalPicker.h"

#import "AKPickerView.h"
#import <React/RCTComponent.h>

@interface RNTHorizontalPicker () <AKPickerViewDataSource, AKPickerViewDelegate>
@property (nonatomic, strong) AKPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, copy) RCTBubblingEventBlock onChange;
@property (nonatomic, assign) NSInteger selectedIndex;
@end

@implementation RNTHorizontalPicker

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  self.pickerView = [[AKPickerView alloc] initWithFrame:self.bounds];
  self.pickerView.delegate = self;
  self.pickerView.dataSource = self;
  self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self addSubview:self.pickerView];
  
  self.pickerView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:60];
  self.pickerView.highlightedFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:70];
  self.pickerView.interitemSpacing = 6.0;
  self.pickerView.fisheyeFactor = 0.001;
  self.pickerView.pickerViewStyle = AKPickerViewStyle3D;
  self.pickerView.maskDisabled = false;
  return self;
}

#pragma mark - AKPickerViewDataSource

- (void)setTitles:(NSArray *)titles
{
  _titles = [NSMutableArray arrayWithArray:titles];
  [_pickerView reloadData];
}


- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
  return [self.titles count];
}

/*
 * AKPickerView now support images!
 *
 * Please comment '-pickerView:titleForItem:' entirely
 * and uncomment '-pickerView:imageForItem:' to see how it works.
 *
 */

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
  return self.titles[item];
}

/*
 - (UIImage *)pickerView:(AKPickerView *)pickerView imageForItem:(NSInteger)item
 {
	return [UIImage imageNamed:self.titles[item]];
 }
 */

#pragma mark - AKPickerViewDelegate

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
  if (_onChange) {
    _onChange(@{
      @"newIndex": @(item),
    });
  }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
  _selectedIndex = selectedIndex;
  [_pickerView reloadData];
  [_pickerView selectItem:_selectedIndex animated:true];
}


/*
 * Label Customization
 *
 * You can customize labels by their any properties (except font,)
 * and margin around text.
 * These methods are optional, and ignored when using images.
 *
 */

/*
 - (void)pickerView:(AKPickerView *)pickerView configureLabel:(UILabel *const)label forItem:(NSInteger)item
 {
	label.textColor = [UIColor lightGrayColor];
	label.highlightedTextColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor colorWithHue:(float)item/(float)self.titles.count
 saturation:1.0
 brightness:1.0
 alpha:1.0];
 }
 */

/*
 - (CGSize)pickerView:(AKPickerView *)pickerView marginForItem:(NSInteger)item
 {
	return CGSizeMake(40, 20);
 }
 */

#pragma mark - UIScrollViewDelegate

/*
 * AKPickerViewDelegate inherits UIScrollViewDelegate.
 * You can use UIScrollViewDelegate methods
 * by simply setting pickerView's delegate.
 *
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  // Too noisy...
  // NSLog(@"%f", scrollView.contentOffset.x);
}

@end
