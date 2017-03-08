//
//  NSString+WTUUID.m
//  IntelligentLinzi
//
//  Created by 夏宁 on 17/2/15.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSString+WTUUID.h"
#import "SAMKeychain.h"


@implementation NSString (WTUUID)

+ (NSString *)getUUID {
    
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
    NSString *account = @"com.weitac.app.iOS.account";
    NSString *strApplicationUUID = [SAMKeychain passwordForService:appName account:account];
    
    if (strApplicationUUID == nil) {
        
        strApplicationUUID  = [self createUUID];
        
        NSError *error = nil;
        SAMKeychainQuery *query = [[SAMKeychainQuery alloc] init];
        query.service = appName;
        query.account = account;
        query.password = strApplicationUUID;
        query.synchronizationMode = SAMKeychainQuerySynchronizationModeNo;
        [query save:&error];
    }
    
    return strApplicationUUID;
}

+ (NSString *)createUUID {
    
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef cfuuid = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    CFRelease(uuidRef);
    NSString *uuid = [((__bridge NSString *) cfuuid) copy];
    CFRelease(cfuuid);
    
    return uuid;
}

@end
