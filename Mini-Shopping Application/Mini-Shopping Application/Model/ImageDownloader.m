//
//  ImageDownloader.m
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 23/05/23.
//
#import "ImageDownloader.h"

@implementation ImageDownloader

+ (void)downloadProductImageWithURL:(NSString *)url completion:(void (^)(UIImage * _Nonnull, NSError * _Nonnull))completion {
    NSURL *imageURL = [[NSURL alloc] initWithString:url];
    NSURLSessionDataTask *sessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^
                                  (NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image = nil;
        if (data) {
            image = [UIImage imageWithData:data];
        } else if (error) {
            return;
        }
        completion(image, error);
    }];
    [sessionDataTask resume];
}

@end
