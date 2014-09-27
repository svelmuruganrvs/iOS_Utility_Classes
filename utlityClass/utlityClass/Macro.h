//
//  Macro.h
//  CookApp
//
//  Created by EverestIndia on 07/08/14.
//  Copyright (c) 2014 EverestIndia. All rights reserved.
//

#ifndef CookApp_Macro_h
#define CookApp_Macro_h

#define isIPhone        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define isIPad          ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define isiPhone4       ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
#define isiPhone3_5     ([[UIScreen mainScreen] bounds].size.height == 480)?TRUE:FALSE

#define TRANSPERENT_VIEW_ALPHA .5
#define PROJECT_THEEM_COLOR [UIColor colorWithRed:120.0/255.0 green:210.0/255.0 blue:210.0/255.0 alpha:1]

///Example Code :
///--=-=-=-=-=-=-
///  CGAffineTransform transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0.-45));
///_lbl_scoreValue.transform = transform;
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

#define MYSYSTEM_DATE_FORMAT    @"cccc, MMM d, hh:mm aa"


// DLog will output like NSLog only when the DEBUG variable is set

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#endif
