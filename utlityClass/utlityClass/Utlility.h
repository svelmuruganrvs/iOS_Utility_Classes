//
//  Utlility.h
//  CookApp
//
//  Created by EverestIndia on 07/08/14.
//  Copyright (c) 2014 EverestIndia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>



@interface Utlility : NSObject
/*!
 Convert View to Image
 
 @param view View to convert to image.
 
 @return UIImage Return the image that converted from view.
 */
+ (UIImage *) imageWithView:(UIView *)view;

/*!
Get the Image for my tabbar Background image According to the Size of the Phone.
 @return Return Black collered Image for the TabBar Size.
 */
+(UIImage *)getMyTabBarBackgroungImage;
/*!
 Get the proper xib name accoring to this project standerd(3.5 inch scree named as  filename,4 inch screen named as filename4 , ipad named as filenameiPad).
 @param nibname Nib name as 3.5 inch screen file name.
 @return String Nib name accroding to the project standerded will be return.
 */
+(NSString*)getMyProperXib:(NSString*)nibname;
/*!
 Get the proper xib name accoring to this project standerd(3.5 & 4 inch scree named as  filename,ipad named as filenameiPad) for Views.
 @param nibname Nib name as iphone file name.
 @return String Nib name accroding to the project standerded will be return.
 */
+(NSString*)getMyProperView:(NSString*)nibname;
/*!
 Get proper Xib for my custom Cell.
 @param nibname name of 3.5 inch screen nib name.
 @return String Return the proper xib cell accourding to the project standed for custom tabelviewcell.
 */
+(NSString*)getMyProperTableViewCellXib:(NSString*)nibname;
/*!
 Get hight of the custom tabelviewCell xib .
 @param nibname name of the customtabelviewcell height.
 @return floatvalue Return the height of the tabelview cell.
 */
+(float)getTableViewCellHeight:(NSString*)nibname;
/*!
 Get hight of the UIView xib .
 @param nibname name of the UIView height.
 @return floatvalue Return the height of the uiview cell.
 */
+(float)getViewHeight:(NSString*)nibname;
/*!
 Get width of the UIView xib .
 @param nibname name of the UIView width.
 @return floatvalue Return the width of the UIView.
 */
+(float)getViewWidth:(NSString*)nibname;
/*!
 Get width of the custom tabelviewCell xib .
 @param nibname name of the customtabelviewcell width.
 @return floatvalue Return the width of the tabelview cell.
 */
+(float)getTableViewCellWidth:(NSString*)nibname;
/*!
 Get the transperentView to my screen size.
 @return View Return the view of the screen size as transperent Black color.
 */
+(UIView*)getMyTransperentView;
/*!
 Check the Given string is null or not.
 @param stringObj String object as the parameter.
 @return bool Bool value is return True for null and False for Not null.
 */
+(BOOL)isNullString:(NSString*)stringObj;
/*!
 Get proper string form of the given string .
 @param stringObj String object to be convert to the proper string form.
 @return String @"" for null string and string is return for valued string.
 */
+(NSString*)getMyProperStringForm:(NSString*)stringObj;
/*!
 Check given object is null or not.
 @param object Which object to be check is passed here.
 @return Boolean Yes for null and No for Not null object.
 */
+(BOOL)isNullObject:(id)object;
/*!
 Get category name for this project.
 
 @return string the value of the string is return as at the index.
*/
+(NSString *)getCategoryNameAtIndex:(int)index;
/*!
 To get the proper begning of the url like as http:// in the given string.
 @param String url string to get proper form.
 @return Proper form of the string.
 */
+(NSString *)getProperURLBegning:(NSString*)string;

/*!
 Hide the scrollview Indicator for my ScrollView and Scrollview Children.
 @param scrollView Scrollview To hide the Indicator.
 */
+(void)hideTheScrollViewForMyScrollView:(UIScrollView *)scrollView;
/*!
 Show the activity indicator at the top of the status bar.
 */
+(void)showMyNetWorkActivityIndicator;
/*!
 Hide the activity indicator at the top of the status bar.
 */
+(void)hideMyNetWorkActivityIndicator;

/*!
 Get a unique number for that perticular device.
 */
+(NSString*)getmyUniqueNumber;
/*!
 Get app store link based on the app store ID.
 */
+(NSString*)getAppStoreLink;

///Is folder in the name
+(BOOL)isFolderInThatName:(NSString*)folderName;

///Create a folder if not exists.
+(BOOL)createFolderifNotExists:(NSString*)folderName;

///Get Path for my the foldername given. If not create and return.
+(NSString*)returnMyPathForThisFolder:(NSString*)folderName;

///save the image into the location.
+ (void)saveImage: (UIImage*)image withFileName:(NSString*)filename andPath:(NSString*)path;

///Save data into the file
+ (void)savedata: (NSData*)data withFileName:(NSString*)filename andPath:(NSString*)path;

///return the Image from the FilePath.
+ (UIImage*)loadImageFromPath:(NSString*)filePathAlongWithName;

///Resize the UImage into specific size.
+ (UIImage*)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
