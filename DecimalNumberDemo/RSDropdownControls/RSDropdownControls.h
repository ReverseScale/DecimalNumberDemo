//
//  RSDropdownControls.h
//  RSDropdownControlsDemo
//
//  Created by WhatsXie on 2017/7/11.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSDropdownControls;
@protocol RSDropdownControlsDelegate <NSObject>
@required
- (void)downSelectedView:(RSDropdownControls *)selectedView didSelectedAtIndex:(NSIndexPath *)indexPath;
@end

@interface RSDropdownControls : UIView
@property (nonatomic, copy, readonly) NSString *text;
// Delegate
@property (nonatomic, weak) id <RSDropdownControlsDelegate> delegate;

// Data
@property (nonatomic, strong) NSArray<NSString *> *listArray;

// Preferences（Optional）
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, assign) NSInteger maxDropdownCount; // 最大展示列表行数

// Function
- (void)show;
- (void)close;

@end
