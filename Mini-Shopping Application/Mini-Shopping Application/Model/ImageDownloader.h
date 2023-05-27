//
//  ImageDownloader.h
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 23/05/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageDownloader : NSObject

+ (void)downloadProductImageWithURL:(NSString *)url completion:(void (^)(UIImage * _Nonnull, NSError * _Nonnull))completion;

@end

NS_ASSUME_NONNULL_END
