//
//  Utlility.m
//  CookApp
//
//  Created by EverestIndia on 07/08/14.
//  Copyright (c) 2014 EverestIndia. All rights reserved.
//

#import "Utlility.h"

@implementation Utlility

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
+(NSString*)getMyProperXib:(NSString*)nibname
{
    if (isIPad)
        return [NSString stringWithFormat:@"%@iPad",nibname];
    else if(isiPhone4)
        return [NSString stringWithFormat:@"%@4",nibname];
    
    return nibname;
    
}
+(NSString*)getMyProperView:(NSString*)nibname
{
    if (isIPad)
        return [NSString stringWithFormat:@"%@iPad",nibname];
    return nibname;
}
+(float)getViewHeight:(NSString*)nibname
{
    UIView *view=[[NSBundle mainBundle]loadNibNamed:nibname owner:self options:kNilOptions][0];
    return view.frame.size.height;
}
+(float)getViewWidth:(NSString*)nibname
{
    UIView *view=[[NSBundle mainBundle]loadNibNamed:nibname owner:self options:kNilOptions][0];
    return view.frame.size.width;
}
+(UIImage *)getMyTabBarBackgroungImage
{
    UIView *backgroundView=[[UIView alloc] init];
    backgroundView.backgroundColor=[UIColor blackColor];
    
    if (isIPad)
        backgroundView.frame=CGRectMake(0, 0, 768, 56);
    else if(isiPhone4)
         backgroundView.frame=CGRectMake(0, 0, 568, 49);
    else
         backgroundView.frame=CGRectMake(0, 0, 480, 49);

    return [Utlility imageWithView:backgroundView];
}
+(NSString*)getMyProperTableViewCellXib:(NSString*)nibname
{
    if (isIPad)
        return [NSString stringWithFormat:@"%@iPad",nibname];
    return nibname;
}
+(float)getTableViewCellHeight:(NSString*)nibname
{
     UITableViewCell *cell=[[NSBundle mainBundle]loadNibNamed:nibname owner:self options:kNilOptions][0];
    return cell.frame.size.height;
}
+(float)getTableViewCellWidth:(NSString*)nibname;
{
    UITableViewCell *cell=[[NSBundle mainBundle]loadNibNamed:nibname owner:self options:kNilOptions][0];
    return cell.frame.size.width;
}

+(UIView*)getMyTransperentView
{
    UIView *myTransperentView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height )];
    
    myTransperentView.backgroundColor=[UIColor blackColor];
    myTransperentView.alpha=TRANSPERENT_VIEW_ALPHA;
    return myTransperentView;
}
+(BOOL)isNullString:(NSString*)stringObj
{
    if ([stringObj isEqual:[NSNull null]]||[stringObj isEqualToString:@""]) {
        return true;
    }
    return false;
}
+(NSString*)getMyProperStringForm:(NSString*)stringObj
{
    if([stringObj isKindOfClass:[NSNumber class]])
        return [NSString stringWithFormat:@"%@",stringObj];
    else if ([stringObj isEqual:[NSNull null]]||[stringObj isEqualToString:@""])
            return @"";
    return stringObj;

}
+(BOOL)isNullObject:(id)object
{
    if([object isKindOfClass:NULL]||!object || [object isEqual:[NSNull null]])
        return YES;
    else
        return NO;
}
+(NSString *)getCategoryNameAtIndex:(int)index
{
    return @[@"Fish",@"Chicken",@"Mutton",@"Pork",@"Egg",@"Vegitarian",@"Breakfast",@"Bevereage",@"vegan",@"Dessert",@"Couch Snacks"][index];
}

+(NSString *)getProperURLBegning:(NSString*)string
{
    if([[Utlility getMyProperStringForm:string] length]!=0)
    {
        if ([string hasPrefix:@"http://"] || [string hasPrefix:@"https://"]) {
            return string;
        } else {
            return [NSString stringWithFormat:@"http://%@",string];
        }
    }
    else
    {
        return @"";
    }
}

+(void)hideTheScrollViewForMyScrollView:(UIScrollView *)scrollView;
{
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
}
+(void)showMyNetWorkActivityIndicator
{
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
}
+(void)hideMyNetWorkActivityIndicator
{
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = NO;
}

+(NSString*)getmyUniqueNumber
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEyyyy-ssMM-ssdd-ssMMMMHH:mm:ssEEE,MMMd";
    NSString *s=[dateFormatter stringFromDate:[NSDate date]];
    return [[NSString stringWithFormat:@"%d%@%d%@",rand(),s,rand(),s] MD5];
}
+(NSString*)getAppStoreLink
{
    return [NSString stringWithFormat:@"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@&mt=8",APP_STORE_ID];
}
+(BOOL)isFolderInThatName:(NSString*)folderName
{
    NSString* documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                  NSUserDomainMask,
                                                                  YES)[0];
    NSString *folder = [documentsPath stringByAppendingPathComponent:folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return [fileManager fileExistsAtPath:folder];
    
}
+(BOOL)createFolderifNotExists:(NSString*)folderName
{
    NSString* documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                  NSUserDomainMask,
                                                                  YES)[0];
    NSString *folder = [documentsPath stringByAppendingPathComponent:folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    if (![fileManager fileExistsAtPath:folder]){
        [fileManager createDirectoryAtPath:folder
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:&error];
        if (error) {
            return NO;
        }
    }
       return YES;
}
+(NSString*)returnMyPathForThisFolder:(NSString*)folderName
{
if(![Utlility isFolderInThatName:folderName])
{
    [Utlility createFolderifNotExists:folderName];
}
    NSString* documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                  NSUserDomainMask,
                                                                  YES)[0];
    NSString *folder = [documentsPath stringByAppendingPathComponent:folderName];
    return folder;
}
+ (void)saveImage: (UIImage*)image withFileName:(NSString*)filename andPath:(NSString*)path
{
    if (image != nil)
    {
        NSString* fullUrl = [path stringByAppendingPathComponent:
                          filename];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:fullUrl atomically:YES];
    }
    
}
+ (void)savedata: (NSData*)data withFileName:(NSString*)filename andPath:(NSString*)path
{
    if (data != nil)
    {
        NSString* fullUrl = [path stringByAppendingPathComponent:
                             filename];
        [data writeToFile:fullUrl atomically:YES];
    }
    
}
+ (UIImage*)loadImageFromPath:(NSString*)filePathAlongWithName
{
    UIImage* image = [UIImage imageWithContentsOfFile:filePathAlongWithName];
    return image;
}
+ (UIImage*)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    
    float heightToWidthRatio = image.size.height / image.size.width;
    float scaleFactor = 1;
    if(heightToWidthRatio > 0) {
        scaleFactor = newSize.height / image.size.height;
    } else {
        scaleFactor = newSize.width / image.size.width;
    }
    
    CGSize newSize2 = newSize;
    newSize2.width = image.size.width * scaleFactor;
    newSize2.height = image.size.height * scaleFactor;
    
    UIGraphicsBeginImageContext(newSize2);
    [image drawInRect:CGRectMake(0,0,newSize2.width,newSize2.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
