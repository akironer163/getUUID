//
//  NSString+WTUUID.h
//  IntelligentLinzi
//
//  Created by 夏宁 on 17/2/15.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (WTUUID)

/**
 获取设备UUID

 @return 设备UUID
 */
+ (NSString *)getUUID;



/*
 获取UUID，并且保存到钥匙串，即使用户删了应用，下载再安装时，获取的还是相同的UUID
 不过得依赖第三方框架：SAMKeychain，这个框架是封装苹果提供的操作钥匙串接口的
 */

@end
