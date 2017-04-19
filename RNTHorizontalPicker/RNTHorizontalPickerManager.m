//
//  RNTHorizontalPickerManager.m
//  RNTHorizontalPicker
//
//  Created by K Vineetha on 4/5/17.
//  Copyright © 2017 MDL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RNTHorizontalPickerManager.h"
#import "RNTHorizontalPicker.h"
#import <UIKit/UIKit.h>

@implementation RNTHorizontalPickerManager

RCT_EXPORT_MODULE();

RCT_EXPORT_VIEW_PROPERTY(titles, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(selectedIndex, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(fontSize, NSInteger)


- (UIView *)view
{
  
  RNTHorizontalPicker *theView;
  theView = [[RNTHorizontalPicker alloc] initWithFrame: CGRectMake(0, 0, 100, 100)];
  return theView;
}

@end
