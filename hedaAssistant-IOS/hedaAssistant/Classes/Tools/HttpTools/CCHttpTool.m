//
//  CCHttpTool.m
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "CCHttpTool.h"

@implementation CCHttpTool : NSObject


+(void)GET:(NSString *)URLString
parameters:(id)parameters
success:(void (^)(id responseObject))success
failure:(void (^)(NSError *error))failure{

//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//    NSURLRequest *request =[[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
//
//
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
//            failure(error);
//        } else {
//            success(responseObject);
//        }
//    }];
//    [dataTask resume];




    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;


    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];

    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {


    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failure(error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;

        

    }];

}



+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure{

//    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager=[[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
//
//    NSURLRequest *request=[[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
//
//    NSURLSessionDataTask *dataTask=[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//
//        if (error) {
//            
//            failure(error);
//        }else{
//
//            success(responseObject);
//        }
//    }];
//
//    [dataTask resume];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    


    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];

    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {


    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;

        


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failure(error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;

        

    }];

}





+(void)upload:(NSString *)URLString parmameters:(id)parmameters progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure{

    //    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:URLString]];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];


    [manager POST:URLString parameters:parmameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {


    } progress:^(NSProgress * _Nonnull uploadProgress) {


    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}




+(void)download:(NSString *)URLString destination:(NSString *)destinationURLString parmameters:(id)parmameters progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure{


       NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:URLString]];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];



    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {



        NSLog(@"progress %f",downloadProgress.fractionCompleted);

    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {



        return targetPath;

    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {


    }];
    [task resume];
}






@end
