//
//  CCHttpTool.h
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface CCHttpTool : NSObject

+(void)GET:(NSString *)URLString
    parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;


+ (void)POST:(NSString *)URLString
     parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;


+(void)download:(NSString *)URLString
                destination:(NSString *)destinationURLString
                parmameters:(id)parmameters
                progress:(void (^)(id progress)) progress
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;


+(void)upload:(NSString *)URLString
    parmameters:(id)parmameters
       progress:(void (^)(id progress)) progress
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;




@end
